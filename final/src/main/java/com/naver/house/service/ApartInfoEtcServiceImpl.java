package com.naver.house.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.naver.house.bean.ApartInfoEtcBean;
import com.naver.house.dao.ApartInfoEtcDAOImpl;


@Service("infoEtcService")
public class ApartInfoEtcServiceImpl implements ApartInfoEtcService{
	
	@Resource(name="infoEtcDAO")
	private ApartInfoEtcDAOImpl infoEtcDAO;
	
	
	@Override
	public void insertInfoEtc(ApartInfoEtcBean infoEtcbean) throws Exception {
		infoEtcDAO.insertInfoEtc(infoEtcbean);
		
	}
	
	@Override
	public int getListCount() throws Exception{
		return infoEtcDAO.getListCount();
	}

	@Override
	public List<ApartInfoEtcBean> getInfoEtcList(Map m) throws Exception {
		return infoEtcDAO.getInfoEtcList(m);
	}

	@Override
	public ApartInfoEtcBean getInfoEtcCont(int num) throws Exception {
		return infoEtcDAO.getInfoEtcCont(num);
	}
	
	/*상세보기 글의 rnum구하기 */
	public int findContRnum(int num) throws Exception{
		return infoEtcDAO.findContRnum(num);
	}
	
	/*rnum을 기준으로 +1, -1 기타정보글의 번호, 제목 */
	public List<ApartInfoEtcBean> getRnumPrevNext(int num) throws Exception{
		return infoEtcDAO.getRnumPrevNext(num);
	}

	@Override
	public void infoEtcHit(int num) throws Exception {
		infoEtcDAO.infoEtcHit(num);
	}

	@Override
	public void editInfoEtc(ApartInfoEtcBean infoEtcbean) throws Exception {
		infoEtcDAO.editInfoEtc(infoEtcbean);
		
	}

	@Override
	public void deleteInfoEtc(int infoEtc_num) throws Exception {
		infoEtcDAO.deleteInfoEtc(infoEtc_num);
	}
	
	@Override
	public int getListCount3(Map m) throws Exception{
		return infoEtcDAO.getListCount3(m);
	}

	@Override
	public List<ApartInfoEtcBean> getInfoEtcList3(Map m) throws Exception {
		return infoEtcDAO.getInfoEtcList3(m);
	}
	
	

}
