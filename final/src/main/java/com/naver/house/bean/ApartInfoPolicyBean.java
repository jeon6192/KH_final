package com.naver.house.bean;

import org.springframework.web.multipart.MultipartFile;

public class ApartInfoPolicyBean {
	private int INFO_POLICY_NUM;
	private int Admin_no;
	private String INFO_POLICY_SUB;
	private String INFO_POLICY_CONT;
	private String INFO_POLICY_DATE;
	private MultipartFile uploadfile;
	private String INFO_POLICY_FILE;
	private String INFO_POLICY_ORIGINAL;
	private int INFO_POLICY_VISIT;
	public int getINFO_POLICY_NUM() {
		return INFO_POLICY_NUM;
	}
	public void setINFO_POLICY_NUM(int iNFO_POLICY_NUM) {
		INFO_POLICY_NUM = iNFO_POLICY_NUM;
	}
	public int getAdmin_no() {
		return Admin_no;
	}
	public void setAdmin_no(int admin_no) {
		Admin_no = admin_no;
	}
	public String getINFO_POLICY_SUB() {
		return INFO_POLICY_SUB;
	}
	public void setINFO_POLICY_SUB(String iNFO_POLICY_SUB) {
		INFO_POLICY_SUB = iNFO_POLICY_SUB;
	}
	public String getINFO_POLICY_CONT() {
		return INFO_POLICY_CONT;
	}
	public void setINFO_POLICY_CONT(String iNFO_POLICY_CONT) {
		INFO_POLICY_CONT = iNFO_POLICY_CONT;
	}
	public String getINFO_POLICY_DATE() {
		return INFO_POLICY_DATE;
	}
	public void setINFO_POLICY_DATE(String iNFO_POLICY_DATE) {
		INFO_POLICY_DATE = iNFO_POLICY_DATE;
	}
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	public String getINFO_POLICY_FILE() {
		return INFO_POLICY_FILE;
	}
	public void setINFO_POLICY_FILE(String iNFO_POLICY_FILE) {
		INFO_POLICY_FILE = iNFO_POLICY_FILE;
	}
	public String getINFO_POLICY_ORIGINAL() {
		return INFO_POLICY_ORIGINAL;
	}
	public void setINFO_POLICY_ORIGINAL(String iNFO_POLICY_ORIGINAL) {
		INFO_POLICY_ORIGINAL = iNFO_POLICY_ORIGINAL;
	}
	public int getINFO_POLICY_VISIT() {
		return INFO_POLICY_VISIT;
	}
	public void setINFO_POLICY_VISIT(int iNFO_POLICY_VISIT) {
		INFO_POLICY_VISIT = iNFO_POLICY_VISIT;
	}
	
}
