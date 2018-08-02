package com.naver.house.service;

import java.util.HashMap;
import java.util.List;

import com.naver.house.bean.AptComplexBean;
import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.Event_list;
import com.naver.house.bean.Event_winBean;

public interface EventService {

	//����Ʈ�� ���� �о� ��û�ڵ�
	public List<Event_list> getEventlist(int no);
	
	//����Ʈ�� ���� �о� ��û�� ��
	public int getEventlist_count(int no);
	//�о��� ���� ����Ʈ�� �о� ��û�ڵ�
	public List<Event_list> getEventlistclose();
	
	//�о����� ����Ʈ�� �о� ��û�ڵ�
	public List<Event_list> getEventlistplay();
	
	//����Ʈ ��ü��� ����Ʈ
	public List<AptComplexBean> getAPTList();
	
	//�о����� ����Ʈ ��� ����Ʈ
	public List<AptComplexBean> getAPTlistplay();
	
	//�о糡�� ����Ʈ ��� ����Ʈ
	public List<AptComplexBean> getAPTlistclose();
	
	//����Ʈ �о� �� ������
	public ApartmentBean getAPT_EventDetail(int no);
	
	//����Ʈ�� �� ����
	public AptComplexBean getComplex_detail(int no);
	
	//�о� ���� �����
	public int eventAptcount(int no);
	
	//��÷�� �о��� ����Ʈ
	public List<Event_winBean> getEvent_winlist(int no);
	
	//����Ʈ �о� ��û�ϱ�
	public void insertEvent(Event_list event);
	
	//����Ʈ ����Ʈ �˻�
	public List<AptComplexBean> searchEvnet(HashMap map);
}
