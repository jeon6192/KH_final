package com.naver.house.service;

import java.util.HashMap;
import java.util.List;

import com.naver.house.bean.ExpertBoardBean;

public interface ExpertBoardService {

	void insertBoard(ExpertBoardBean board);

	int boardNum();

	int getListCount();

	List<ExpertBoardBean> getBoardList(HashMap<String, Integer> m);


	void expertBoardHit(int num);

	ExpertBoardBean getExpertBoardCont(int num);

	ExpertBoardBean getNewBoard();

	void boardEdit(ExpertBoardBean ebb);

	void expertBoardDelete(int num);

}
