package com.naver.house.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.house.bean.ApartInfoDocBean;


/*@Component를 이용해서 스프링 컨테이너가 해당 클래스 객체를 생성하도록 설정 할수 있지만
모든 클래스에 @Component를 할당하면 어떤 클래스가 어떤 역할을 수행하는지 파악하기 어렵습니다.
스프링 프레임워크에서는 이런  클래스들을 분류하기 위해서 @Component를 상속하여 다음과 같은 세개의 에노테이션을 

1. @Controller - 사용자의 요청을 제어하는 Controller 클래스
2. @Repository - 데이터 베이스 연동을 처리하는 DAO클래스
3. @Service - 비즈니스 로직을 처리하는 Service 클래스*/


@Repository("infoDocDAO")
public class ApartInfoDocDAOImpl {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	  /*자료실 저장*/
	public void insertInfoDoc(ApartInfoDocBean infoDocbean) throws Exception{
		sqlSession.insert("infoDoc_insert",infoDocbean);
	}
	
	public int getListCount() throws Exception{
		int count = ((Integer)sqlSession.selectOne("infoDoc_count")).intValue();
		return count;
	}
	
	public List<ApartInfoDocBean> getInfoDocList(Map m) throws Exception {
		List<ApartInfoDocBean> list = sqlSession.selectList("infoDoc_list",m);
		return list;
	}
	
	


	public ApartInfoDocBean getInfoDocCont(int num) throws Exception{
		ApartInfoDocBean bean = sqlSession.selectOne("infoDoc_cont", num);
		return bean;
	}
	

	public void editInfoDoc(ApartInfoDocBean infoDocbean) throws Exception{
		sqlSession.update("infoDoc_edit", infoDocbean);
	}

	public void deleteInfoDoc(int infoDoc_num) {
		sqlSession.delete("infoDoc_delete",infoDoc_num);
	}

	public int getListCount3(Map m) {
		int count = 0;
		count = ((Integer)sqlSession.selectOne("infoDocfind_cnt", m)).intValue();
		return count;
	}

	public List<ApartInfoDocBean> getInfoDocList3(Map m) {
		List<ApartInfoDocBean> list = sqlSession.selectList("infoDoc_find",m);
		return list;
	}
}
