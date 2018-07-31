package com.naver.house.service;

import java.util.HashMap;
import java.util.List;

import com.naver.house.bean.AptComplexBean;
import com.naver.house.bean.AptComplexBean2;
import com.naver.house.bean.ExpertBoardBean;

public interface ApartmentService {



	List<AptComplexBean2> getAptList(HashMap<String, Object> m);


	int getListCount(String addr);


	List<AptComplexBean> getMapList();





}
