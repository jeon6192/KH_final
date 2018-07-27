package com.naver.house.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.ApartmentBean2;
import com.naver.house.bean.AptComplexBean;
import com.naver.house.dao.ApartmentDAO2;

@Service
public class ApartmentServiceImpl2 implements ApartmentService2 {
	@Autowired
	private ApartmentDAO2 apartmentDAO;

	
	@Override
	public void insert_apart(Map<String, Object> apartMap) throws Exception {
		AptComplexBean aptComplexBean = (AptComplexBean) apartMap.get("aptComplexBean");
		ArrayList<ApartmentBean> apartmentBeanList = (ArrayList<ApartmentBean>) apartMap.get("apartmentListBean");
		
		apartmentDAO.insert_aptComplex(aptComplexBean);
		
		apartmentDAO.insert_apartment(apartmentBeanList);
		
	}

	@Override
	public Map<String, Object> detail_complex(int complex_id) throws Exception {
		Map<String, Object> apartMap = new HashMap<String, Object>();
		AptComplexBean aptComplexBean = new AptComplexBean();
		List<ApartmentBean> apartmentBeanList = new ArrayList<ApartmentBean>();
		
		aptComplexBean = apartmentDAO.detail_aptComplex(complex_id);
		apartmentBeanList = apartmentDAO.detail_apart(complex_id);
		
		
		apartMap.put("aptComplexBean", aptComplexBean);
		apartMap.put("apartmentBeanList", apartmentBeanList);
		
		return apartMap;
	}

	@Override
	public ApartmentBean2 detail_apart(int complex_id, int apart_dong) throws Exception {
		ApartmentBean2 apartmentBean2 = apartmentDAO.detail_apart2(complex_id, apart_dong);
		
		return apartmentBean2;
	}


	
	
	
	
	
	

}
