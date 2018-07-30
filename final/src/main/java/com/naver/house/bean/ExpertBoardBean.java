package com.naver.house.bean;


public class ExpertBoardBean {
	private int eb_num;							//게시판번호	
	private String eb_source;					//게시판 출처
	private String eb_subject;					//제목
	private String eb_content;					//내용
	private int eb_readcount;					//조회수
	private String eb_date;						//날짜
	private String eb_file; 					//파일 올리기
	
	
	
	public int getEb_num() {
		return eb_num;
	}
	public void setEb_num(int eb_num) {
		this.eb_num = eb_num;
	}
	public String getEb_source() {
		return eb_source;
	}
	public void setEb_source(String eb_source) {
		this.eb_source = eb_source;
	}
	public String getEb_subject() {
		return eb_subject;
	}
	public void setEb_subject(String eb_subject) {
		this.eb_subject = eb_subject;
	}
	public String getEb_content() {
		return eb_content;
	}
	public void setEb_content(String eb_content) {
		this.eb_content = eb_content;
	}
	public int getEb_readcount() {
		return eb_readcount;
	}
	public void setEb_readcount(int eb_readcount) {
		this.eb_readcount = eb_readcount;
	}
	public String getEb_date() {
		return eb_date;
	}
	public void setEb_date(String eb_date) {
		this.eb_date = eb_date;
	}
	public String getEb_file() {
		return eb_file;
	}
	public void setEb_file(String eb_file) {
		this.eb_file = eb_file;
	}
}




