package com.naver.house.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.naver.house.bean.ApartInfoDocBean;
import com.naver.house.dao.ApartInfoDocDAOImpl;


@Service("infoDocService")
public class ApartInfoDocServiceImpl implements ApartInfoDocService{
	
	@Resource(name="infoDocDAO")
	private ApartInfoDocDAOImpl infoDocDAO;
	
	@Override
	public void insertInfoDoc(ApartInfoDocBean infoDocbean) throws Exception {
		infoDocDAO.insertInfoDoc(infoDocbean);
	}
	
	@Override
	public int getListCount() throws Exception {
		return infoDocDAO.getListCount();
	}

	@Override
	public List<ApartInfoDocBean> getInfoDocList(Map m) throws Exception {
		return infoDocDAO.getInfoDocList(m);
	}
	
	@Override
	public ApartInfoDocBean getInfoDocCont(int infoDoc_num) throws Exception {
		return infoDocDAO.getInfoDocCont(infoDoc_num);
	}
	
	@Override
	public void editInfoDoc(ApartInfoDocBean infoDocbean) throws Exception {
		infoDocDAO.editInfoDoc(infoDocbean);
	}
	
	@Override
	public void deleteInfoDoc(int infoDoc_num) throws Exception {
		infoDocDAO.deleteInfoDoc(infoDoc_num);
	}
	
	@Override
	public int getListCount3(Map m) throws Exception {
		return infoDocDAO.getListCount3(m);
	}
	

	@Override
	public List<ApartInfoDocBean> getInfoDocList3(Map m) throws Exception {
		return infoDocDAO.getInfoDocList3(m);
	}


}
