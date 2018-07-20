package com.naver.house.service;

import java.util.Map;

public interface ApartmentService {

	public void insert_apart(Map<String, Object> apartMap) throws Exception;
	
	public Map<String, Object> detail_apart(int complex_id) throws Exception;

}
