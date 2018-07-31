package com.naver.house.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.house.bean.ExpertBoardBean;
import com.naver.house.service.ExpertBoardService;

@Controller
public class ExpertBoardController {
	
	@Autowired
	private ExpertBoardService service;
	
	@RequestMapping(value= "/expertBoard_write.com")
	public String expertBoard_write() {
		
		return "expertBoard/expertBoard_write";
	}
	
	@RequestMapping(value="/expertBoard_write_ok.com",method=RequestMethod.POST)
	public String expertBoard_write_ok(
			ExpertBoardBean board){
		
		board.setEb_num(service.boardNum());
		
		service.insertBoard(board);
		
		return "redirect:/expertBoard_list.com";
	}
	
	@RequestMapping(value="/expertBoard_list.com")
	public ModelAndView expertBoard_list(@RequestParam(value = "page", defaultValue = "1") int page)throws Exception{
		
		List<ExpertBoardBean> list = new ArrayList<ExpertBoardBean>();
		
		//한페이지에 출력할 글의 갯수
		int limit = 10;
		
		//총 게시판 글의 수 
		int listcount = service.getListCount();
		
		System.out.println("총 글의 개수  : " + listcount);
		
		//총페이지수 
		int maxpage = (listcount + limit - 1  ) / limit;
		
		//현재 페이지에 보여줄 시작 페이지 수 1,11,21 등
		int startpage = ((page - 1) / 10 ) * 10 + 1;
		
		//현재 페이지에서 보여줄 마지막 페이지수 (10,20,30) 
		int endpage = startpage + 10 - 1;
		
		if(endpage > maxpage)
			endpage = maxpage;
		
		if(endpage < page)
			page = endpage;
		
		HashMap<String, Integer> m = new HashMap<String,Integer>();
		int startrow=(page-1)* limit + 1;
		int endrow=startrow + limit - 1;
		m.put("start", startrow);
		m.put("end", endrow);
		
		list = service.getBoardList(m);
		
		ModelAndView listM = new ModelAndView("expertBoard/expertBoard_list");
		listM.addObject("page",page);
		listM.addObject("maxpage",maxpage);
		listM.addObject("startpage",startpage);
		listM.addObject("endpage",endpage);
		listM.addObject("listcount",listcount);
		listM.addObject("list",list);
		listM.addObject("limit",limit);
		
		System.out.println("리시트차운트 : " + listcount + "  페이지 : " + page + " 리미트 : " + limit);
		
		return listM;
	}
	
	
	@RequestMapping(value="/expertBoard_cont.com")
	public ModelAndView expertBoard_cont(@RequestParam("num") int num,
				@RequestParam(value = "page", defaultValue = "1") int page,
				@RequestParam("state") String state
			){
		
		if(state.equals("cont")) {
			service.expertBoardHit(num);
		}
		ExpertBoardBean ebb = service.getExpertBoardCont(num);
		
		ModelAndView contM = new ModelAndView();
		contM.addObject("bcont",ebb);
		contM.addObject("page",page);
		
		if(state.equals("cont")) {
			contM.setViewName("expertBoard/expertBoard_cont");
		}
		return contM;
	}
	
}
