package com.naver.house.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.AptComplexBean;

@Repository
public class ApartmentDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;





	public List<AptComplexBean> getAptList(HashMap<String, Object> m) {
		List<AptComplexBean> list = 
				sqlSession.selectList("Search.aptList",m);
		return list;
	}



	public int getListCount(String addr) {
		return sqlSession.selectOne("Search.lsitCount",addr);
	}
}
