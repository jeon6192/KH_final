package com.naver.house.service;

import java.util.HashMap;
import java.util.List;

import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.AptComplexBean;
import com.naver.house.bean.Event_list;
import com.naver.house.bean.Event_winBean;
import com.naver.house.bean.Event_winBean2;

public interface EventService {

   //아파트에 대한 분양 신청자들
   public List<Event_list> getEventlist(int no);
   
   //아파트에 대한 분양 신청자 수
   public int getEventlist_count(int no);
   //분양이 끝난 아파트의 분양 신청자들
   public List<Event_list> getEventlistclose();
   
   //분양중인 아파트의 분양 신청자들
   public List<Event_list> getEventlistplay();
   
   //아파트 전체명단 리스트
   public List<AptComplexBean> getAPTList();
   
   //분양중인 아파트 명단 리스트
   public List<AptComplexBean> getAPTlistplay();
   
   //분양끝난 아파트 명단 리스트
   public List<AptComplexBean> getAPTlistclose();
   
   //아파트 분양 상세 페이지
   public ApartmentBean getAPT_EventDetail(int no);
   
   //아파트동 상세 정보
   public AptComplexBean getComplex_detail(int no);
   
   //분양 공급 세대수
   public int eventAptcount(int no);
   
   //당첨된 분양자 리스트
   public List<Event_winBean2> getEvent_winlist(HashMap<String,Object> m);
   
   //아파트 분양 신청하기
   public void insertEvent(Event_list event);
   
   //아파트 리스트 검색
   public List<AptComplexBean> searchEvnet(HashMap map);
   
   //아파트 분양공급 정보
   public List<ApartmentBean> list_playapt(int no);

   //분양신청자들 정보
   public List<Event_list> event_list(int complex_id);
   
   //분양 넣기
   public void insertEvent_win(Event_winBean e);
   
   //점수높은순 분양신청자들 정보
   public List<Event_list> event_list_totalcount(int complex_id);
   
   //Event_list check = 당첨자
   public void update_win(HashMap m);
   
   //Event_list check = 미당첨자
   public void update_lose(HashMap m);
   
   //분양된 아파트에 당첨자 이름 넣기
   public void update_apart_user_no(HashMap m);

   //당첨자 리스트
   public List<Event_winBean2> event_win_list(int complex_id);
   
   //당첨자 확정
   public void eventwin_up(HashMap m);
   
   //당첨자 취소
   public void eventwin_down(HashMap m);
   
   //분양신청 상태 확인
   public int event_list_state(HashMap m);
   
   
   //미분양상태 재분양신청하기
   public void restartform(int complex_id);
}