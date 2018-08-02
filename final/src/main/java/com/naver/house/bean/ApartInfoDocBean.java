package com.naver.house.bean;

import org.springframework.web.multipart.MultipartFile;

public class ApartInfoDocBean {
	private int INFO_DOC_NUM;
	private int Admin_no;
	private String INFO_DOC_SUB;
	
	private MultipartFile uploadfile;
	private String INFO_DOC_FILE;
	private String INFO_DOC_ORIGINAL;
	
	public int getINFO_DOC_NUM() {
		return INFO_DOC_NUM;
	}
	public void setINFO_DOC_NUM(int iNFO_DOC_NUM) {
		INFO_DOC_NUM = iNFO_DOC_NUM;
	}
	public int getAdmin_no() {
		return Admin_no;
	}
	public void setAdmin_no(int admin_no) {
		Admin_no = admin_no;
	}
	public String getINFO_DOC_SUB() {
		return INFO_DOC_SUB;
	}
	public void setINFO_DOC_SUB(String iNFO_DOC_SUB) {
		INFO_DOC_SUB = iNFO_DOC_SUB;
	}
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	public String getINFO_DOC_FILE() {
		return INFO_DOC_FILE;
	}
	public void setINFO_DOC_FILE(String iNFO_DOC_FILE) {
		INFO_DOC_FILE = iNFO_DOC_FILE;
	}
	public String getINFO_DOC_ORIGINAL() {
		return INFO_DOC_ORIGINAL;
	}
	public void setINFO_DOC_ORIGINAL(String iNFO_DOC_ORIGINAL) {
		INFO_DOC_ORIGINAL = iNFO_DOC_ORIGINAL;
	}
	
	
	
	
	
}
