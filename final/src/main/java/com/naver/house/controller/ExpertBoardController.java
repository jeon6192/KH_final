package com.naver.house.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.naver.house.service.ExpertBoardService;

@Controller
public class ExpertBoardController {
	
	@Autowired
	private ExpertBoardService service;
	
	@RequestMapping(value= "/expertBoard_write.com")
	public String expertBoard_write() {
		
		return "expertBoard/expertBoard_write";
	}
	

}
