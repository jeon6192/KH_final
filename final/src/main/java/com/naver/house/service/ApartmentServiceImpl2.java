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
import com.naver.house.bean.AptComplexBean2;
import com.naver.house.dao.ApartmentDAO2;

@Service
public class ApartmentServiceImpl2 implements ApartmentService2 {
	@Autowired
	private ApartmentDAO2 apartmentDAO;

	
	@Override
	public void insert_apart(Map<String, Object> apartMap) throws Exception {
		AptComplexBean aptComplexBean = (AptComplexBean) apartMap.get("aptComplexBean");
		@SuppressWarnings("unchecked")
		ArrayList<ApartmentBean> apartmentBeanList = (ArrayList<ApartmentBean>) apartMap.get("apartmentListBean");
		
		apartmentDAO.insert_aptComplex(aptComplexBean);
		
		apartmentDAO.insert_apartment(apartmentBeanList);
		
	}

	@Override
	public Map<String, Object> detail_complex(int complex_id) throws Exception {
		Map<String, Object> apartMap = new HashMap<String, Object>();
		AptComplexBean2 aptComplexBean2 = new AptComplexBean2();
		List<ApartmentBean> apartmentBeanList = new ArrayList<ApartmentBean>();
		
		aptComplexBean2 = apartmentDAO.detail_aptComplex(complex_id);
		apartmentBeanList = apartmentDAO.detail_apart(complex_id);
		
		
		apartMap.put("aptComplexBean", aptComplexBean2);
		apartMap.put("apartmentBeanList", apartmentBeanList);
		
		return apartMap;
	}

	@Override
	public ApartmentBean2 detail_apart(int complex_id, int apart_dong) throws Exception {
		ApartmentBean2 apartmentBean2 = apartmentDAO.detail_apart2(complex_id, apart_dong);
		
		return apartmentBean2;
	}

	@Override
	public List<AptComplexBean2> searchCpx(Map<String, Object> searchCpxMap) throws Exception {
		List<AptComplexBean2> searchCpxList = apartmentDAO.searchCpx(searchCpxMap);
				
		return searchCpxList;
	}

	

}
