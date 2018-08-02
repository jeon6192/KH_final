package com.naver.house.service;
import java.util.List;
import java.util.Map;

import com.naver.house.bean.ApartInfoEtcBean;


public interface ApartInfoEtcService {
	/*자료실 저장*/
	public void insertInfoEtc(ApartInfoEtcBean infoEtcbean) throws Exception;
	
	/* 자료실 총 게시물 수*/
	public int getListCount() throws Exception;

	/* 자료실 목록과 페이징 */
	public List<ApartInfoEtcBean> getInfoEtcList(Map m) throws Exception ;

	/*번호를 기준으로 자료실 내용 가져오기 */
	public ApartInfoEtcBean getInfoEtcCont(int num) throws Exception;
	
	/*상세보기 글의 rnum구하기 */
	public int findContRnum(int num) throws Exception;
	
	/*rnum을 기준으로 +1, -1 기타정보글의 번호, 제목 */
	public List<ApartInfoEtcBean> getRnumPrevNext(int num) throws Exception;

	/*내용보기 할때만 조회수 증가*/
	public void infoEtcHit(int num) throws Exception;
	
	/*자료실 수정*/
	public void editInfoEtc(ApartInfoEtcBean infoEtcbean) throws Exception;

	/*자료실 삭제*/
	public void deleteInfoEtc(int infoEtc_num) throws Exception;

	/*검색 결과 게시물 수*/
	public int getListCount3(Map m) throws Exception;

	/*검색 결과 페이징 목록*/
	public List<ApartInfoEtcBean> getInfoEtcList3(Map m) throws Exception ;

}