package com.naver.house.service;
import java.util.List;
import java.util.Map;

import com.naver.house.bean.ApartInfoDocBean;


public interface ApartInfoDocService {
	/*자료실 저장*/
	public void insertInfoDoc(ApartInfoDocBean infoDocbean) throws Exception;
	
	/* 자료실 총 게시물 수*/
	public int getListCount() throws Exception;

	/* 자료실 목록과 페이징 */
	public List<ApartInfoDocBean> getInfoDocList(Map m) throws Exception ;

	/*번호를 기준으로 자료실 내용 가져오기 */
	public ApartInfoDocBean getInfoDocCont(int num) throws Exception;
	
	/*자료실 수정*/
	public void editInfoDoc(ApartInfoDocBean infoDocbean) throws Exception;

	/*자료실 삭제*/
	public void deleteInfoDoc(int infoDoc_num) throws Exception;

	/*검색 결과 게시물 수*/
	public int getListCount3(Map m) throws Exception;

	/*검색 결과 페이징 목록*/
	public List<ApartInfoDocBean> getInfoDocList3(Map m) throws Exception ;

}
