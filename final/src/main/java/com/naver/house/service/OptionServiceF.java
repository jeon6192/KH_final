package com.naver.house.service;

import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.AptComplexBean;
import com.naver.house.bean.Option_fBean;
import com.naver.house.bean.Option_nfBean;

public interface OptionServiceF {
	//��÷�ƴ��� Ȯ��
	 public int checkWinner(int user_no) throws Exception;
	 
	 //���� �ɼ� �Է� /�ӽ�����
	 public void set_option(Option_fBean ofbean, Option_nfBean onfbean)throws Exception;
	 
	 //�ӽ� ���� �� ��������
	 public Option_fBean foption_get(int user_no) throws Exception;

	public ApartmentBean getAptInfo(int user_no);

	public AptComplexBean getAptXinfo(long apart_xid);

	public int checkFirst(int user_no);

	public Option_fBean getFreeOp(int user_no);

	public Option_nfBean getNfreeOp(int user_no);

	public void set_optionupdate(Option_fBean ofbean, Option_nfBean onfbean);
	 
	 
}
