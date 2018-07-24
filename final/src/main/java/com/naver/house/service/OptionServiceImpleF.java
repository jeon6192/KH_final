package com.naver.house.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.AptComplexBean;
import com.naver.house.bean.Option_fBean;
import com.naver.house.bean.Option_nfBean;
import com.naver.house.dao.OptionDAOimpl_F;

@Service("OptionServiceF")
public class OptionServiceImpleF implements OptionServiceF{
	
	@Autowired
	private OptionDAOimpl_F ofdao;
	
	@Override
	public int checkWinner(int user_no) throws Exception {
		// TODO Auto-generated method stub
		int check=ofdao.checkWinner(user_no);
		return check;
	}

	@Override
	public void set_option(Option_fBean ofbean, Option_nfBean onfbean) throws Exception {
		// TODO Auto-generated method stub
		ofdao.insertOF(ofbean,onfbean);
	}

	@Override
	public Option_fBean foption_get(int user_no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ApartmentBean getAptInfo(int user_no) {
		// TODO Auto-generated method stub
		return ofdao.getAptInfo(user_no);	
	}

	@Override
	public AptComplexBean getAptXinfo(long apart_xid) {
		// TODO Auto-generated method stub
		return ofdao.getAptXinfo(apart_xid);
	}

	@Override
	public int checkFirst(int user_no) {
		// TODO Auto-generated method stub
		return ofdao.getCheck(user_no);
	}

	@Override
	public Option_fBean getFreeOp(int user_no) {
		// TODO Auto-generated method stub
		return ofdao.getFreeOp(user_no);
	}

	@Override
	public Option_nfBean getNfreeOp(int user_no) {
		// TODO Auto-generated method stub
		return ofdao.getNfreeOp(user_no);
	}

	@Override
	public void set_optionupdate(Option_fBean ofbean, Option_nfBean onfbean) {
		// TODO Auto-generated method stub
		ofdao.updateOp(ofbean,onfbean);
	}
	
}
