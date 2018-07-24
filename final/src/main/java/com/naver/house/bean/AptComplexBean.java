package com.naver.house.bean;

public class AptComplexBean {
	private long complex_id;
	private String complex_address;
	private double complex_lat;
	private double complex_lng;
	private String complex_apartname;
	private String complex_pdate;
	private int complex_state;
	private String complex_info;
	private int complex_subway;
	private String complex_station;
	private int complex_foot;
	private int maxprice;			// 최대 가격 
	private int minprice;			// 최소 가격
	private int maxarea;			// 최대 면적
	private int minarea;			// 최소 면적
	
	
	
	public int getMaxprice() {
		return maxprice;
	}

	public void setMaxprice(int maxprice) {
		this.maxprice = maxprice;
	}

	public int getMinprice() {
		return minprice;
	}

	public void setMinprice(int minprice) {
		this.minprice = minprice;
	}

	public int getMinarea() {
		return minarea;
	}

	public void setMinarea(int minarea) {
		this.minarea = minarea;
	}

	public int getMaxarea() {
		return maxarea;
	}

	public void setMaxarea(int maxarea) {
		this.maxarea = maxarea;
	}

	public long getComplex_id() {
		return complex_id;
	}

	public void setComplex_id(long complex_id) {
		this.complex_id = complex_id;
	}

	public String getComplex_address() {
		return complex_address;
	}

	public void setComplex_address(String complex_address) {
		this.complex_address = complex_address;
	}

	public double getComplex_lat() {
		return complex_lat;
	}

	public void setComplex_lat(double complex_lat) {
		this.complex_lat = complex_lat;
	}

	public double getComplex_lng() {
		return complex_lng;
	}

	public void setComplex_lng(double complex_lng) {
		this.complex_lng = complex_lng;
	}

	public String getComplex_apartname() {
		return complex_apartname;
	}

	public void setComplex_apartname(String complex_apartname) {
		this.complex_apartname = complex_apartname;
	}

	public String getComplex_pdate() {
		return complex_pdate;
	}

	public void setComplex_pdate(String complex_pdate) {
		this.complex_pdate = complex_pdate;
	}

	public int getComplex_state() {
		return complex_state;
	}

	public void setComplex_state(int complex_state) {
		this.complex_state = complex_state;
	}

	public String getComplex_info() {
		return complex_info;
	}

	public void setComplex_info(String complex_info) {
		this.complex_info = complex_info;
	}

	public int getComplex_subway() {
		return complex_subway;
	}

	public void setComplex_subway(int complex_subway) {
		this.complex_subway = complex_subway;
	}

	public String getComplex_station() {
		return complex_station;
	}

	public void setComplex_station(String complex_station) {
		this.complex_station = complex_station;
	}

	public int getComplex_foot() {
		return complex_foot;
	}

	public void setComplex_foot(int complex_foot) {
		this.complex_foot = complex_foot;
	}

}
