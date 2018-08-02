package com.naver.house.bean;


import org.springframework.web.multipart.MultipartFile;

public class ApartInfoEtcBean {
	private int INFO_ETC_NUM;
	private int Admin_no;
	private String INFO_ETC_SUB;
	private String INFO_ETC_CONT;
	private String INFO_ETC_DATE;
	private MultipartFile uploadfile;
	private String INFO_ETC_FILE;
	private String INFO_ETC_ORIGINAL;
	private int INFO_ETC_VISIT;
	public int getINFO_ETC_NUM() {
		return INFO_ETC_NUM;
	}
	public void setINFO_ETC_NUM(int iNFO_ETC_NUM) {
		INFO_ETC_NUM = iNFO_ETC_NUM;
	}
	public int getAdmin_no() {
		return Admin_no;
	}
	public void setAdmin_no(int admin_no) {
		Admin_no = admin_no;
	}
	public String getINFO_ETC_SUB() {
		return INFO_ETC_SUB;
	}
	public void setINFO_ETC_SUB(String iNFO_ETC_SUB) {
		INFO_ETC_SUB = iNFO_ETC_SUB;
	}
	public String getINFO_ETC_CONT() {
		return INFO_ETC_CONT;
	}
	public void setINFO_ETC_CONT(String iNFO_ETC_CONT) {
		INFO_ETC_CONT = iNFO_ETC_CONT;
	}
	public String getINFO_ETC_DATE() {
		return INFO_ETC_DATE;
	}
	public void setINFO_ETC_DATE(String iNFO_ETC_DATE) {
		INFO_ETC_DATE = iNFO_ETC_DATE;
	}
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	public String getINFO_ETC_FILE() {
		return INFO_ETC_FILE;
	}
	public void setINFO_ETC_FILE(String iNFO_ETC_FILE) {
		INFO_ETC_FILE = iNFO_ETC_FILE;
	}
	public String getINFO_ETC_ORIGINAL() {
		return INFO_ETC_ORIGINAL;
	}
	public void setINFO_ETC_ORIGINAL(String iNFO_ETC_ORIGINAL) {
		INFO_ETC_ORIGINAL = iNFO_ETC_ORIGINAL;
	}
	public int getINFO_ETC_VISIT() {
		return INFO_ETC_VISIT;
	}
	public void setINFO_ETC_VISIT(int iNFO_ETC_VISIT) {
		INFO_ETC_VISIT = iNFO_ETC_VISIT;
	}
	
}
