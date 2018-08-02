package com.naver.house.service;

import java.util.HashMap;
import java.util.List;

import com.naver.house.bean.AptComplexBean;
import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.Event_list;
import com.naver.house.bean.Event_winBean;

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
	public List<Event_winBean> getEvent_winlist(int no);
	
	//아파트 분양 신청하기
	public void insertEvent(Event_list event);
	
	//아파트 리스트 검색
	public List<AptComplexBean> searchEvnet(HashMap map);
}
