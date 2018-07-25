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
import com.naver.house.bean.AptComplexBean2;
import com.naver.house.service.ApartmentService;

@Controller
public class ApartmentController {
	
	@Autowired
	private ApartmentService service;

	@RequestMapping(value="/aptSearch.com")
	public String aptSearch() {

		
		
		return "aptSearch/search";
	}
	
	@RequestMapping(value = "/aptsearch_list.com")
	public ModelAndView aptList(@RequestParam(value = "page", defaultValue = "1")int page, 
			@RequestParam("sel1") String sido,
			@RequestParam("sel2") String gu, @RequestParam("sel3") String dong,
			HttpServletRequest request, HttpServletResponse response
			) {
		
		
		HttpSession session = request.getSession();
		//ajax 에서 정렬 할 조건값을 받아온다.
		String sort = "c.complex_pdate asc";
		
		if(gu != "") {
			gu = " " + gu;
		}
		if(dong != "") {
			dong = " " + dong;
		}
		
		String addr = sido + gu + dong;
		
		System.out.println("주소 : " + addr);
		
		List<AptComplexBean2> aptList = new ArrayList<AptComplexBean2>();
		
		//한페이지에 출력할 레코드 개수
		int limit = 10;
		
		
		//변경된 sort 값이 있는지 확인
		if(session.getAttribute("sort") != null) {
			sort = (String)session.getAttribute("sort").toString();
		}
		
		if(request.getParameter("sort") != null) {
			sort = request.getParameter("sort");
			session.setAttribute("sort", sort);
		}
		
		
		System.out.println("sort 값 : " + sort);
		
		
		//총 아파트 분양수를 가져옴
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
		
		Map<String, String> addrMap = new HashMap<String, String>();
		addrMap.put("sido", sido);
		addrMap.put("gu", gu);
		addrMap.put("dong", dong);
		
		aptListM.addObject("addrMap", addrMap);
		
		
		return aptListM;
	}
	
}
