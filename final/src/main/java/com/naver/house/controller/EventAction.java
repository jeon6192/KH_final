package com.naver.house.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.AptComplexBean;
import com.naver.house.bean.Event_list;
import com.naver.house.bean.Event_winBean;
import com.naver.house.bean.Event_winBean2;
import com.naver.house.service.ApartmentService2;
import com.naver.house.service.EventService;

@Controller
public class EventAction {

	@Autowired
	EventService eventservice;
	@Autowired
	private ApartmentService2 apartmentService;
	
	@RequestMapping(value="/total_eventlist.ev")
	public ModelAndView totallist() {
		List<AptComplexBean> list = new ArrayList<AptComplexBean>();
		
		list = eventservice.getAPTList();
		ModelAndView mv = new ModelAndView("Event/Eventlist");
		mv.addObject("list",list);
		return mv;
	}
	@RequestMapping(value="/event_list_all.ev")
	public ModelAndView eventlistall() {
		List<AptComplexBean> list = new ArrayList<AptComplexBean>();
		
		list = eventservice.getAPTList();
		ModelAndView mv = new ModelAndView("Event/Eventlist_ajax");
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
	public ModelAndView eventdetail(@RequestParam("complex_id")int id) throws Exception {
		
		
		AptComplexBean complex = new AptComplexBean();
		complex = eventservice.getComplex_detail(id);
		
		//분양 신청자 수
		int event_list_count = eventservice.getEventlist_count(id);
		//분양 공급 세대 수
		int apt_list_count = eventservice.eventAptcount(id);
		
		ModelAndView mv = new ModelAndView("Event/EventDetail");
		
		mv.addObject("complex",complex);
		mv.addObject("event_listcount",event_list_count);
		mv.addObject("apt_listcount",apt_list_count);
		
		Map<String, Object> apartMap = apartmentService.detail_complex(id);
		
		List<ApartmentBean> apartmentBeanList = (List<ApartmentBean>) apartMap.get("apartmentBeanList");
		Set<Integer> apartSet = new TreeSet<Integer>();
		for (ApartmentBean apart : apartmentBeanList) {
			apartSet.add(apart.getApart_dong());
		}
		
		List<Integer> dongList = new ArrayList<Integer>();
		for (Integer dong : apartSet) {
			dongList.add(dong);
		}
		
		mv.addObject("apartMap", apartMap);
		mv.addObject("dongList", dongList);
		

		return mv;
	}
	
	@RequestMapping(value="/event_win_search.ev")
	public ModelAndView event_win_search(@RequestParam("complex_id") int complex_id,
			@RequestParam("keyword")String keyword) {
		List<Event_winBean2> list = new ArrayList<Event_winBean2>();
		HashMap<String,Object> m = new HashMap<String,Object>();
		m.put("complex_id", complex_id);
		m.put("keyword","%"+keyword+"%");
		list = eventservice.getEvent_winlist(m);
		ModelAndView mv = new ModelAndView("Event/Event_winlist_ajax");
		mv.addObject("win",list);
		
		return mv;
	}
	@RequestMapping(value="/update_up.ev")
	public void update_up(@RequestParam("apart_id")int apart_id,@RequestParam("user_no")int user_no,HttpServletResponse response) throws Exception {
		HashMap<String,Object> m = new HashMap<String,Object>();
		m.put("apart_id",apart_id);
		m.put("user_no",user_no);
		eventservice.eventwin_up(m);
		PrintWriter out = response.getWriter();
		out.println(1);
	}
	
	@RequestMapping(value="/update_down.ev")
	public void update_down(@RequestParam("apart_id")int apart_id,@RequestParam("user_no")int user_no,HttpServletResponse response) throws Exception {
		HashMap<String,Object> m = new HashMap<String,Object>();
		m.put("apart_id",apart_id);
		m.put("user_no",user_no);
		eventservice.eventwin_down(m);
		PrintWriter out = response.getWriter();
		out.println(1);
	}
	
	@RequestMapping(value="/event_win_list.ev")
	public ModelAndView event_win_list(@RequestParam("complex_id") int complex_id) {
		List<Event_winBean2> list = new ArrayList<Event_winBean2>();
		list = eventservice.event_win_list(complex_id);
		ModelAndView mv = new ModelAndView("Event/Event_winlist");
		mv.addObject("win",list);
		mv.addObject("complex_id",complex_id);
		return mv;
	}
	
	@RequestMapping(value="/insertEvent.ev")
	public void insertEvent(@RequestParam("complex_id")int complex_id,
			HttpServletRequest request,HttpServletResponse response,
			@RequestParam("user_no")int user_no) throws Exception {

		Event_list event = new Event_list();
		event.setComplex_id(complex_id);
		event.setUser_no(user_no);
		eventservice.insertEvent(event);
		PrintWriter out = response.getWriter();
		out.println(1);
	}
	
	
	@RequestMapping(value="/searchEvent.ev")
	public ModelAndView searchEvent(@RequestParam("state")String state,
								
								@RequestParam("keyword")String keyword,HttpServletRequest request) {

		HashMap<String,Object> map = new HashMap<String,Object>();
		String search="2";
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
	
	@RequestMapping(value="/insertEventplay.ev")
	public void insertEventplay(@RequestParam("length1")int length1,@RequestParam("length2")int length2,
			@RequestParam("complex_id")int complex_id,HttpServletResponse response) throws Exception {
		
		
		//분양 신청자 수
		int event_list_count = eventservice.getEventlist_count(complex_id);
		//분양 공급 세대 수
		int apt_list_count = eventservice.eventAptcount(complex_id);
		
		//분양 아파트
		List<ApartmentBean> apt_list = new ArrayList<ApartmentBean>();
		apt_list = eventservice.list_playapt(complex_id);
		
		//분양 신청자들 정보
		List<Event_list> event_list = new ArrayList<Event_list>();
		event_list = eventservice.event_list(complex_id);
	
		
		//공급되는 분양아파트보다 신청자수가 적을경우 100% 당첨
		if(apt_list_count>=event_list_count) {
			
			for(int i=0;i<event_list_count;i++) {
				Event_winBean e = new Event_winBean();
				e.setApart_id(apt_list.get(i).getApart_id());
				e.setEvent_con(0);
				e.setUser_no(event_list.get(i).getUser_no());
				eventservice.insertEvent_win(e);
				
				HashMap<String,Object> m = new HashMap<String,Object>();
				m.put("apart_id",apt_list.get(i).getApart_id());
				m.put("user_no",event_list.get(i).getUser_no());
				eventservice.update_apart_user_no(m);
			}
			
			
			eventservice.updatecomplexstate(complex_id);
			
		//분양된아파트보다 신청자수가 더많을 경우 
		//length1 만큼 무작위뽑기
		//length2 만큼 점수별로 뽑기
			
		}else if(apt_list_count<event_list_count) {
			
			Collections.shuffle(event_list);
			
			//length1만큼 무작위
			
			for(int i=0;i<length1;i++) {
				Event_winBean e = new Event_winBean();
				e.setApart_id(apt_list.get(i).getApart_id());
				e.setEvent_con(0);
				e.setUser_no(event_list.get(i).getUser_no());
				eventservice.insertEvent_win(e);
				

				HashMap<String,Object> m = new HashMap<String,Object>();
				m.put("apart_id",apt_list.get(i).getApart_id());
				m.put("user_no",event_list.get(i).getUser_no());
				eventservice.update_apart_user_no(m);
			}
			
			//무작위 당첨자 제외하고 다시 리스트 불러오기 
			List<ApartmentBean> apt_list2 = new ArrayList<ApartmentBean>();
			apt_list2 = eventservice.list_playapt(complex_id);
			
			List<Event_list> event_list2 = new ArrayList<Event_list>();
			event_list2 = eventservice.event_list_totalcount(complex_id);
			
			//점수별 사람들에게 분양 당첨값 넣어주기
			for(int i=0;i<length2;i++) {
				Event_winBean e = new Event_winBean();
				e.setApart_id(apt_list2.get(i).getApart_id());
				e.setEvent_con(0);
				e.setUser_no(event_list2.get(i).getUser_no());
				eventservice.insertEvent_win(e);
				

				HashMap<String,Object> m = new HashMap<String,Object>();
				m.put("apart_id",apt_list2.get(i).getApart_id());
				m.put("user_no",event_list2.get(i).getUser_no());
				eventservice.update_apart_user_no(m);
			}
			
			
			//나머지 미당첨자들 Event_list테이블에  event_check 상태 불합격으로 바꿔주기
			
			for(int i=length2;i<event_list2.size();i++) {
				HashMap<String,Object> m = new HashMap<String,Object>();
				m.put("complex_id", complex_id);
				m.put("user_no",event_list2.get(i).getUser_no());
				eventservice.update_lose(m);
			}
			eventservice.updatecomplexstate(complex_id);
			
		}
		PrintWriter out = response.getWriter();
		out.println(1);
		
		System.out.println("분양완료~!");
		
		
	}
	

	
	
	@RequestMapping(value="/restartform.ev")
	public ModelAndView restartForm(@RequestParam("complex_id")int complex_id,HttpServletResponse response) throws Exception {
		ModelAndView m = new ModelAndView("Event/EventRestart");
		m.addObject("complex_id",complex_id);
		return m;
	}
	
	@RequestMapping(value="/restartform_ok.ev")
	public void restartAction(@RequestParam("complex_id")int complex_id,
			@RequestParam("pdate")String pdate,
			@RequestParam("edate")String edate,
			@RequestParam("sdate")String sdate,HttpServletResponse response)throws Exception{
		
		
		HashMap<String,Object> m =  new HashMap<String,Object>();
		
		m.put("edate",edate);
		m.put("pdate",pdate);
		m.put("sdate",sdate);
		m.put("complex_id",complex_id);
		eventservice.updateRestartday(m);
		
		
		PrintWriter out = response.getWriter();
		out.println(1);
	}
	
	
	
}
