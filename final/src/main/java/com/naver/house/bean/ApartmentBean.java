package com.naver.house.bean;

public class ApartmentBean {
	private long apart_id;					//아파트고유번호		
	private long complex_id;				//단지고유번호 fk
	private int apart_dong;					//동
	private int apart_ho;					//호
	private int apart_floor;				//층
	private int apart_area;					//면적
	private int apart_price;				//가격
	private int apart_room;					//방개수
	private int apart_toilet;				//집 방향
	private String apart_direction;			//인테리어사진
	private String apart_interior;			//유저넘버

	
	public long getApart_id() {
		return apart_id;
	}

	public void setApart_id(long apart_id) {
		this.apart_id = apart_id;
	}

	public long getComplex_id() {
		return complex_id;
	}

	public void setComplex_id(long complex_id) {
		this.complex_id = complex_id;
	}

	public int getApart_dong() {
		return apart_dong;
	}

	public void setApart_dong(int apart_dong) {
		this.apart_dong = apart_dong;
	}

	public int getApart_ho() {
		return apart_ho;
	}

	public void setApart_ho(int apart_ho) {
		this.apart_ho = apart_ho;
	}

	public int getApart_floor() {
		return apart_floor;
	}

	public void setApart_floor(int apart_floor) {
		this.apart_floor = apart_floor;
	}

	public int getApart_area() {
		return apart_area;
	}

	public void setApart_area(int apart_area) {
		this.apart_area = apart_area;
	}

	public int getApart_price() {
		return apart_price;
	}

	public void setApart_price(int apart_price) {
		this.apart_price = apart_price;
	}

	public int getApart_room() {
		return apart_room;
	}

	public void setApart_room(int apart_room) {
		this.apart_room = apart_room;
	}

	public int getApart_toilet() {
		return apart_toilet;
	}

	public void setApart_toilet(int apart_toilet) {
		this.apart_toilet = apart_toilet;
	}

	public String getApart_direction() {
		return apart_direction;
	}
	
	public void setApart_direction(String apart_direction) {
		this.apart_direction = apart_direction;
	}
	
	public String getApart_interior() {
		return apart_interior;
	}

	public void setApart_interior(String apart_interior) {
		this.apart_interior = apart_interior;
	}
}
