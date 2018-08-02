package com.naver.house.dao;

import java.util.HashMap;
import java.util.List;

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


	public int getListCount() {
		return sqlSession.selectOne("expertBoard.getListCount");
	}


	public List<ExpertBoardBean> getBoardList(HashMap<String, Integer> m) {
		return sqlSession.selectList("expertBoard.getBoardList",m);
	}


	public void expertBoardHit(int num) {
		sqlSession.update("expertBoard.expertBoardHit",num);
	}


	public ExpertBoardBean expertBoardCont(int num) {
		return sqlSession.selectOne("expertBoard.expertBoardCont",num);
	}


	public ExpertBoardBean getNewBoard() {
		return sqlSession.selectOne("expertBoard.newBoard");
	}


	public void boardEdit(ExpertBoardBean ebb) {
		sqlSession.update("expertBoard.boardEdit",ebb);
	}


	public void expertBoardDelete(int num) {
		sqlSession.delete("expertBoard.expertBoardDelete",num);
	}


}
