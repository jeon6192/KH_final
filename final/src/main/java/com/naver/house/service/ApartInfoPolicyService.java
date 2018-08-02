package com.naver.house.service;

import java.util.List;
import java.util.Map;

import com.naver.house.bean.ApartInfoPolicyBean;


public interface ApartInfoPolicyService {
	/*자료실 저장*/
	public void insertInfoPolicy(ApartInfoPolicyBean infoPolicybean) throws Exception;
	
	/* 자료실 총 게시물 수*/
	public int getListCount() throws Exception;

	/* 자료실 목록과 페이징 */
	public List<ApartInfoPolicyBean> getInfoPolicyList(Map m) throws Exception ;

	/*번호를 기준으로 자료실 내용 가져오기 */
	public ApartInfoPolicyBean getInfoPolicyCont(int num) throws Exception;

	/*내용보기 할때만 조회수 증가*/
	public void infoPolicyHit(int num) throws Exception;
	
	/*자료실 수정*/
	public void editInfoPolicy(ApartInfoPolicyBean infoPolicybean) throws Exception;

	/*자료실 삭제*/
	public void deleteInfoPolicy(int infoPolicy_num) throws Exception;

	/*검색 결과 게시물 수*/
	public int getListCount3(Map m) throws Exception;

	/*검색 결과 페이징 목록*/
	public List<ApartInfoPolicyBean> getInfoPolicyList3(Map m) throws Exception ;

}
