package com.naver.house.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.house.bean.AptComplexBean;
import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.Event_list;
import com.naver.house.bean.Event_winBean;
import com.naver.house.service.EventService;

@Controller
public class EventAction {

	@Autowired
	EventService eventservice;
	
	@RequestMapping(value="/total_eventlist.ev")
	public ModelAndView totallist() {
		List<AptComplexBean> list = new ArrayList<AptComplexBean>();
		
		list = eventservice.getAPTList();
		ModelAndView mv = new ModelAndView("Event/Eventlist");
		mv.addObject("list",list);
		return mv;
	}
	
	@RequestMapping(value="/event_list_play.ev")
	public ModelAndView playlist() {
		List<AptComplexBean> list = new ArrayList<AptComplexBean>();
		
		list = eventservice.getAPTlistplay();
		ModelAndView mv = new ModelAndView("Event/Eventlistplay");
		mv.addObject("list",list);
		return mv;
	}
	
	@RequestMapping(value="/event_list_end.ev")
	public ModelAndView endlist() {
		List<AptComplexBean> list = new ArrayList<AptComplexBean>();
		
		list = eventservice.getAPTlistclose();
		ModelAndView mv = new ModelAndView("Event/Eventlistend");
		mv.addObject("list",list);
		return mv;
	}
	
	@RequestMapping(value="/apartdetail.ev")
	public ModelAndView eventdetail(@RequestParam("complex_id")int id) {
		ApartmentBean apt = new ApartmentBean();
		apt = eventservice.getAPT_EventDetail(id);
		
		AptComplexBean complex = new AptComplexBean();
		complex = eventservice.getComplex_detail(id);
		
		//분양 신청자 수
		int event_list_count = eventservice.getEventlist_count(id);
		//분양 공급 세대 수
		int apt_list_count = eventservice.eventAptcount(id);
		
		ModelAndView mv = new ModelAndView("Event/EventDetail");
		mv.addObject("apt",apt);
		mv.addObject("complex",complex);
		mv.addObject("event_listcount",event_list_count);
		mv.addObject("apt_listcount",apt_list_count);
		return mv;
	}
	
	@RequestMapping(value="/event_win_list.ev")
	public ModelAndView event_win_list(@RequestParam("complex_id")int no) {
		
		List<Event_winBean> list = new ArrayList<Event_winBean>();
		list = eventservice.getEvent_winlist(no);
		ModelAndView mv = new ModelAndView("Event/Event_winlist");
		mv.addObject("win",list);
		return mv;
	}
	
	@RequestMapping(value="/insertEvent.ev")
	public void insertEvent(@RequestParam("complex_id")int complex_id,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int user_no= Integer.parseInt((String) session.getAttribute("user_no"));
		
		Event_list event = new Event_list();
		event.setComplex_id(complex_id);
		event.setUser_no(user_no);
		eventservice.insertEvent(event);
	}
	
	
	@RequestMapping(value="/searchEvent.ev")
	public ModelAndView searchEvent(@RequestParam("state")String state,
								@RequestParam("search")String search,
								@RequestParam("keyword")String keyword,HttpServletRequest request) {

		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("state", state);
		map.put("search",search);
		map.put("keyword","%"+keyword+"%");
		
		
		List<AptComplexBean> list = new ArrayList<AptComplexBean>();
		list=eventservice.searchEvnet(map);
		ModelAndView mv = new ModelAndView();
		if(state.equals("1")) {
		mv.setViewName("Event/Eventlist_ajax");
		}
		
		if(state.equals("2")) {
		mv.setViewName("Event/Eventlistend");
		}
		if(state.equals("3")) {
			mv.setViewName("Event/Eventlistplay");
		}
		
		mv.addObject("list",list);
		return mv;
	}
}
