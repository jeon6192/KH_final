package com.naver.house.service;

import java.util.HashMap;
import java.util.List;

import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.AptComplexBean;
import com.naver.house.bean.Event_list;
import com.naver.house.bean.Event_winBean;
import com.naver.house.bean.Event_winBean2;

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
	public List<Event_winBean2> getEvent_winlist(HashMap<String,Object> m);
	
	//����Ʈ �о� ��û�ϱ�
	public void insertEvent(Event_list event);
	
	//����Ʈ ����Ʈ �˻�
	public List<AptComplexBean> searchEvnet(HashMap map);
	
	//����Ʈ �о���� ����
	public List<ApartmentBean> list_playapt(int no);

	//�о��û�ڵ� ����
	public List<Event_list> event_list(int complex_id);
	
	//�о� �ֱ�
	public void insertEvent_win(Event_winBean e);
	
	//���������� �о��û�ڵ� ����
	public List<Event_list> event_list_totalcount(int complex_id);
	
	//Event_list check = ��÷��
	public void update_win(HashMap m);
	
	//Event_list check = �̴�÷��
	public void update_lose(HashMap m);
	
	//�о�� ����Ʈ�� ��÷�� �̸� �ֱ�
	public void update_apart_user_no(HashMap m);

	//��÷�� ����Ʈ
	public List<Event_winBean2> event_win_list(int complex_id);
	
	//��÷�� Ȯ��
	public void eventwin_up(HashMap m);
	
	//��÷�� ���
	public void eventwin_down(HashMap m);
}
