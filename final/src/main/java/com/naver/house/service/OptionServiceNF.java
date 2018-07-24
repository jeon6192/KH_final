package com.naver.house.service;

import com.naver.house.bean.Option_nfBean;

public interface OptionServiceNF {
	//당첨됐는지 확인
	 public int checkWinner(int user_no) throws Exception;
	 
	 //무상 옵션 입력 /임시저장
	 public void nfoption_insert(Option_nfBean onfbean)throws Exception;
	 
	 //임시 저장 후 가져오기
	 public Option_nfBean nfoption_get(int user_no) throws Exception;

	 
}
