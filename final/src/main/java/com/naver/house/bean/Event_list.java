	package com.naver.house.bean;

public class Event_list {

	
	private int Event_no;
	private int user_no;
	private String Event_day;
	private long complex_id;
	private int Event_check;
	
	
	public int getEvent_no() {
		return Event_no;
	}
	public void setEvent_no(int event_no) {
		Event_no = event_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getEvent_day() {
		return Event_day;
	}
	public void setEvent_day(String event_day) {
		Event_day = event_day;
	}
	public int getEvent_check() {
		return Event_check;
	}
	public void setEvent_check(int event_check) {
		Event_check = event_check;
	}
	public long getComplex_id() {
		return complex_id;
	}
	public void setComplex_id(long complex_id) {
		this.complex_id = complex_id;
	}
	
	
	
	
}
