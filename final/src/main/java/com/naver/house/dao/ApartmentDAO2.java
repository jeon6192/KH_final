package com.naver.house.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.ApartmentBean2;
import com.naver.house.bean.AptComplexBean;
import com.naver.house.bean.AptComplexBean2;

@Repository
public class ApartmentDAO2 {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insert_apartment(List<ApartmentBean> apartmentBeanList) throws Exception {
		sqlSession.insert("apart.insert", apartmentBeanList);
	}
	
	public void insert_aptComplex(AptComplexBean aptComplexBean) throws Exception {
		sqlSession.insert("complex.insert", aptComplexBean);
	}
	
	public AptComplexBean2 detail_aptComplex(int complex_id) throws Exception {
		AptComplexBean2 aptComplexBean2 = sqlSession.selectOne("complex.select", complex_id);
		
		return aptComplexBean2;
	}
	
	public List<ApartmentBean> detail_apart(int complex_id) throws Exception {
		List<ApartmentBean> apartmentBeanList = sqlSession.selectList("apart.select", complex_id);
		
		return apartmentBeanList;
	}
	
	public ApartmentBean2 detail_apart2(int complex_id, int apart_dong) throws Exception {
		Map<String, Integer> apartMap = new HashMap<String, Integer>();
		apartMap.put("complex_id", complex_id);
		apartMap.put("apart_dong", apart_dong);
		
		ApartmentBean2 apartmentBean2 = sqlSession.selectOne("apart.selectDong", apartMap);
		
		return apartmentBean2;
	}
	
	public List<AptComplexBean2> searchCpx(Map<String, Object> searchCpxMap) throws Exception {
		List<AptComplexBean2> searchCpxList = sqlSession.selectList("complex.searchCpx", searchCpxMap);
		
		return searchCpxList;
	}


}
