package com.naver.house.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.AptComplexBean;
import com.naver.house.bean.EL_AND_AptBean;
import com.naver.house.bean.EW_AND_AptBean;
import com.naver.house.bean.Event_list;
import com.naver.house.bean.Event_winBean;
import com.naver.house.bean.Option_fBean;
import com.naver.house.bean.Option_nfBean;
import com.naver.house.bean.OptionsInfoBean;
import com.naver.house.bean.OptionsInfoSBean;
import com.naver.house.service.OptionServiceF;

@Controller
public class OptionsAction {
	@Autowired
	private OptionServiceF opserviceF;
	
	@RequestMapping(value="/optionView.op")
	public ModelAndView optionView(HttpServletRequest request)throws Exception{
		ModelAndView oV=new ModelAndView("options/Option_main");
		HttpSession session=request.getSession();
		
		//로그인 시 넘겨줄정보
		int user_no=(Integer) session.getAttribute("user_no");
		AptComplexBean aptX;
		System.out.println("?????????????1");
		//신청 했던 목록
		List<Event_winBean> event_con=opserviceF.checkWinner(user_no); //event_win에 state 0 인 리스트 가져옴
		
		System.out.println("?????????????2");
		
		List<Event_list> event_inlist=opserviceF.checkEventIn(user_no);
		
		System.out.println("?????????????3");
		System.out.println("사이즈 : " + event_inlist.size());
		
		if(event_inlist.size()!=0) {
			System.out.println("신청한 것 목록 잇음");
			List<EL_AND_AptBean> EList;
			EList=opserviceF.getEventInList(user_no);
			for(EL_AND_AptBean b: EList) {
				aptX=opserviceF.getAptXinfo(b.getComplex_id());
				b.setComplex_state(aptX.getComplex_state());
				b.setComplex_address(aptX.getComplex_address());
				b.setComplex_edate(aptX.getComplex_edate());
				b.setComplex_apartname(aptX.getComplex_apartname());
			}
			oV.addObject("EventInList",EList);
			oV.addObject("eventIn_con",1);
		}else {
			System.out.println("없어요?");
			oV.addObject("eventIn_con",0);
		}
		
		if(event_con.size()!=0) {
			//당첨 확정
			System.out.println("당첨123자맞음ㅋㅋ");
			List<EW_AND_AptBean> winList;
			winList=opserviceF.getWinList(user_no); 
			for(EW_AND_AptBean a:winList){
				aptX=opserviceF.getAptXinfo(a.getComplex_id());
				a.setComplex_address(aptX.getComplex_address());
				a.setComplex_apartname(aptX.getComplex_apartname());
				a.setComplex_edate(aptX.getComplex_edate());
			}
			oV.addObject("winList",winList); //List들 보여줌
			oV.addObject("event_con",1);

		}else {
			oV.addObject("event_con",0);
		}
		
		return oV;
	}
	
