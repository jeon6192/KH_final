package com.naver.house.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.AptComplexBean;
import com.naver.house.bean.EL_AND_AptBean;
import com.naver.house.bean.EW_AND_AptBean;
import com.naver.house.bean.Event_list;
import com.naver.house.bean.Event_winBean;
import com.naver.house.bean.Option_fBean;
import com.naver.house.bean.Option_nfBean;
import com.naver.house.bean.OptionsInfoBean;
import com.naver.house.dao.OptionDAOimpl_F;

@Service("OptionServiceF")
public class OptionServiceImpleF implements OptionServiceF{
	
	@Autowired
	private OptionDAOimpl_F ofdao;
	
	@Override
	public List<Event_winBean> checkWinner(int user_no) throws Exception {
		// TODO Auto-generated method stub
		List<Event_winBean> check=ofdao.checkWinner(user_no);
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
	public ApartmentBean getAptInfo(long apart_id) {
		// TODO Auto-generated method stub
		return ofdao.getAptInfo(apart_id);	
	}

	@Override
	public AptComplexBean getAptXinfo(long apart_xid) {
		// TODO Auto-generated method stub
		return ofdao.getAptXinfo(apart_xid);
	}

	@Override
	public int checkFirst(long aptid) {
		// TODO Auto-generated method stub
		return ofdao.getCheck(aptid);
	}

	@Override
	public Option_fBean getFreeOp(long apt_id) {
		// TODO Auto-generated method stub
		return ofdao.getFreeOp(apt_id);
	}

	@Override
	public Option_nfBean getNfreeOp(long apt_id) {
		// TODO Auto-generated method stub
		return ofdao.getNfreeOp(apt_id);
	}

	@Override
	public void set_optionupdate(Option_fBean ofbean, Option_nfBean onfbean) {
		// TODO Auto-generated method stub
		ofdao.updateOp(ofbean,onfbean);
	}

	@Override
	public List<EW_AND_AptBean> getWinList(int user_no) {
		// TODO Auto-generated method stub
		List<EW_AND_AptBean> winList=ofdao.getWinList(user_no);
		return winList;
	}

	@Override
	public List<AptComplexBean> getAptXList(Map map) {
		// TODO Auto-generated method stub
		List<AptComplexBean> aptXList=ofdao.getAptXList(map);
		return aptXList;
	}

	@Override
	public int getListCount(Map map) {
		// TODO Auto-generated method stub
		return ofdao.getAptXListCount(map);
	}

	@Override
	public List<OptionsInfoBean> getOptionInfo(int complex_id) {
		// TODO Auto-generated method stub
		return ofdao.getOptionInfo(complex_id);
	}

	@Override
	public List<Integer> getDongInfo(int complex_id) {
		// TODO Auto-generated method stub
		return ofdao.getDongInfo(complex_id);
	}

	@Override
	public List<Event_list> checkEventIn(int user_no) {
		// TODO Auto-generated method stub
		return ofdao.getCheckEventIn(user_no);
	}

	@Override
	public List<EL_AND_AptBean> getEventInList(int user_no) {
		// TODO Auto-generated method stub
		return ofdao.getELIn(user_no);
	}
	
}
