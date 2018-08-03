package com.naver.house.service;

import java.util.List;
import java.util.Map;

import com.naver.house.bean.*;

public interface ApartmentService2 {

	public void insert_apart(Map<String, Object> apartMap) throws Exception;
	
	public Map<String, Object> detail_complex(int complex_id) throws Exception;
	
	public ApartmentBean2 detail_apart(int complex_id, int apart_dong) throws Exception;
	
	public List<AptComplexBean2> searchCpx(Map<String, Object> searchCpxMap) throws Exception;

}
