package com.naver.house.service;
import java.lang.reflect.Member;
import java.util.List;
import java.util.Map;

import com.naver.house.bean.AdminBean;
import com.naver.house.bean.Article;
import com.naver.house.bean.MemberBean;


public interface MemberService {
	/*���̵� �ߺ� üũ */
	public int checkMemberId(String id) throws Exception;

	/* ��� �˻� */
	public MemberBean findpwd(Map pm) throws Exception ;

	/*ȸ������*/
	public void insertMember(MemberBean m) throws Exception;

	/*�α��� ���� üũ */
	public MemberBean userCheck(String id) throws Exception;

	/*ȸ������*/
	public void deleteMember(String id) throws Exception;

	 /*ȸ������*/
	public void updateMember(MemberBean member) throws Exception;

	/*������ ȸ������*/
	public void insertAdmin(AdminBean a) throws Exception;
	
	
	/*ȸ�� ���� �Ϸ� �� �� ���� �����ִ� ������ */
	public MemberBean join_totalscore(String id) throws Exception;

	public AdminBean adminCheck(String id);

	
	/*ȸ�� ���̵� �α��� üũ*/
	
	public int user_idcheck(String id);
	
	public int admin_idcheck(String id);
	
	public List<MemberBean> getList()throws Exception ;

	public MemberBean getInfo(String id);

	public MemberBean findpassword(Map pm);

	public List<Article> getqnaList(String id)throws Exception ;


}
