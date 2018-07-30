package com.naver.house.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.house.bean.ExpertBoardBean;

@Repository
public class ExpertBoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	public void insertBoard(ExpertBoardBean board) {
			sqlSession.insert("expertBoard.insertBoard",board);
	}


	public int boardNum() {
		return sqlSession.selectOne("expertBoard.boardNum");
	}
}
