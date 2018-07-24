package com.naver.house.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.AptComplexBean;

@Repository
public class ApartmentDAO2 {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insert_apartment(ApartmentBean apartmentBean) throws Exception {
		sqlSession.insert("apart.insert",apartmentBean);
	}
	
	public void insert_apartment2(List<ApartmentBean> apartmentBeanList) throws Exception {
		for (ApartmentBean apart : apartmentBeanList) {
			System.out.println(apart.getComplex_id());
		}
		sqlSession.insert("apart.insert2", apartmentBeanList);
		System.out.println("아파트 넣었음!");
	}
	
	public void insert_aptComplex(AptComplexBean aptComplexBean) throws Exception {
		sqlSession.insert("complex.insert", aptComplexBean);
	}
	
	public AptComplexBean detail_aptComplex(int complex_id) throws Exception {
		AptComplexBean aptComplexBean = new AptComplexBean();
		
		return aptComplexBean;
	}
	
	public List<ApartmentBean> detail_apart(int complex_id) throws Exception {
		List<ApartmentBean> apartmentBeanList = new ArrayList<ApartmentBean>();
		
		return apartmentBeanList;
	}
	

}
