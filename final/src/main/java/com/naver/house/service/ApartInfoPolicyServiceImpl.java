package com.naver.house.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.naver.house.bean.ApartInfoPolicyBean;
import com.naver.house.dao.ApartInfoPolicyDAOImpl;



@Service("infoPolicyService")
public class ApartInfoPolicyServiceImpl implements ApartInfoPolicyService{
	
	@Resource(name="infoPolicyDAO")
	private ApartInfoPolicyDAOImpl infoPolicyDAO;
	
	
	@Override
	public void insertInfoPolicy(ApartInfoPolicyBean infoPolicybean) throws Exception {
		infoPolicyDAO.insertInfoPolicy(infoPolicybean);
	}
	
	@Override
	public int getListCount() throws Exception{
		return infoPolicyDAO.getListCount();
	}

	@Override
	public List<ApartInfoPolicyBean> getInfoPolicyList(Map m) throws Exception {
		return infoPolicyDAO.getInfoPolicyList(m);
	}

	@Override
	public ApartInfoPolicyBean getInfoPolicyCont(int num) throws Exception {
		return infoPolicyDAO.getInfoPolicyCont(num);
	}

	@Override
	public void infoPolicyHit(int num) throws Exception {
		infoPolicyDAO.infoPolicyHit(num);
	}

	@Override
	public void editInfoPolicy(ApartInfoPolicyBean infoPolicybean) throws Exception {
		infoPolicyDAO.editInfoPolicy(infoPolicybean);
		
	}

	@Override
	public void deleteInfoPolicy(int infoPolicy_num) throws Exception {
		infoPolicyDAO.deleteInfoPolicy(infoPolicy_num);
	}
	
	@Override
	public int getListCount3(Map m) throws Exception{
		return infoPolicyDAO.getListCount3(m);
	}

	@Override
	public List<ApartInfoPolicyBean> getInfoPolicyList3(Map m) throws Exception {
		return infoPolicyDAO.getInfoPolicyList3(m);
	}
	
	

}
