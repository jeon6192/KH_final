package com.naver.house.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.house.dao.ExpertBoardDAO;

@Service
public class ExpertBoardServiceImpl implements ExpertBoardService {
	
	@Autowired
	private ExpertBoardDAO expertBoardDAO;

}
