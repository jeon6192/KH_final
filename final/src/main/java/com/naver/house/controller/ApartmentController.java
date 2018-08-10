package com.naver.house.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.house.bean.AptComplexBean;
import com.naver.house.bean.AptComplexBean2;
import com.naver.house.bean.ExpertBoardBean;
import com.naver.house.service.ApartmentService;
import com.naver.house.service.ExpertBoardService;

@Controller
public class ApartmentController {
	
	@Autowired
	private ApartmentService service;
	@Autowired
	private ExpertBoardService service2;

	@RequestMapping(value="/aptSearch.com")
	public String aptSearch(HttpServletRequest request) {
		
		
		
		AptComplexBean2 newapt = service.getNewApt();
		
		int listcount = service2.getListCount();
		
		System.out.println("게시판 글의 수 는 : "+ listcount);
		
		
		ExpertBoardBean list =  service2.getNewBoard();
		
		request.setAttribute("newapt", newapt);
		request.setAttribute("listcount", listcount);
		request.setAttribute("expert", list);
		
		//System.out.println("제목은 : "+list.getEb_subject());
		return "aptSearch/search";
	}
	
	@RequestMapping(value = "/aptsearch_list.com")
	public ModelAndView aptList(@RequestParam(value = "page", defaultValue = "1")int page, 
			@RequestParam("sel1") String sido,
			@RequestParam("sel2") String gu, @RequestParam("sel3") String dong,
			HttpServletRequest request, HttpServletResponse response
			) {
		
		
		HttpSession session = request.getSession();
		// ajax 로 검색하는  조건이 아닐시 order by 값
		String sort = "c.complex_pdate asc";
		
		
		
		// 검색할때 지역 이름이 띄어쓰기 되있기 때문에 뛰어쓰기해준다. ex) 서울 강남구 개포동
		// 시/도 만으로도 검색이되기때문에 gu 값이 널이면 gu 값을 띄어주지말고 gu 까지 검색했을시 gu 앞에 공백을 넣어준다
		if(gu != "" ) {
			gu = " " + gu;
		}
		
		if(dong != "") {
			dong = " " + dong;
		}
		
		//합친값을 addr 에 넣어준다.
		String addr = sido + gu + dong;
		
		System.out.println("주소 : " + addr);
		
		//조인을해서 뽑아오끼때문에 bean2를 새로 만들어서 받아온다.
		List<AptComplexBean2> aptList = new ArrayList<AptComplexBean2>();
		
		// 마커찍어줄 맵리스트를가져온다.
		List<AptComplexBean>mapList = new ArrayList<AptComplexBean>();
		
		
		//한페이지에 출력할 레코드 개수
		int limit = 10;
		
		
		//변경된 sort 값이 있는지 확인
			
		
		
		// 2. 세션에 솔트가있다면 sort 값을 기본 sort 값에 덮어씌어준다
		if(session.getAttribute("sort") != null) {
			sort = (String)session.getAttribute("sort").toString();
		}
		
		
		// 1. sort 가 param 값을오 넘어오지 않았다면 무시
		// 넘어왔다면 sort 를 세션에 담아준다
		if(request.getParameter("sort") != null) {
			sort = request.getParameter("sort");
			session.setAttribute("sort", sort);
		}
		
		
		System.out.println("sort 값 : " + sort);
		
		
		//총 아파트 분양수를 가져옴 검색 조건으로 양쪽에 % 를 붙여준다.
		int listcount = service.getListCount("%"+addr+"%"); 
		System.out.println("listcount : " + listcount);
		
		//총페이지수
		int maxpage =(listcount + limit - 1)/limit;
		
		//현재 페이지에 보여줄 시작 페이지 수 (1,11,21) 등
		int startpage = ((page-1)/10) * 10 +1;
		
		//현재 페이지에서 보여줄 마지막 페이지수 (10,20,30 등
		int endpage = startpage + 10 -1;
		
		
		if(endpage > maxpage)
		endpage = maxpage;
		
		if(endpage < page)
			page = endpage;
		
		
		HashMap<String, Object> m = new HashMap<String, Object>();
		int startrow =(page-1)*limit + 1;
		int endrow = startrow + limit - 1;
		
		m.put("start", startrow);
		m.put("end", endrow);
		m.put("addr","%"+addr+"%");
		m.put("sort",sort);
		
		System.out.println("addr : " + m.get("addr"));
		aptList = service.getAptList(m);
		mapList = service.getMapList();
		
		
		
		
		
		ModelAndView aptListM = new ModelAndView("aptSearch/search_list");
		if(request.getParameter("state") != null) {
			aptListM.setViewName("aptSearch/search_list2");
		}else {
			aptListM.setViewName("aptSearch/search_list");
		}
		
		aptListM.addObject("page",page);
		aptListM.addObject("maxpage",maxpage);
		aptListM.addObject("startpage",startpage);
		aptListM.addObject("endpage",endpage);
		aptListM.addObject("listcount",listcount);
		aptListM.addObject("aptList",aptList);
		aptListM.addObject("mapList",mapList);
		
		Map<String, String> addrMap = new HashMap<String, String>();
		addrMap.put("sido", sido);
		addrMap.put("gu", gu);
		addrMap.put("dong", dong);
		
		aptListM.addObject("addrMap", addrMap);
		
		
		return aptListM;
	}
	
}
