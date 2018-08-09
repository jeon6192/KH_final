package com.naver.house.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.AptComplexBean;
import com.naver.house.bean.AptComplexBean2;

@Repository
public class ApartmentDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;





	public List<AptComplexBean2> getAptList(HashMap<String, Object> m) {
		List<AptComplexBean2> list = 
				sqlSession.selectList("Search.aptList",m);
		for (AptComplexBean2 apart : list) {
			System.out.println(apart.getComplex_lat());
			System.out.println(apart.getComplex_lng());
			System.out.println(apart.getComplex_apartname());
		}
		return list;
	}



	public int getListCount(String addr) {
		return sqlSession.selectOne("Search.lsitCount",addr);
	}



	public List<AptComplexBean> getMapList() {
		return sqlSession.selectList("Search.mapList");
	}



	public AptComplexBean2 getNewApt() {
		return sqlSession.selectOne("Search.newApt");
	}
}
