package com.naver.house.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.AptComplexBean;
import com.naver.house.bean.Event_winBean;
import com.naver.house.bean.Option_fBean;
import com.naver.house.bean.Option_nfBean;

@Repository
public class OptionDAOimpl_F {
	
	@Autowired
	private SqlSession sqlsession;
	
	public int checkWinner(int user_no) throws Exception {
		// TODO Auto-generated method stub
		int checkresult=0;
		int check1 =sqlsession.selectOne("Option_free.checkwinner1",user_no); //count占쏙옙 占싹댐옙 占쏙옙占쏙옙占싶븝옙
		
		if(check1==0) {
			checkresult=1;
		}else {
			Event_winBean ew=sqlsession.selectOne("Option_free.getEvent_win",user_no);
			int check2=ew.getEvent_con();
			if(check2==1) { //占쏙옙占�
				checkresult=1;
			}else {//占쌌곤옙
				checkresult=0;
			}
		}

		return checkresult;
	}

	public ApartmentBean getAptInfo(int user_no) {
		// TODO Auto-generated method stub
		
		Event_winBean ew=sqlsession.selectOne("Option_free.getEvent_win",user_no); 
		long apart_id=ew.getApart_id();
		return sqlsession.selectOne("Option_free.getAptInfo",apart_id);
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

	public int getCheck(int user_no) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("Option_free.chekfirst",user_no);
	}

	public Option_fBean getFreeOp(int user_no) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("Option_free.getFreeOp",user_no);
	}

	public Option_nfBean getNfreeOp(int user_no) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("Option_nfree.getNfreeOp",user_no);
	}

	public void updateOp(Option_fBean ofbean, Option_nfBean onfbean) {
		// TODO Auto-generated method stub
		sqlsession.update("Option_free.updateOF",ofbean);
		sqlsession.update("Option_nfree.updateONF",onfbean);
		
	}
}
