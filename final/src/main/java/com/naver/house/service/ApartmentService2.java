package com.naver.house.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.naver.house.bean.AptComplexBean;

public interface ApartmentService2 {

	public void insert_apart(Map<String, Object> apartMap) throws Exception;
	
	public Map<String, Object> detail_apart(int complex_id) throws Exception;

}
