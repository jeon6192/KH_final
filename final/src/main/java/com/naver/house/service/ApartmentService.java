package com.naver.house.service;

import java.util.HashMap;
import java.util.List;

import com.naver.house.bean.AptComplexBean;

public interface ApartmentService {



	List<AptComplexBean> getAptList(HashMap<String, Object> m);


	int getListCount(String addr);



}
