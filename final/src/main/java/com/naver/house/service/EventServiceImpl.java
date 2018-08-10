package com.naver.house.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.AptComplexBean;
import com.naver.house.bean.Event_list;
import com.naver.house.bean.Event_winBean;
import com.naver.house.bean.Event_winBean2;
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
   public List<Event_winBean2> getEvent_winlist(HashMap<String,Object> m) {
      // TODO Auto-generated method stub
      List<Event_winBean2> list = new ArrayList<Event_winBean2>();
      list = eventDAO.getEvent_winlist(m);
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


   @Override
   public List<ApartmentBean> list_playapt(int no) {
      // TODO Auto-generated method stub
      
      List<ApartmentBean> list = new ArrayList<ApartmentBean>();
      list = eventDAO.list_playapt(no);
      return list;
   }


   @Override
   public List<Event_list> event_list(int complex_id) {
      // TODO Auto-generated method stub
      
      List<Event_list> list = new ArrayList<Event_list>();
      list = eventDAO.event_list(complex_id);
      return list;
   }


   @Override
   public void insertEvent_win(Event_winBean e) {
      // TODO Auto-generated method stub
      eventDAO.insertEvent_win(e);
   }


   @Override
   public List<Event_list> event_list_totalcount(int complex_id) {
      // TODO Auto-generated method stub
      List<Event_list> list = new ArrayList<Event_list>();
      list = eventDAO.event_list_totalcount(complex_id);
      return list;
   }


   @Override
   public void update_win(HashMap m) {
      // TODO Auto-generated method stub
      eventDAO.update_win(m);
   }


   @Override
   public void update_lose(HashMap m) {
      // TODO Auto-generated method stub
      eventDAO.update_lose(m);
   }


   @Override
   public void update_apart_user_no(HashMap m) {
      // TODO Auto-generated method stub
      eventDAO.update_apart_user_no(m);
   }


   @Override
   public List<Event_winBean2> event_win_list(int complex_id) {
      // TODO Auto-generated method stub
      List<Event_winBean2> list = new ArrayList<Event_winBean2>();
      list = eventDAO.event_win_list(complex_id);
      return list;
   }


   @Override
   public void eventwin_up(HashMap m) {
      // TODO Auto-generated method stub
      eventDAO.eventwin_up(m);
   }


   @Override
   public void eventwin_down(HashMap m) {
      // TODO Auto-generated method stub
      eventDAO.eventwin_down(m);
   }


   @Override
   public int event_list_state(HashMap m) {
      // TODO Auto-generated method stub
      int num = eventDAO.event_list_state(m);
      return num;
   }


   @Override
   public void restartform(int complex_id) {
      // TODO Auto-generated method stub
      eventDAO.restartform(complex_id);
   }

}