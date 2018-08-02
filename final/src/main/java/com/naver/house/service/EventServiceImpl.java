package com.naver.house.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.house.bean.AptComplexBean;
import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.Event_list;
import com.naver.house.bean.Event_winBean;
import com.naver.house.dao.EventDAOImpl;

@Service
public class EventServiceImpl implements EventService{

	@Autowired
	private EventDAOImpl eventDAO;
	
	@Override
	public List<Event_list> getEventlist(int no) {
		// TODO Auto-generated method stub
		List<Event_list> list = new ArrayList<Event_list>();
		list = eventDAO.getEventlist(no);
		return list;
	}
	

	@Override
	public List<Event_list> getEventlistclose() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Event_list> getEventlistplay() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AptComplexBean> getAPTList() {
		List<AptComplexBean> list = new ArrayList<AptComplexBean>();
		list = eventDAO.getAPTList();
		return list;
	}

	@Override
	public List<AptComplexBean> getAPTlistplay() {
		// TODO Auto-generated method stub
		List<AptComplexBean> list = new ArrayList<AptComplexBean>();
		list = eventDAO.getAPTlistplay();
		return list;
	}

	@Override
	public List<AptComplexBean> getAPTlistclose() {
		// TODO Auto-generated method stub
		List<AptComplexBean> list = new ArrayList<AptComplexBean>();
		list = eventDAO.getAPTlistclose();
		return list;
	}


	@Override
	public ApartmentBean getAPT_EventDetail(int no) {
		// TODO Auto-generated method stub
		ApartmentBean apt = new ApartmentBean();
		apt = eventDAO.getAPT_EventDetail(no);
		return apt;
	}


	@Override
	public AptComplexBean getComplex_detail(int no) {
		// TODO Auto-generated method stub
		AptComplexBean complex = new AptComplexBean();
		complex = eventDAO.getComplex_detail(no);
		return complex;
	}


	@Override
	public int getEventlist_count(int no) {
		// TODO Auto-generated method stub
		int count = eventDAO.getEventlist_count(no);
		return count;
	}


	@Override
	public int eventAptcount(int no) {
		// TODO Auto-generated method stub
		int count = eventDAO.getEvent_aptcount(no);
		return count;
	}


	@Override
	public List<Event_winBean> getEvent_winlist(int no) {
		// TODO Auto-generated method stub
		List<Event_winBean> list = new ArrayList<Event_winBean>();
		list = eventDAO.getEvent_winlist(no);
		return list;
	}


	@Override
	public void insertEvent(Event_list event) {
		// TODO Auto-generated method stub
		eventDAO.insertEvent(event);
	}


	@Override
	public List<AptComplexBean> searchEvnet(HashMap map) {
		// TODO Auto-generated method stub
		List<AptComplexBean> list =new ArrayList<AptComplexBean>();
		list = eventDAO.searchEvnet(map);
		return list;
	}

}
