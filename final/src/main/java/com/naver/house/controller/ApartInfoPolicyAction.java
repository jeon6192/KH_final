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

import com.naver.house.bean.ApartInfoPolicyBean;
import com.naver.house.service.ApartInfoPolicyService;


@Controller
public class ApartInfoPolicyAction {
	
	@Resource(name="infoPolicyService")
	private ApartInfoPolicyService infoPolicyService;
	
	private String saveFolder = "C:\\Users\\user1\\git\\KH_final2\\final\\src\\main\\webapp\\resources\\upload\\";
	
	
	@RequestMapping(value="/infoPolicy_write.nhn")
	public String infoPolicy_wirte() {
		return "infoPolicy/infoPolicy_write";	
	}
	
	
	 @RequestMapping(value="/infoPolicy_write_ok.nhn", method=RequestMethod.POST)
	   public String infoPolicy_write_ok(ApartInfoPolicyBean infoPolicybean) throws Exception{
	      MultipartFile uploadfile = infoPolicybean.getUploadfile();
	      if(!uploadfile.isEmpty()) {
	         
	         //원래 파일명 구해오기
	         String fileName = uploadfile.getOriginalFilename();
	         
	       ///원래 파일명 저장
	         infoPolicybean.setINFO_POLICY_ORIGINAL(fileName);
	         
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
	         String refileName="infoPolicy"+year+month+date+random+"."+fileExtension;
	         System.out.println("refileName = " + refileName);
	         
	       //오라클 디비에 저장될 레코드 값
	         String fileDBName = "/"+year+"-"+month+"-"+date+"/"+refileName;
	         System.out.println("fileDBName = " + fileDBName);
	         
	       //transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
	         uploadfile.transferTo(new File(saveFolder + fileDBName));
	         
	       //바뀐 파일명으로 저장
	         infoPolicybean.setINFO_POLICY_FILE(fileDBName);
	      }
	      this.infoPolicyService.insertInfoPolicy(infoPolicybean);
	      return "redirect:infoPolicy_list.nhn";
	   }

	
	@RequestMapping(value="/infoPolicy_list.nhn")
	public ModelAndView infoPolicy_list(
			/*@RequestParam(value = "page", defaultValue = "1") int page,*/
			HttpServletRequest request) throws Exception {
		List<ApartInfoPolicyBean> infoPolicylist = new ArrayList<ApartInfoPolicyBean>();
	
		int limit = 5;//목록 보기 초기값
		int listcount = infoPolicyService.getListCount();// 총 리스트 수를 받아옴
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
		
		System.out.println("총 게시물 수 : "+infoPolicyService.getListCount());

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
		infoPolicylist = infoPolicyService.getInfoPolicyList(m);

		ModelAndView infoPolicyListM = new ModelAndView("infoPolicy/infoPolicy_list");
		infoPolicyListM.addObject("page", page);
		infoPolicyListM.addObject("limit", limit);
		infoPolicyListM.addObject("maxpage", maxpage);
		infoPolicyListM.addObject("startpage", startpage);
		infoPolicyListM.addObject("endpage", endpage);
		infoPolicyListM.addObject("listcount", listcount);
		infoPolicyListM.addObject("infoPolicylist", infoPolicylist);

		return infoPolicyListM;
	}
	
	/* 게시판 내용보기, 삭제품, 수정폼, 답변달기폼 */
	
	 @RequestMapping(value = "/infoPolicy_cont.nhn")
	   public ModelAndView infoPolicy_cont(@RequestParam("infoPolicy_num") int infoPolicy_num, @RequestParam("page") int page, @RequestParam("listpage") int listpage, 
	         @RequestParam("state") String state, HttpServletRequest request) throws Exception {
		 if (state.equals("cont")) {
	         infoPolicyService.infoPolicyHit(infoPolicy_num);

	      }
		 
		 List<ApartInfoPolicyBean> infoPolicylist = new ArrayList<ApartInfoPolicyBean>();
		 
		 int limit = 5;
		 int listcount = infoPolicyService.getListCount();
		 HttpSession session = request.getSession();
		 
		 if(request.getParameter("listpage") != null) {
			 listpage = Integer.parseInt(request.getParameter("listpage"));
			}
		 
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
		 
			int maxpage = (listcount + limit - 1) / limit;

			int startpage = ((listpage - 1) / 10) * 10 + 1;

			int endpage = startpage + 10 - 1;
			
			if (endpage > maxpage)
				endpage = maxpage;

			if (endpage < listpage)
				listpage = endpage;
			
		 ApartInfoPolicyBean infoPolicy = infoPolicyService.getInfoPolicyCont(infoPolicy_num);
		 
		 
		 System.out.println("listpage="+listpage);
			Map m = new HashMap();
			m.put("page", listpage);
			m.put("limit", limit);
			infoPolicylist = infoPolicyService.getInfoPolicyList(m);

	      ModelAndView contM = new ModelAndView();
	      contM.addObject("infoPolicy", infoPolicy);
	      contM.addObject("page", page);
		contM.addObject("maxpage", maxpage);
		contM.addObject("startpage", startpage);
		contM.addObject("endpage", endpage);
		contM.addObject("listcount", listcount);
		 contM.addObject("listpage", listpage);
		contM.addObject("infoPolicylist", infoPolicylist);

	      if (state.equals("cont")) {// 내용보기일때
	         contM.setViewName("infoPolicy/infoPolicy_cont");// 내용보기 페이지 설정
	      } else if (state.equals("edit")) {// 수정폼
	         contM.setViewName("infoPolicy/infoPolicy_edit");
	      } else if (state.equals("del")) {// 삭제폼
	         contM.setViewName("infoPolicy/infoPolicy_del");
	      }
	      
	      

	      return contM;
	   }
	
	
	@RequestMapping(value="/infoPolicy_download.file",method={RequestMethod.GET})
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
				+ URLEncoder.encode(originalFileName, "UTF-8") +"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
	
