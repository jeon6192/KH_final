package com.naver.house.service;

import java.util.List;
import java.util.Map;

import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.AptComplexBean;
import com.naver.house.bean.EL_AND_AptBean;
import com.naver.house.bean.EW_AND_AptBean;
import com.naver.house.bean.Event_list;
import com.naver.house.bean.Event_winBean;
import com.naver.house.bean.Option_fBean;
import com.naver.house.bean.Option_nfBean;
import com.naver.house.bean.OptionsInfoBean;

public interface OptionServiceF {
	//��÷�ƴ��� Ȯ��
	 public List<Event_winBean> checkWinner(int user_no) throws Exception;
	 
	 //���� �ɼ� �Է� /�ӽ�����
	 public void set_option(Option_fBean ofbean, Option_nfBean onfbean)throws Exception;
	 
	 //�ӽ� ���� �� ��������
	 public Option_fBean foption_get(int user_no) throws Exception;

	public ApartmentBean getAptInfo(long apart_id);

	public AptComplexBean getAptXinfo(long apart_xid);

	public int checkFirst(long aptid);

	public Option_fBean getFreeOp( long apt_id);

	public Option_nfBean getNfreeOp(long apt_id);

	public void set_optionupdate(Option_fBean ofbean, Option_nfBean onfbean);

	public List<EW_AND_AptBean> getWinList(int user_no);

	public List<AptComplexBean> getAptXList(Map map);

	public int getListCount(Map map);

	public List<OptionsInfoBean> getOptionInfo(int complex_id);

	public List<Integer> getDongInfo(int complex_id);

	public List<Event_list> checkEventIn(int user_no);

	public List<EL_AND_AptBean> getEventInList(int user_no);

	
	 
}
