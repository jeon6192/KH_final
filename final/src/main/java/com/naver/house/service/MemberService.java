package com.naver.house.service;
import java.lang.reflect.Member;
import java.util.List;
import java.util.Map;

import com.naver.house.bean.AdminBean;
import com.naver.house.bean.Article;
import com.naver.house.bean.MemberBean;


public interface MemberService {
	/*아이디 중복 체크 */
	public int checkMemberId(String id) throws Exception;

	/* 비번 검색 */
	public MemberBean findpwd(Map pm) throws Exception ;

	/*회원저장*/
	public void insertMember(MemberBean m) throws Exception;

	/*로그인 인증 체크 */
	public MemberBean userCheck(String id) throws Exception;

	/*회원삭제*/
	public void deleteMember(String id) throws Exception;

	 /*회원수정*/
	public void updateMember(MemberBean member) throws Exception;

	/*관리자 회원가입*/
	public void insertAdmin(AdminBean a) throws Exception;
	
	
	/*회원 가입 완료 후 총 점수 보여주는 페이지 */
	public MemberBean join_totalscore(String id) throws Exception;

	public AdminBean adminCheck(String id);

	
	/*회원 아이디 로그인 체크*/
	
	public int user_idcheck(String id);
	
	public int admin_idcheck(String id);
	
	public List<MemberBean> getList()throws Exception ;

	public MemberBean getInfo(String id);

	public MemberBean findpassword(Map pm);

	public List<Article> getqnaList(String id)throws Exception ;


}