	/*게시판 수정*/
	@RequestMapping(value="/infoPolicy_edit_ok.nhn",method=RequestMethod.POST)
	public ModelAndView infoPolicy_edit_ok(ApartInfoPolicyBean infoPolicybean,
			@RequestParam int page,
			HttpServletResponse response) throws Exception{
		System.out.println(page);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		int infoPolicy_num = infoPolicybean.getINFO_POLICY_NUM();
		System.out.println("게시글 번호 : "+infoPolicy_num);
		
		//디비로 부터 내용을 가져옴
		ApartInfoPolicyBean icont = this.infoPolicyService.getInfoPolicyCont(infoPolicy_num);
		
			MultipartFile uploadfile = infoPolicybean.getUploadfile();
			
			if(!uploadfile.isEmpty()) {
				File DelFile = new File(saveFolder+icont.getINFO_POLICY_FILE());
				if(DelFile.exists()) {
					DelFile.delete(); //기존 이진파일을 삭제
				}
				String fileName = uploadfile.getOriginalFilename();
				infoPolicybean.setINFO_POLICY_ORIGINAL(fileName);
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
		         String refileName="infoPolicy"+year+month+date+random+"."+fileExtension;
		         System.out.println("refileName = " + refileName);
		         
		       //오라클 디비에 저장될 레코드 값
		         String fileDBName = "/"+year+"-"+month+"-"+date+"/"+refileName;
		         System.out.println("fileDBName = " + fileDBName);
		         
		       //transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다. 
		         uploadfile.transferTo(new File(saveFolder + fileDBName));
		       //바뀐 파일명으로 저장
		         infoPolicybean.setINFO_POLICY_FILE(fileDBName);
			}
			this.infoPolicyService.editInfoPolicy(infoPolicybean);
			
			//get방식으로 3개의 파라미터 값이 넘어갑니다.
			response.sendRedirect("infoPolicy_cont.nhn?state=cont&page="+page+"&infoPolicy_num="+infoPolicy_num);
		return null;
	}
	
	/*게시판 삭제*/
	@RequestMapping(value="/infoPolicy_del_ok.nhn", method=RequestMethod.POST)
	public ModelAndView infoPolicy_delete(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("infoPolicy_num") int infoPolicy_num,
			@RequestParam("page") int page) throws Exception{
		
		System.out.println(page);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		ApartInfoPolicyBean infoPolicybean = this.infoPolicyService.getInfoPolicyCont(infoPolicy_num);
		String fname = infoPolicybean.getINFO_POLICY_FILE();
		
			if(fname != null) {//기존 이진파일이 존재한다면
				File file = new File(saveFolder+fname);
				file.delete();//서버 폴더로부터 기존 이진파일을 삭제합니다.
			}
			infoPolicyService.deleteInfoPolicy(infoPolicy_num);
			response.sendRedirect("infoPolicy_list.nhn?page="+page);	
		
		return null;
	}
	
	/*자료실 검색 목록*/
	@RequestMapping(value="/infoPolicy_find_ok.nhn",method=RequestMethod.GET)
	public ModelAndView infoPolicy_find_ok(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="page",defaultValue="1") int page,
			@RequestParam("find_name") String find_name,
			@RequestParam("find_field") String find_field) throws Exception{
		
				int limit = 10;
				
				Map m = new HashMap();
				m.put("page", page);
				m.put("find_field", find_field);
				m.put("find_name", "%"+find_name+"%");
				int listcount = this.infoPolicyService.getListCount3(m);
				
				//총 페이지 수
				int maxpage = (listcount + limit - 1) / limit;

				int startpage = ((page - 1) / 10) * 10 + 1;

				int endpage = startpage + 10 - 1;

				if (endpage > maxpage)
					endpage = maxpage;

				if (endpage < page)
					page = endpage;

				List<ApartInfoPolicyBean> infoPolicylist = infoPolicyService.getInfoPolicyList3(m);
				ModelAndView model = new ModelAndView("infoPolicy/infoPolicy_find");
				model.addObject("find_name", find_name);
				model.addObject("find_field", find_field);
				model.addObject("page", page);
				model.addObject("maxpage", maxpage);
				model.addObject("startpage", startpage);
				model.addObject("endpage", endpage);
				model.addObject("listcount", listcount);
				model.addObject("infoPolicylist", infoPolicylist);

				return model; 
				
			}
}
