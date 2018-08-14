package com.naver.house.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.AptComplexBean;
import com.naver.house.bean.Event_list;
import com.naver.house.bean.Event_winBean;
import com.naver.house.bean.Event_winBean2;

@Repository
public class EventDAOImpl {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	

	/* 분양 현황 상세정보 */
	public List<Event_list> getEventlist(int no) {
		List<Event_list> list = new ArrayList<Event_list>();
		list = sqlsession.selectList("Event_playlist", no);
		return list;
	}

	// 분양이 끝난 아파트의 분양 신청자들
	public List<Event_list> getEventlistclose(int no){
		List<Event_list> list = new ArrayList<Event_list>();
		list = sqlsession.selectList("Event_closelist",no);
		return list;
	}

	// 분양중인 아파트의 분양 신청자들
	public List<Event_list> getEventlistplay(int no){
		List<Event_list> list = new ArrayList<Event_list>();
		list = sqlsession.selectList("Eventlistplay",no);
		return list;
	}

	// 아파트 전체명단 리스트
	public List<AptComplexBean> getAPTList(){
		
		List<AptComplexBean> list = new ArrayList<AptComplexBean>();
		list = sqlsession.selectList("apt_list");
		return list;
	}

	// 분양중인 아파트 명단 리스트
	public List<AptComplexBean> getAPTlistplay(){
		List<AptComplexBean> list = new ArrayList<AptComplexBean>();
		list = sqlsession.selectList("apt_list_play");
		return list;
	}

	// 분양끝난 아파트 명단 리스트
	public List<AptComplexBean> getAPTlistclose(){
		List<AptComplexBean> list = new ArrayList<AptComplexBean>();
		list = sqlsession.selectList("apt_list_end");
		return list;
	}
	
	public ApartmentBean getAPT_EventDetail(int no) {
		ApartmentBean apt = new ApartmentBean();
		apt = sqlsession.selectOne("apt_event_detail",no);
		return apt;
	}
	
	public AptComplexBean getComplex_detail(int no) {
		AptComplexBean complex = new AptComplexBean();
		complex = sqlsession.selectOne("apt_event_detail_name",no);
		return complex;
	}
	
	public int getEventlist_count(int no) {
		int count;
		count =sqlsession.selectOne("event_list_count",no);
		return count;
	}
	
	public int getEvent_aptcount(int no) {
		int count;
		count = sqlsession.selectOne("event_aptcount",no);
		return count;
	}
	
	public List<Event_winBean2> getEvent_winlist(HashMap<String,Object> m){
		
		List<Event_winBean2> list = new ArrayList<Event_winBean2>();
		list = sqlsession.selectList("win_search_list",m);
		return list;
	}
	
	public void insertEvent(Event_list event) {	
		sqlsession.insert("insertEvent",event);
	}
	
	public List<AptComplexBean> searchEvnet(HashMap map){
		List<AptComplexBean> list = new ArrayList<AptComplexBean>();
		list = sqlsession.selectList("search_list",map);
		return list;
	}

	public List<ApartmentBean> list_playapt(int no) {
		// TODO Auto-generated method stub
		List<ApartmentBean> list = new ArrayList<ApartmentBean>();
		list = sqlsession.selectList("playlist_apart",no);
		return list;
	}

	public List<Event_list> event_list(int complex_id) {
		List<Event_list> list = new ArrayList<Event_list>();
		list = sqlsession.selectList("event_list",complex_id);
		return list;
	}

	public void insertEvent_win(Event_winBean e) {
		// TODO Auto-generated method stub
		sqlsession.insert("insertEvent_win",e);
	}

	public List<Event_list> event_list_totalcount(int complex_id) {
		// TODO Auto-generated method stub
		List<Event_list> list = new ArrayList<Event_list>();
		list = sqlsession.selectList("event_list_totalcount",complex_id);
		return list;
	}
	
	public void update_win(HashMap m) {
		sqlsession.insert("update_win",m);
	}
	
	public void update_lose(HashMap m) {
		sqlsession.insert("update_lose",m);
	}

	public void update_apart_user_no(HashMap m) {
		// TODO Auto-generated method stub
		sqlsession.update("update_apart_user_no",m);
	}

	public List<Event_winBean2> event_win_list(int complex_id) {
		// TODO Auto-generated method stub
		List<Event_winBean2> list = new ArrayList<Event_winBean2>();
		list =sqlsession.selectList("event_list_win",complex_id);
		return list;
	}

	public void eventwin_up(HashMap m) {
		// TODO Auto-generated method stub
		sqlsession.insert("eventwin_up",m);
	}

	public void eventwin_down(HashMap m) {
		// TODO Auto-generated method stub
		sqlsession.insert("eventwin_down",m);
	}

	public int event_list_state(HashMap m) {
		// TODO Auto-generated method stub
		int num = sqlsession.selectOne("event_list_state",m);
		return num;
	}
	
	public void updateRestartday(HashMap<String,Object> m) {
		sqlsession.update("updateRestartday",m);
	}

	public void updatecomplexstate(int complex_id) {
		// TODO Auto-generated method stub
		sqlsession.update("updateComplexstate",complex_id);
	}
}
