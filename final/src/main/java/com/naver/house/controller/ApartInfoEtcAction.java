package com.naver.house.controller;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.naver.house.bean.ApartInfoEtcBean;
import com.naver.house.service.ApartInfoEtcService;


@Controller
public class ApartInfoEtcAction {
	
	@Resource(name="infoEtcService")
	private ApartInfoEtcService infoEtcService;
	
	private String saveFolder ="C:\\Users\\user1\\git\\KH_final\\final\\src\\main\\webapp\\resources\\upload";
	
	@RequestMapping(value="/infoEtc_write.nhn")
	public String infoEtc_wirte() {
		return "infoEtc/infoEtc_write";	
	}
	
	
	 @RequestMapping(value="/infoEtc_write_ok.nhn", method=RequestMethod.POST)
	   public String infoEtc_write_ok(ApartInfoEtcBean infoEtcbean, HttpServletRequest request) throws Exception{
	      MultipartFile uploadfile = infoEtcbean.getUploadfile();
	      if(!uploadfile.isEmpty()) {
	         
	         //원래 파일명 구해오기
	         String fileName = uploadfile.getOriginalFilename();
	         
	       ///원래 파일명 저장
	         infoEtcbean.setINFO_ETC_ORIGINAL(fileName);
	         
	       //생성할 폴더 이름 : 오늘 년+월+일
	         Calendar c = Calendar.getInstance();
	         int year = c.get(Calendar.YEAR);
	         int month = c.get(Calendar.MONTH)+1;
	         int date = c.get(Calendar.DATE);
	         String homedir=saveFolder+"/"+year+"-"+month+"-"+date;
	         
	       ///파일 객체 생성합니다.
	         File path1=new File(homedir);
	         
	       //폴더가 존재하는지 확인합니다.
	         if(!(path1.exists())) {
	            System.out.println("폴더를 만듭니다.");
	            path1.mkdir();// 새로운 폴더를 생성
	         }
	         
	       //난수를 구합니다.
	         Random r = new Random();
	         int random=r.nextInt(1000000000);
	         
	         /**** 확장자 구하기 시작 ****/
	         int index = fileName.lastIndexOf(".");
	         /*
				 * 문자열에서 특정 문자열의 위치 값(index)를 반환한다.
				 * indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
				 * lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.
				 * (파일명에 점에 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다.) 
				 */
	         System.out.println("index = " + index);
	         
	         String fileExtension = fileName.substring(index + 1);
	         System.out.println("fileExtension + " + fileExtension);
	         /**** 확장자 구하기 종료 ****/
	         
	       //새로운 파일명을 저장
	         String refileName="infoEtc"+year+month+date+random+"."+fileExtension;
	         System.out.println("refileName = " + refileName);
	         
	       //오라클 디비에 저장될 레코드 값
	         String fileDBName = "/"+year+"-"+month+"-"+date+"/"+refileName;
	         System.out.println("fileDBName = " + fileDBName);
	         
	       //transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
	         uploadfile.transferTo(new File(saveFolder + fileDBName));
	         
	       //바뀐 파일명으로 저장
	         infoEtcbean.setINFO_ETC_FILE(fileDBName);
	      }
	      HttpSession session = request.getSession();
	      int admin_no=(Integer)session.getAttribute("Admin_no");
	      
	      infoEtcbean.setAdmin_no(admin_no);
	      this.infoEtcService.insertInfoEtc(infoEtcbean);
	      return "redirect:infoEtc_list.nhn";
	   }

	
	@RequestMapping(value="/infoEtc_list.nhn")
	public ModelAndView infoEtc_list(
			/*@RequestParam(value = "page", defaultValue = "1") int page,*/
			HttpServletRequest request) throws Exception {
		List<ApartInfoEtcBean> infoEtclist = new ArrayList<ApartInfoEtcBean>();
	
		int limit = 5;//목록 보기 초기값
		int listcount = infoEtcService.getListCount();// 총 리스트 수를 받아옴
		int page = 1;
		HttpSession session = request.getSession();
		System.out.println("limit :" +request.getParameter("limit"));
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		if(session.getAttribute("limit") != null) {
			limit = (Integer)session.getAttribute("limit");
		}
		
		//변경된 limit가 있는지 체크
		if(request.getParameter("limit") != null) {
			limit = Integer.parseInt(request.getParameter("limit"));
			session.setAttribute("limit", limit);
		}
		System.out.println("limit "+limit);
		System.out.println("page "+page);
		
		System.out.println("총 게시물 수 : "+infoEtcService.getListCount());

		int maxpage = (listcount + limit - 1) / limit;

		int startpage = ((page - 1) / 10) * 10 + 1;

		int endpage = startpage + 10 - 1;
		
		if (endpage > maxpage)
			endpage = maxpage;

		if (endpage < page)
			page = endpage;

		Map m = new HashMap();
		m.put("page", page);
		m.put("limit", limit);
		infoEtclist = infoEtcService.getInfoEtcList(m);// ����Ʈ�� �޾ƿ�

		ModelAndView infoEtcListM = new ModelAndView("infoEtc/infoEtc_list");
		infoEtcListM.addObject("page", page);
		infoEtcListM.addObject("limit", limit);
		infoEtcListM.addObject("maxpage", maxpage);
		infoEtcListM.addObject("startpage", startpage);
		infoEtcListM.addObject("endpage", endpage);
		infoEtcListM.addObject("listcount", listcount);
		infoEtcListM.addObject("infoEtclist", infoEtclist);

		return infoEtcListM;
	}
	
