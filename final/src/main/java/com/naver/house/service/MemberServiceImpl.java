package com.naver.house.service;

import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.house.bean.AdminBean;
import com.naver.house.bean.MemberBean;
import com.naver.house.dao.MemberDAOImpl;


@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAOImpl memDAO;
	
	
	@Override
	public int checkMemberId(String id) throws Exception {
		int re = -1;
		
		MemberBean mb = memDAO.checkMemberId(id);
		if(mb != null) re=1;
		return re;
	}

	
	@Override
	public MemberBean findpwd(Map pm) throws Exception {
		return memDAO.findpwd(pm);
	}

	@Override
	public void insertMember(MemberBean m) throws Exception {
		memDAO.insertMember(m);
		
	}
	
	@Override
	public void insertAdmin(AdminBean a) throws Exception {
		memDAO.insertAdmin(a);
		
	}
	
	@Override
	public MemberBean userCheck(String id) throws Exception {
		return memDAO.userCheck(id);
	}



	@Override
	public void updateMember(MemberBean member) throws Exception {
		memDAO.updateMember(member);
	}
    
	@Override
	public void deleteMember(String id) throws Exception {
		memDAO.deleteMember(id);
	}


	@Override
	public MemberBean join_totalscore(String id) throws Exception {
		MemberBean mem= new MemberBean();
		mem=memDAO.join_totalscore(id);
		return mem;
	}


	@Override
	public AdminBean adminCheck(String Admin_id){
		return memDAO.adminCheck(Admin_id);
	}


	@Override
	public int user_idcheck(String id) {
		int count = memDAO.user_idcheck(id);
		return count;
	}


	@Override
	public int admin_idcheck(String id) {
		// TODO Auto-generated method stub
		int count = memDAO.admin_idcheck(id);
		return count;
	}

	@Override
	public List<MemberBean> getList() throws Exception {
		List<MemberBean> list = new ArrayList<MemberBean>();
		list =memDAO.getBoardList();
		return list;
	}


	@Override
	public MemberBean getInfo(String id) {
		MemberBean mem= new MemberBean();
		mem=memDAO.getInfo(id);
		return mem;
	}
	
	
}
