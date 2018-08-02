package com.naver.house.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.house.bean.ExpertBoardBean;
import com.naver.house.dao.ExpertBoardDAO;

@Service
public class ExpertBoardServiceImpl implements ExpertBoardService {
	
	@Autowired
	private ExpertBoardDAO expertBoardDAO;

	@Override
	public void insertBoard(ExpertBoardBean board) {
		expertBoardDAO.insertBoard(board);		
	}

	@Override
	public int boardNum() {
		return expertBoardDAO.boardNum();
	}

	@Override
	public int getListCount() {
		return expertBoardDAO.getListCount();
	}

	@Override
	public List<ExpertBoardBean> getBoardList(HashMap<String, Integer> m) {
		List<ExpertBoardBean> list = new ArrayList<ExpertBoardBean>();
		list = expertBoardDAO.getBoardList(m);
		return list;
	}


	@Override
	public void expertBoardHit(int num) {
		expertBoardDAO.expertBoardHit(num);
		
	}

	@Override
	public ExpertBoardBean getExpertBoardCont(int num) {
		return expertBoardDAO.expertBoardCont(num);
	}

	@Override
	public ExpertBoardBean getNewBoard() {
		return expertBoardDAO.getNewBoard();
	}

	@Override
	public void boardEdit(ExpertBoardBean ebb) {
		 expertBoardDAO.boardEdit(ebb);
	}

	@Override
	public void expertBoardDelete(int num) {
		expertBoardDAO.expertBoardDelete(num);
	}




}
