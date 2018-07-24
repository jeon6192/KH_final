package com.naver.house.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.house.bean.AptComplexBean;
import com.naver.house.dao.ApartmentDAO;

@Service
public class ApartmentServiceImpl implements ApartmentService{

	
	@Autowired
	private ApartmentDAO apartmentDAO;

	@Override
	public List<AptComplexBean> getAptList(HashMap<String, Object> m) {
		return apartmentDAO.getAptList(m);
	}

	@Override
	public int getListCount(String addr) {
		return apartmentDAO.getListCount(addr);
	}


}