	@RequestMapping(value="/option.op")
	public ModelAndView optionpage(HttpServletRequest request,HttpServletResponse response, @RequestParam(value="apt_id", defaultValue="-1") long apt_id)throws Exception {
		//??신청 기간 후 조회만 가능하게 함?
		
		ModelAndView mv=new ModelAndView( "options/Option_insert");
		HttpSession session = request.getSession();
		PrintWriter out=response.getWriter();
		
		if(apt_id==-1) {
			out.println("<script>");
			out.println("alert('당첨 정보 없음')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		int user_no=(Integer) session.getAttribute("user_no");
				
				//신청 한 적 있는지 확인
				int first_check=opserviceF.checkFirst(apt_id);
				if(first_check==0) {//옵션 신청 처음->신청 페이지
					mv=new ModelAndView(  "options/Option_insert");
				}else {	//옵션 신청 한 적 있음->조회 페이지
					mv=new ModelAndView(  "options/Option_show");
					Option_fBean freeOp=opserviceF.getFreeOp(apt_id);
					Option_nfBean nfreeOp=opserviceF.getNfreeOp(apt_id);
					mv.addObject("freeOp",freeOp);
					Gson gson=new Gson(); //gson으로 객체들 json타입 만들어 주기
					
					String foJson=gson.toJson(freeOp);
					String nfoJson=gson.toJson(nfreeOp); 
					
					mv.addObject("foJson",foJson);
					mv.addObject("nfoJson",nfoJson);
					mv.addObject("nfreeOp",nfreeOp);
				}
				ApartmentBean apartinfo=opserviceF.getAptInfo(apt_id);
				mv.addObject("apartinfo",apartinfo);//아파트 정보 보냄
			
				long apart_xid=apartinfo.getComplex_id();
				AptComplexBean apartXinfo=opserviceF.getAptXinfo(apart_xid); //����Ʈ complex���� ������
				mv.addObject("apartXinfo",apartXinfo);//x정보도 보냄
				mv.addObject("area",apartinfo.getApart_area());
				
		
		return mv;
	}
	
	@RequestMapping(value="/options_insert.op")
	public ModelAndView insert_option(HttpServletRequest request, Option_fBean ofbean, Option_nfBean onfbean)throws Exception{
		HttpSession session=request.getSession();
		int user_no=(Integer) session.getAttribute("user_no");
		ofbean.setUser_no(user_no);
		onfbean.setUser_no(user_no);
		
		System.out.println(" ACTION insert 실행");
		int totalcost=Integer.parseInt(request.getParameter("nf_cost"));
		onfbean.setNf_cost(totalcost);
		opserviceF.set_option(ofbean,onfbean); //합침
		
		ModelAndView mv=new ModelAndView( "options/Option_show");
		Gson gson=new Gson();  //gson으로 객체들 json타입 만들어 주기
		
		String foJson=gson.toJson(ofbean);
		String nfoJson=gson.toJson(onfbean); 
		
		mv.addObject("foJson",foJson);
		mv.addObject("nfoJson",nfoJson);
		
		ApartmentBean apartinfo=opserviceF.getAptInfo(user_no); //apart정보 가져옴
		mv.addObject("apartinfo",apartinfo);//아파트 정보 보냄
	
		long apart_xid=apartinfo.getComplex_id();
		AptComplexBean apartXinfo=opserviceF.getAptXinfo(apart_xid); //아파트 complex정보 가져옴
		mv.addObject("apartXinfo",apartXinfo);//보냄
		mv.addObject("area",apartinfo.getApart_area());
		

		return mv;
	}
	
	@RequestMapping(value="/options_update.op")
	public ModelAndView update_option(HttpServletRequest request, Option_fBean ofbean, Option_nfBean onfbean)throws Exception{
		HttpSession session=request.getSession();
		int user_no=(Integer) session.getAttribute("user_no");
		ofbean.setUser_no(user_no);
		onfbean.setUser_no(user_no);
		
		System.out.println(" ACTION update 실행중");
		/*
		 * int totalcost=Integer.parseInt(request.getParameter("nf_cost"));
		onfbean.setNf_cost(totalcost);
		*/
		opserviceF.set_optionupdate(ofbean,onfbean); 
		ModelAndView mv=new ModelAndView("options/Option_show");
		Gson gson=new Gson(); //gson으로 객체들 json타입 만들어 주기
		
		String foJson=gson.toJson(ofbean);
		String nfoJson=gson.toJson(onfbean); 
		
		mv.addObject("foJson",foJson);
		mv.addObject("nfoJson",nfoJson);
		
		long apart_id=ofbean.getApart_id();
		ApartmentBean apartinfo=opserviceF.getAptInfo(apart_id); 
		mv.addObject("apartinfo",apartinfo);
	
		long apart_xid=apartinfo.getComplex_id();
		AptComplexBean apartXinfo=opserviceF.getAptXinfo(apart_xid);
		mv.addObject("apartXinfo",apartXinfo);
		mv.addObject("area",apartinfo.getApart_area());
	
		return mv;
	}
	
	@RequestMapping(value="/options_admin.op")
	public ModelAndView Option_admin(HttpServletRequest request,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="searchtype",defaultValue="") String searchtype,
			@RequestParam(value="searchContent",defaultValue="") String searchContent,
			@RequestParam(value="state",defaultValue="") String state
			)throws Exception{
		ModelAndView mv=new ModelAndView("options/Option_adminShow"); 
		ModelAndView mva=new ModelAndView("options/Option_adminShowAJAX");
		
		System.out.println("ajax로 넘어온 값들 " +searchtype + searchContent + page + state );
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("page", page);
		map.put("limit", 10);
		
		List<AptComplexBean> AptXList=null;//가져올 리스트 빈
		int listcount=0;//읽어올 게시글 갯수
		
		map.put("searchtype", searchtype);
		map.put("searchContent", "%"+searchContent+"%");
		
		listcount=opserviceF.getListCount(map);
		AptXList=opserviceF.getAptXList(map);		
		
		int limit=10;
		 //페이징처리
	 	int maxpage=(listcount+limit-1)/limit;
	   int startpage=((page-1)/10)*10+1;
	   int endpage= startpage+10-1;
	   if(endpage>maxpage) endpage=maxpage;
	   if(endpage<page) page=endpage;
	   
		 //리스트 
		mv.addObject("AptXList",AptXList);
		
		mv.addObject("endpage",endpage);
		mv.addObject("startpage",startpage);
		mv.addObject("listcount",listcount);
		  mv.addObject("maxpage",maxpage);
		  mv.addObject("page",page);
		  mv.addObject("searchtype",searchtype);
		  mv.addObject("searchContent",searchContent);
		  mv.addObject("state",state);
		  
		  if(state.equals("'ajax'")) {
			  System.out.println("에이젝스실행하라굿");
			  	mva.addObject("AptXList",AptXList);
				mva.addObject("endpage",endpage);
				mva.addObject("startpage",startpage);
				mva.addObject("listcount",listcount);
				 mva.addObject("maxpage",maxpage);
				 mva.addObject("page",page);
				 mva.addObject("searchtype",searchtype);
				 mva.addObject("searchContent",searchContent);
				 mva.addObject("state",state);
			  	return mva;
		  }
		  return mv;
	}
	
	
	@RequestMapping(value="/downoptions.op")
	public void optionfiledown (HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="aptXid",defaultValue="0") int complex_id) throws Exception{
		
		System.out.println(request.getContextPath());
		
		String filePath="C:\\Users\\LG\\Desktop\\spring_workspace\\final\\src\\main\\webapp\\resources\\optionfiles\\";

		//List<dataType> data="데이터 담을 리스트";
		
		AptComplexBean aptname=opserviceF.getAptXinfo(complex_id);
		String aptname2=aptname.getComplex_apartname();
		aptname2=aptname2.trim();
		//페이지에 찍어보기
		
		ModelAndView mv=new ModelAndView( "options/checkDONGS");
		
		List<OptionsInfoBean> opb=new ArrayList<OptionsInfoBean>(); //가져온 정보들
		opb =opserviceF.getOptionInfo(complex_id);
		
		//동 종류 가져오기
		
		List<OptionsInfoSBean> opsb=new ArrayList<OptionsInfoSBean>(); //저장하고 뿌릴 정보들 ->동 개수 만큼 만들기
		Set<Integer> infoSet = new HashSet<Integer>();
		
		
		List<Integer> dongs = opserviceF.getDongInfo(complex_id);
		//int dongsCount=dongs.size();
		
		Map<String, List<OptionsInfoSBean>> dongsOptionList=new HashMap<String, List<OptionsInfoSBean>>();
		
		
		for(int dong: dongs) {
			dongsOptionList.put("dongs"+dong, new ArrayList<OptionsInfoSBean>());
	
		}
		
//25개 --14개
		//complex에서  cxid, 아파트이름 , 주소 가져와야함
		
		
		for(OptionsInfoBean eachBean: opb) {
			
			OptionsInfoSBean ex1=new OptionsInfoSBean();
			ex1.setUser_no(eachBean.getUser_no());
			ex1.setTel(eachBean.getTel());
			ex1.setApart_id(eachBean.getApart_id());
			ex1.setComplex_id(complex_id);
			ex1.setComplex_apartname(aptname.getComplex_apartname());
			ex1.setAddress(aptname.getComplex_address());
			ex1.setApart_dong(eachBean.getApart_dong());
			ex1.setApart_ho(eachBean.getApart_ho());
			ex1.setApart_area(eachBean.getApart_area());
			ex1.setF_opkey(eachBean.getF_opkey());
			ex1.setNf_opkey(eachBean.getNf_opkey());
			ex1.setNf_cost(eachBean.getNf_cost());
			ex1.setSys_air(eachBean.getSys_air());
			
			if(eachBean.getBedroom_closet()==1)
				ex1.setBedroom_closet("있음");
			else
				ex1.setBedroom_closet("없음");
			
			if(eachBean.getKitchen_height()==1)
				ex1.setKitchen_height("기본형(85cm)");
			else
				ex1.setKitchen_height("높은형(90cm)");
			
			if(eachBean.getBalcony()==1)
				ex1.setBalcony("확장");
			else
				ex1.setBalcony("비확장");
			
			
			if(eachBean.getInterior_color()==1)
				ex1.setInterior_color("A타입 ");
			else
				ex1.setInterior_color("B타입");
			
			if(eachBean.getFloor_type()==1) {
				ex1.setFloor_type("원목 마루");
			}else if(eachBean.getFloor_type()==2) {
				ex1.setFloor_type("유광 원목 마루");
			}else
				ex1.setFloor_type("선택 없음");
			
			System.out.println("!!!!메인룸슬라이드 확인 " + "apartid는  " + eachBean.getApart_id() + " 결과는 " +  eachBean.getMain_room_slide());
			if(eachBean.getMain_room_slide()==1) {
				ex1.setMain_room_slide("수납 강화형");
			}else if(eachBean.getMain_room_slide()==2) {
				ex1.setMain_room_slide("TV장형 ");
			}else {
				ex1.setMain_room_slide("선택 없음");
			}
			
			if(eachBean.getDressroom()==1) {
				ex1.setDressroom("쇼룸형");
			}else {
				ex1.setDressroom("드레스룸 없음");
			}
			
			if(eachBean.getCooktop()==1)
				ex1.setCooktop("기본 형");
			else if(eachBean.getCooktop()==2)
				ex1.setCooktop("하이브리드 쿡탑");
			else
				ex1.setCooktop("선택 없음");
		
			
			if(eachBean.getKitchen_shelf()==2)
				ex1.setKitchen_shelf("기본 형");
			else if(eachBean.getKitchen_shelf()==1)
				ex1.setKitchen_shelf("캐슬미드웨이 선반");
			else 
				ex1.setKitchen_shelf("선택 없음");
			
			if(eachBean.getBuiltin_ref()==1)
				ex1.setBuiltin_ref("일반형");
			else if(eachBean.getBuiltin_ref()==1)
				ex1.setBuiltin_ref("판넽 부착형");
			else 
				ex1.setBuiltin_ref("선택 없음");
			
			
			if(eachBean.getBuiltin_kref()==1)
				ex1.setBuiltin_kref("있음");
			else
				ex1.setBuiltin_kref("선택 없음");
			
			
			if(eachBean.getShowerbooth()==1)
				ex1.setShowerbooth("있음/욕조대체");
			else
				ex1.setShowerbooth("선택 없음");
			
			
			System.out.println("**19개 돌걸 ?? " + ex1);
			
			for(int d : dongs) {
				if(eachBean.getApart_dong()==d) { //가져온 동이 101 이면
					System.out.println(ex1.getDressroom());
					dongsOptionList.get("dongs"+d).add(ex1); //dongs101으로 접근한 리스트에 추가
				}
			}
			
		}
		
		for(int d:dongs) { /*//dongs [ 101, 102] */ 
		mv.addObject("dong"+d, dongsOptionList.get("dongs"+d));

		System.out.println("dong"+d+","+ dongsOptionList.get("dongs"+d)); 
		System.out.println("dong"+d); // dong 101
		System.out.println(dongsOptionList.get("dongs"+d)); //dong101 가지고 map 접근해서 List 주소값 가져오기
		System.out.println("--------------------------------------");
		}
	
		
		XSSFWorkbook workbook= new XSSFWorkbook();
		ArrayList<String > columnList=new ArrayList<String>();
		columnList.add("유저 번호");
		columnList.add("유저 전화 번호");
		columnList.add("아파트 ID(채)");
		columnList.add("아파트 CXID(건물)");
		columnList.add("아파트 이름");
		columnList.add("주소");
		columnList.add("동");
		columnList.add("호");
		columnList.add("m²");
		columnList.add("옵션 무상 key");
		columnList.add("붙박이장");
		columnList.add("주방 높이");
		columnList.add("발코니");
		columnList.add("인테리어 컬러");
		columnList.add("옵션 유상 key");
		columnList.add("바닥 마감재");
		columnList.add("안방 슬라이딩 장");
		columnList.add("드레스룸");
		columnList.add("쿡탑");
		columnList.add("주방 특화 선반");
		columnList.add("빌트인 냉장고");
		columnList.add("빌트인 김치 냉장고");
		columnList.add("샤워부스");
		columnList.add("시스템 에어컨(개수)");
		columnList.add("총 비용");
		
		
		XSSFRow row=null;
		XSSFCell cell=null;
		
		
		for(int d : dongs) {
			XSSFSheet sheet=workbook.createSheet(d+"동");
			
			row=sheet.createRow(0);
			for(int j=0;j<columnList.size();j++){
                cell=row.createCell(j);
                cell.setCellValue(String.valueOf(columnList.get(j)));
            }
			
			int i=1;
			for(OptionsInfoSBean b: dongsOptionList.get("dongs"+d)) {
				row= sheet.createRow((short)i);
				i++;
				
	                cell=row.createCell(0);
	                cell.setCellValue(String.valueOf(b.getUser_no()));
	                cell=row.createCell(1);
	                cell.setCellValue(String.valueOf(b.getTel()));
	                cell=row.createCell(2);
	                cell.setCellValue(String.valueOf(b.getApart_id()));
	                cell=row.createCell(3);
	                cell.setCellValue(String.valueOf(b.getComplex_id()));
	                cell=row.createCell(4);
	                cell.setCellValue(String.valueOf(b.getComplex_apartname()));
	                cell=row.createCell(5);
	                cell.setCellValue(String.valueOf(b.getAddress()));
	                cell=row.createCell(6);
	                cell.setCellValue(String.valueOf(b.getApart_dong()));
	                cell=row.createCell(7);
	                cell.setCellValue(String.valueOf(b.getApart_ho()));
	                cell=row.createCell(8);
	                cell.setCellValue(String.valueOf(b.getApart_area()));
	                cell=row.createCell(9);
	                cell.setCellValue(String.valueOf(b.getF_opkey()));
	                cell=row.createCell(10);
	                cell.setCellValue(String.valueOf(b.getBedroom_closet()));
	                cell=row.createCell(11);
	                cell.setCellValue(String.valueOf(b.getKitchen_height()));
	                cell=row.createCell(12);
	                cell.setCellValue(String.valueOf(b.getBalcony()));
	                cell=row.createCell(13);
	                cell.setCellValue(String.valueOf(b.getInterior_color()));
	                cell=row.createCell(14);
	                cell.setCellValue(String.valueOf(b.getNf_opkey()));
	                cell=row.createCell(15);
	                cell.setCellValue(String.valueOf(b.getFloor_type()));
	                cell=row.createCell(16);
	                cell.setCellValue(String.valueOf(b.getMain_room_slide()));
	                cell=row.createCell(17);
	                cell.setCellValue(String.valueOf(b.getDressroom()));
	                cell=row.createCell(18);
	                cell.setCellValue(String.valueOf(b.getCooktop()));
	                cell=row.createCell(19);
	                cell.setCellValue(String.valueOf(b.getKitchen_shelf()));
	                cell=row.createCell(20);
	                cell.setCellValue(String.valueOf(b.getBuiltin_ref()));
	                cell=row.createCell(21);
	                cell.setCellValue(String.valueOf(b.getBuiltin_kref()));
	                cell=row.createCell(22);
	                cell.setCellValue(String.valueOf(b.getShowerbooth()));
	                cell=row.createCell(23);
	                cell.setCellValue(String.valueOf(b.getSys_air()));
	                cell=row.createCell(24);
	                cell.setCellValue(String.valueOf(b.getNf_cost()));
	            
				
			}
					
		}
		
		String fileName=aptname2+".xlsx";
		FileOutputStream fileoutputstream=new FileOutputStream(filePath+fileName);
		workbook.write(fileoutputstream);
		fileoutputstream.close();
		
		request.setCharacterEncoding("utf-8");
		
		byte fileByte[]=FileUtils.readFileToByteArray(new File(filePath+fileName));
				
		
		
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition","attachment;fileName=\""+URLEncoder.encode(fileName, "utf-8")+"\";");
		response.setHeader("Set-Cookie","fileDownload=true;path=/");
		response.setContentType("application/vnd.ms-excel");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
		
	}
	
}
