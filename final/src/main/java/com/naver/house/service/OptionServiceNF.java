package com.naver.house.service;

import com.naver.house.bean.Option_nfBean;

public interface OptionServiceNF {
	//��÷�ƴ��� Ȯ��
	 public int checkWinner(int user_no) throws Exception;
	 
	 //���� �ɼ� �Է� /�ӽ�����
	 public void nfoption_insert(Option_nfBean onfbean)throws Exception;
	 
	 //�ӽ� ���� �� ��������
	 public Option_nfBean nfoption_get(int user_no) throws Exception;

	 
}
