package com.naver.house.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.house.bean.AdminBean;
import com.naver.house.bean.MemberBean;



@Repository
public class MemberDAOImpl {
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	/*아이디 중복 체크*/
	public MemberBean checkMemberId(String id) throws Exception{
		return (MemberBean) sqlsession.selectOne("login_check",id);
	}
	/*아이디 중복 체크끝*/
	
	
	
	/*회원저장*/
	public void insertMember(MemberBean m) throws Exception{
		sqlsession.insert("member_join",m);
	}
	
	public void insertAdmin(AdminBean a) throws Exception{
		sqlsession.insert("admin_join",a);
	}
	
	
	public  MemberBean userCheck(String id) {
		return sqlsession.selectOne("login_check",id);
		
	}
	
	public  AdminBean adminCheck(String Admin_id) {
		return sqlsession.selectOne("admin_check",Admin_id);
		
	}
	
	public void updateMember(MemberBean member) {
		sqlsession.update("member_edit",member);
	}
	
	/*비번검색*/
	public MemberBean findpwd(Map<String,String> pm)throws Exception{
		return (MemberBean)sqlsession.selectOne("pwd_find",pm);
	}
	
	/*회원탈퇴*/
	public void deleteMember(String id) {
		sqlsession.update("member_delete",id);
	}


	/*회원 가입 완료 후 총 점수 환산 페이지 */
	public MemberBean join_totalscore(String id) {
		return (MemberBean)sqlsession.selectOne("join_totalscore", id);
		
	}
	
	public int user_idcheck(String id) {
		int count=sqlsession.selectOne("user_idcheck",id);
		return count;
	}
	
	public int admin_idcheck(String id) {
		int count=sqlsession.selectOne("admin_idcheck",id);
		return count;
	}



	public List<MemberBean> getBoardList() throws Exception {
		List<MemberBean> list = sqlsession.selectList("getList");
		return list;
	}



	public MemberBean getInfo(String id) {
		return sqlsession.selectOne("member_info",id);
	}
	
	
	
}