	/* 게시판 내용보기, 삭제품, 수정폼, 답변달기폼 */
	
	 @RequestMapping(value = "/infoEtc_cont.nhn")
	   public ModelAndView infoEtc_cont(@RequestParam("infoEtc_num") int infoEtc_num, 
	         @RequestParam("state") String state) throws Exception {
		 if (state.equals("cont")) {
	         infoEtcService.infoEtcHit(infoEtc_num);

	      }
		 ApartInfoEtcBean infoEtc = infoEtcService.getInfoEtcCont(infoEtc_num);
		 int findContRnum = infoEtcService.findContRnum(infoEtc_num);
		 System.out.println("찾고자하는 번호 " + findContRnum);
		 
		 
		 
		 List<ApartInfoEtcBean> RnumPrev = infoEtcService.getRnumPrevNext(findContRnum);
		/*System.out.println("RnumPrev"+RnumPrev.get(0).getINFO_ETC_NUM() +"," + RnumPrev.get(0).getINFO_ETC_SUB());
		System.out.println("RnumPrev"+RnumPrev.get(1).getINFO_ETC_NUM() +"," + RnumPrev.get(1).getINFO_ETC_SUB());
*/
		 
		 int count=infoEtcService.getListCount();
	      ModelAndView contM = new ModelAndView();
	      contM.addObject("infoEtc", infoEtc);
	      contM.addObject("findContRnum", findContRnum);
	      if(findContRnum==1) {
	    	  contM.addObject("RnumPrev",RnumPrev.get(0));
	      }
	      else if(findContRnum==count){
	    	  contM.addObject("RnumNext",RnumPrev.get(0));
	      }else {
	      contM.addObject("RnumPrev",RnumPrev.get(1));
	      contM.addObject("RnumNext",RnumPrev.get(0));
	      }

	      if (state.equals("cont")) {// 내용보기일때
	         contM.setViewName("infoEtc/infoEtc_cont");// 내용보기 페이지 설정
	      } else if (state.equals("edit")) {// 수정폼
	         contM.setViewName("infoEtc/infoEtc_edit");
	      } else if (state.equals("del")) {// 삭제폼
	         contM.setViewName("infoEtc/infoEtc_del");
	      }

	      return contM;
	   }
	
	
	@RequestMapping(value="/infoEtc_download.file",method={RequestMethod.GET})
	public void downloadFile(HttpServletResponse response,
			@RequestParam("path") String storedFileName,
			@RequestParam("original") String originalFileName,
			HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		System.out.println("original = "+ originalFileName);
		
		byte fileByte[] =
				FileUtils.readFileToByteArray(new File(saveFolder+storedFileName));
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""
				+ URLEncoder.encode(originalFileName, "utf-8") +"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
	
	/*게시판 수정*/
	@RequestMapping(value="/infoEtc_edit_ok.nhn",method=RequestMethod.POST)
	public ModelAndView infoEtc_edit_ok(ApartInfoEtcBean infoEtcbean,
			HttpServletResponse response) throws Exception{
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int infoEtc_num = infoEtcbean.getINFO_ETC_NUM();
		System.out.println("게시글 번호 : "+infoEtc_num);
		
		//디비로 부터 내용을 가져옴
		ApartInfoEtcBean icont = this.infoEtcService.getInfoEtcCont(infoEtc_num);
		
			MultipartFile uploadfile = infoEtcbean.getUploadfile();
			
			if(!uploadfile.isEmpty()) {
				File DelFile = new File(saveFolder+icont.getINFO_ETC_FILE());
				if(DelFile.exists()) {
					DelFile.delete(); //기존 이진파일을 삭제
				}
				String fileName = uploadfile.getOriginalFilename();
				infoEtcbean.setINFO_ETC_ORIGINAL(fileName);
				Calendar c = Calendar.getInstance();
				int year = c.get(Calendar.YEAR);
				int month = c.get(Calendar.MONTH)+1;
				int date = c.get(Calendar.DATE);
				String homedir = saveFolder+"/"+year+"-"+month+"-"+date;
				
				//파일 객체 생성합니다.
				File path1 = new File(homedir);
				
				//폴더가 존재하는지 확인합니다.
				if(!(path1.exists())) {
					System.out.println("폴더를 만듭니다.");
					path1.mkdir();// 새로운 폴더를 생성
				}
				//난수를 구합니다.    
		         Random r = new Random();
		         int random=r.nextInt(1000000000);
		         
		         /**** 확장자 구하기 시작 ****/   
		         int index = fileName.lastIndexOf(".");
		         /*                                                        
		          * 문자열에서 특정 문자열의 위치 값(index)를 반환한다.                       
		          * indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,               
		          * lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.             
		          * (파일명에 점에 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다.)        
		          */                                                       
		         System.out.println("index = " + index);
		         
		         String fileExtension = fileName.substring(index + 1);
		         System.out.println("fileExtension + " + fileExtension);
		         
		       //새로운 파일명을 저장  
		         String refileName="infoEtc"+year+month+date+random+"."+fileExtension;
		         System.out.println("refileName = " + refileName);
		         
		       //오라클 디비에 저장될 레코드 값
		         String fileDBName = "/"+year+"-"+month+"-"+date+"/"+refileName;
		         System.out.println("fileDBName = " + fileDBName);
		         
		       //transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다. 
		         uploadfile.transferTo(new File(saveFolder + fileDBName));
		       //바뀐 파일명으로 저장
		         infoEtcbean.setINFO_ETC_FILE(fileDBName);
			}
			this.infoEtcService.editInfoEtc(infoEtcbean);
			
			//get방식으로 3개의 파라미터 값이 넘어갑니다.
			response.sendRedirect("infoEtc_cont.nhn?state=cont&infoEtc_num="+infoEtc_num);
		return null;
	}
	
	/*게시판 삭제*/
	@RequestMapping(value="/infoEtc_del_ok.nhn", method=RequestMethod.POST)
	public ModelAndView infoEtc_delete(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("infoEtc_num") int infoEtc_num)
			 throws Exception{
		
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		ApartInfoEtcBean infoEtcbean = this.infoEtcService.getInfoEtcCont(infoEtc_num);
		String fname = infoEtcbean.getINFO_ETC_FILE();
		
			if(fname != null) {//기존 이진파일이 존재한다면
				File file = new File(saveFolder+fname);
				file.delete();//서버 폴더로부터 기존 이진파일을 삭제합니다.
			}
			infoEtcService.deleteInfoEtc(infoEtc_num);
			response.sendRedirect("infoEtc_list.nhn?page="+1);	
		
		return null;
	}
	
	/*자료실 검색 목록*/
	@RequestMapping(value="/infoEtc_find_ok.nhn",method=RequestMethod.GET)
	public ModelAndView infoEtc_find_ok(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="page",defaultValue="1") int page,
			@RequestParam("find_name") String find_name,
			@RequestParam("find_field") String find_field) throws Exception{
		
				int limit = 5;
				
				Map m = new HashMap();
				m.put("page", page);
				m.put("find_field", find_field);
				m.put("find_name", "%"+find_name+"%");
				int listcount = this.infoEtcService.getListCount3(m);
				
				//총 페이지 수
				int maxpage = (listcount + limit - 1) / limit;

				int startpage = ((page - 1) / 5) * 5 + 1;

				int endpage = startpage + 5 - 1;

				if (endpage > maxpage)
					endpage = maxpage;

				if (endpage < page)
					page = endpage;

				List<ApartInfoEtcBean> infoEtclist = infoEtcService.getInfoEtcList3(m);
				ModelAndView model = new ModelAndView("infoEtc/infoEtc_find");
				model.addObject("find_name", find_name);
				model.addObject("find_field", find_field);
				model.addObject("page", page);
				model.addObject("maxpage", maxpage);
				model.addObject("startpage", startpage);
				model.addObject("endpage", endpage);
				model.addObject("listcount", listcount);
				model.addObject("infoEtclist", infoEtclist);

				return model; 
				
			}
}
