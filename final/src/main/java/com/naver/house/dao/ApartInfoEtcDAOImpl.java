package com.naver.house.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.house.bean.ApartInfoEtcBean;



/*@Component를 이용해서 스프링 컨테이너가 해당 클래스 객체를 생성하도록 설정 할수 있지만
모든 클래스에 @Component를 할당하면 어떤 클래스가 어떤 역할을 수행하는지 파악하기 어렵습니다.
스프링 프레임워크에서는 이런  클래스들을 분류하기 위해서 @Component를 상속하여 다음과 같은 세개의 에노테이션을 

1. @Controller - 사용자의 요청을 제어하는 Controller 클래스
2. @Repository - 데이터 베이스 연동을 처리하는 DAO클래스
3. @Service - 비즈니스 로직을 처리하는 Service 클래스*/


@Repository("infoEtcDAO")
public class ApartInfoEtcDAOImpl {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/*자료실 저장*/
	public void insertInfoEtc(ApartInfoEtcBean infoEtcbean) throws Exception{
		sqlSession.insert("infoEtc_insert",infoEtcbean);
	}
	
	/* 자료실 총 게시물 수*/
	public int getListCount() throws Exception{
		int count = ((Integer)sqlSession.selectOne("infoEtc_count")).intValue();
		return count;
	}

	/* 자료실 목록과 페이징 */
	public List<ApartInfoEtcBean> getInfoEtcList(Map m) throws Exception{
		List<ApartInfoEtcBean> list = sqlSession.selectList("infoEtc_list",m);
		return list;
	}

	/*번호를 기준으로 자료실 내용 가져오기 */
	public ApartInfoEtcBean getInfoEtcCont(int num) throws Exception{
		ApartInfoEtcBean bean = sqlSession.selectOne("infoEtc_cont", num);
		return bean;
	}
	
	/*상세보기 글의 rnum구하기 */
	public int findContRnum(int num) throws Exception{
		int rnum = sqlSession.selectOne("findRnum",num);
		return rnum;
	}
	
	/*rnum을 기준으로 +1, -1 기타정보글의 번호, 제목 */
	public List<ApartInfoEtcBean> getRnumPrevNext(int num) throws Exception{
		List<ApartInfoEtcBean> rnumPrevNext =sqlSession.selectList("rnumPrevNext",num);
		return rnumPrevNext;
	}

	/*내용보기 할때만 조회수 증가*/
	public void infoEtcHit(int num) throws Exception{
		sqlSession.update("infoEtc_hit", num);
	}
	
	/*자료실 수정*/
	public void editInfoEtc(ApartInfoEtcBean infoEtcbean) throws Exception{
		sqlSession.update("infoEtc_edit", infoEtcbean);
	}

	/*자료실 삭제*/
	public void deleteInfoEtc(int infoEtc_num) {
		sqlSession.delete("infoEtc_delete",infoEtc_num);
	}

	/*검색 결과 게시물 수*/
	public int getListCount3(Map m) {
		int count = 0;
		count = ((Integer)sqlSession.selectOne("infoEtcfind_cnt", m)).intValue();
		return count;
	}

	/*검색 결과 페이징 목록*/
	public List<ApartInfoEtcBean> getInfoEtcList3(Map m) {
		List<ApartInfoEtcBean> list = sqlSession.selectList("infoEtc_find",m);
		return list;
	}

}
