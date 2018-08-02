package com.naver.house.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.house.bean.ApartInfoPolicyBean;


/*@Component를 이용해서 스프링 컨테이너가 해당 클래스 객체를 생성하도록 설정 할수 있지만
모든 클래스에 @Component를 할당하면 어떤 클래스가 어떤 역할을 수행하는지 파악하기 어렵습니다.
스프링 프레임워크에서는 이런  클래스들을 분류하기 위해서 @Component를 상속하여 다음과 같은 세개의 에노테이션을 

1. @Controller - 사용자의 요청을 제어하는 Controller 클래스
2. @Repository - 데이터 베이스 연동을 처리하는 DAO클래스
3. @Service - 비즈니스 로직을 처리하는 Service 클래스*/


@Repository("infoPolicyDAO")
public class ApartInfoPolicyDAOImpl {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/*자료실 저장*/
	public void insertInfoPolicy(ApartInfoPolicyBean infoPolicybean) throws Exception{
		sqlSession.insert("infoPolicy_insert",infoPolicybean);
	}
	
	/* 자료실 총 게시물 수*/
	public int getListCount() throws Exception{
		int count = ((Integer)sqlSession.selectOne("infoPolicy_count")).intValue();
		return count;
	}

	/* 자료실 목록과 페이징 */
	public List<ApartInfoPolicyBean> getInfoPolicyList(Map m) throws Exception{
		List<ApartInfoPolicyBean> list = sqlSession.selectList("infoPolicy_list",m);
		return list;
	}

	/*번호를 기준으로 자료실 내용 가져오기 */
	public ApartInfoPolicyBean getInfoPolicyCont(int num) throws Exception{
		ApartInfoPolicyBean bean = sqlSession.selectOne("infoPolicy_cont", num);
		return bean;
	}

	/*내용보기 할때만 조회수 증가*/
	public void infoPolicyHit(int num) throws Exception{
		sqlSession.update("infoPolicy_hit", num);
	}
	
	/*자료실 수정*/
	public void editInfoPolicy(ApartInfoPolicyBean infoPolicybean) throws Exception{
		sqlSession.update("infoPolicy_edit", infoPolicybean);
	}

	/*자료실 삭제*/
	public void deleteInfoPolicy(int infoPolicy_num) {
		sqlSession.delete("infoPolicy_delete",infoPolicy_num);
	}

	/*검색 결과 게시물 수*/
	public int getListCount3(Map m) {
		int count = 0;
		count = ((Integer)sqlSession.selectOne("infoPolicyfind_cnt", m)).intValue();
		return count;
	}

	/*검색 결과 페이징 목록*/
	public List<ApartInfoPolicyBean> getInfoPolicyList3(Map m) {
		List<ApartInfoPolicyBean> list = sqlSession.selectList("infoPolicy_find",m);
		return list;
	}

}
