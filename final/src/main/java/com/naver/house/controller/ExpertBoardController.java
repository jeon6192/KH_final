package com.naver.house.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.house.bean.ExpertBoardBean;
import com.naver.house.service.ExpertBoardService;

@Controller
public class ExpertBoardController {
	
	@Autowired
	private ExpertBoardService service;
	
	@RequestMapping(value= "/expertBoard_write.com")
	public String expertBoard_write() {
		
		return "expertBoard/expertBoard_write";
	}
	
	@RequestMapping(value="/expertBoard_write_ok.com",method=RequestMethod.POST)
	public String expertBoard_write_ok(
			ExpertBoardBean board){
		
		board.setEb_num(service.boardNum());
		
		service.insertBoard(board);
		
		return "redirect:/expertBoard_list.com";
	}
	
	@RequestMapping(value="/expertBoard_list.com")
	public ModelAndView expertBoard_list(@RequestParam(value = "page", defaultValue = "1") int page)throws Exception{
		
		
		return null;
	}
	
	
}
