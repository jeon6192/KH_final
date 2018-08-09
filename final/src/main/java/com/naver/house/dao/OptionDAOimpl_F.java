package com.naver.house.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.AptComplexBean;
import com.naver.house.bean.EL_AND_AptBean;
import com.naver.house.bean.EW_AND_AptBean;
import com.naver.house.bean.Event_list;
import com.naver.house.bean.Event_winBean;
import com.naver.house.bean.Option_fBean;
import com.naver.house.bean.Option_nfBean;
import com.naver.house.bean.OptionsInfoBean;

@Repository
public class OptionDAOimpl_F {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<Event_winBean> checkWinner(int user_no) throws Exception {
		// TODO Auto-generated method stub
		List<Event_winBean> ew= sqlsession.selectList("Option_free.getEvent_win",user_no);
		return ew;
	}

	public ApartmentBean getAptInfo(long apart_id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("Option_free.getAptinfo",apart_id);
	}

	public AptComplexBean getAptXinfo(long apart_xid) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("Option_free.getAptXinfo",apart_xid);
	}

	public void insertOF(Option_fBean ofbean, Option_nfBean onfbean) {
		// TODO Auto-generated method stub
		sqlsession.insert("Option_free.insertOF",ofbean);
		sqlsession.insert("Option_nfree.insertNOF",onfbean);
	}

	public int getCheck(long aptid) {
		// TODO Auto-generated method stub
		
		return sqlsession.selectOne("Option_free.chekfirst",aptid);
	}

	public Option_fBean getFreeOp(long apt_id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("Option_free.getFreeOp",apt_id);
	}

	public Option_nfBean getNfreeOp(long apt_id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("Option_nfree.getNfreeOp",apt_id);
	}

	public void updateOp(Option_fBean ofbean, Option_nfBean onfbean) {
		// TODO Auto-generated method stub
		sqlsession.update("Option_free.updateOF",ofbean);
		sqlsession.update("Option_nfree.updateONF",onfbean);
		
	}

	public List<EW_AND_AptBean> getWinList(int user_no) {
		// TODO Auto-generated method stub
		List<EW_AND_AptBean> winList= sqlsession.selectList("Option_free.getWinList",user_no);
		
		return winList;
	}

	public List<AptComplexBean> getAptXList(Map map) {
		// TODO Auto-generated method stub
		List<AptComplexBean> aptXList=sqlsession.selectList("Option_free.getAptXList", map);
		return aptXList;
	}

	public int getAptXListCount(Map map) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("Option_free.getAptXListCount",map);
	}

	public List<OptionsInfoBean> getOptionInfo(int complex_id) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("Option_free.getOptionInfo",complex_id);
	}

	public List<Integer> getDongInfo(int complex_id) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("Option_free.getDongInfo",complex_id);
	}

	public List<Event_list> getCheckEventIn(int user_no) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("Option_free.getCheckInList",user_no);
	}

	public List<EL_AND_AptBean> getELIn(int user_no) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("Option_free.getEWInList",user_no);
	}
}
