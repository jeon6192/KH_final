package com.naver.house.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.AptComplexBean;
import com.naver.house.bean.Option_fBean;
import com.naver.house.bean.Option_nfBean;
import com.naver.house.service.OptionServiceF;
import com.naver.house.service.OptionServiceNF;

@Controller
public class OptionsAction {
	@Autowired
	private OptionServiceF opserviceF;
	private OptionServiceNF opserivceNF;
	
	@RequestMapping(value="/option.op")
	public ModelAndView optionpage(HttpServletRequest request)throws Exception {
		//??��û �Ⱓ �� ��ȸ�� �����ϰ� ��?
		
		ModelAndView mv=new ModelAndView( "template","viewName", "options/Option_insert.jsp");
		
		//���� ���� �ڵ� ���� --����
	
		HttpSession session = request.getSession();
		
		//�α��� �� �Ѱ�������
			session.setAttribute("user_no", 1);
			int user_no=(Integer) session.getAttribute("user_no");
			
			//db���� Ȯ��
			//���ͼ��͸� ���� �α��� ���������� �� ����
			//�α��� �� ��÷ ����Ʈ �־�� ������ Event_win table���� event_con �� 0�̰�  User_no �� �α��� ���ǰ��̶� ���� ��.
			//��÷����Ʈ ������  �Ⱥ�����
					//��÷�� ������ �� ��÷�ڰ� ������ ����Ʈ ���� �����ͼ� �����ֱ�
			
			int event_con=opserviceF.checkWinner(user_no);
			if(event_con==0) {
				//��÷ Ȯ��
				System.out.println("��÷�� ����");
				
				
				//��û �� �� �ִ��� Ȯ��
				int first_check=opserviceF.checkFirst(user_no);
				if(first_check==0) { //�ɼ� ��û ó��->��û ������
					mv=new ModelAndView( "template","viewName", "options/Option_insert.jsp");
				}else {	//�ɼ� ��û �� �� ����->��ȸ ������
					mv=new ModelAndView( "template","viewName", "options/Option_show.jsp");
					Option_fBean freeOp=opserviceF.getFreeOp(user_no);
					Option_nfBean nfreeOp=opserviceF.getNfreeOp(user_no);
					mv.addObject("freeOp",freeOp);
					Gson gson=new Gson(); //gson���� ��ü�� jsonŸ�� ����� �ֱ�
					
					String foJson=gson.toJson(freeOp);
					String nfoJson=gson.toJson(nfreeOp); 
					
					mv.addObject("foJson",foJson);
					mv.addObject("nfoJson",nfoJson);
					mv.addObject("nfreeOp",nfreeOp);
				}
				ApartmentBean apartinfo=opserviceF.getAptInfo(user_no); //apart���� ������
				mv.addObject("apartinfo",apartinfo);//����Ʈ ���� ����
			
				long apart_xid=apartinfo.getComplex_id();
				AptComplexBean apartXinfo=opserviceF.getAptXinfo(apart_xid); //����Ʈ complex���� ������
				mv.addObject("apartXinfo",apartXinfo);//����
				mv.addObject("area",apartinfo.getApart_area());
				
			}else {
				System.out.println("��÷�� �ƴ�");
				mv.addObject("event_con",0);
			}
		
			
		
		return mv;
	}
	
	@RequestMapping(value="/options_insert.op")
	public ModelAndView insert_option(HttpServletRequest request, Option_fBean ofbean, Option_nfBean onfbean)throws Exception{
		HttpSession session=request.getSession();
		int user_no=(Integer) session.getAttribute("user_no");
		ofbean.setUser_no(user_no);
		onfbean.setUser_no(user_no);
		
		System.out.println(" ACTION insert �Լ� �巯��");
		int totalcost=Integer.parseInt(request.getParameter("nf_cost"));
		onfbean.setNf_cost(totalcost);
		opserviceF.set_option(ofbean,onfbean); //��ħ ����;;
		
		ModelAndView mv=new ModelAndView("template", "viewName", "options/Option_show.jsp");
		Gson gson=new Gson(); //gson���� ��ü�� jsonŸ�� ����� �ֱ�
		
		String foJson=gson.toJson(ofbean);
		String nfoJson=gson.toJson(onfbean); 
		
		mv.addObject("foJson",foJson);
		mv.addObject("nfoJson",nfoJson);
		
		ApartmentBean apartinfo=opserviceF.getAptInfo(user_no); //apart���� ������
		mv.addObject("apartinfo",apartinfo);//����Ʈ ���� ����
	
		long apart_xid=apartinfo.getComplex_id();
		AptComplexBean apartXinfo=opserviceF.getAptXinfo(apart_xid); //����Ʈ complex���� ������
		mv.addObject("apartXinfo",apartXinfo);//����
		mv.addObject("area",apartinfo.getApart_area());
		
	
		return mv;
	}
	
	@RequestMapping(value="/options_update.op")
	public ModelAndView update_option(HttpServletRequest request, Option_fBean ofbean, Option_nfBean onfbean)throws Exception{
		HttpSession session=request.getSession();
		int user_no=(Integer) session.getAttribute("user_no");
		ofbean.setUser_no(user_no);
		onfbean.setUser_no(user_no);
		
		System.out.println(" ACTION update �Լ� �巯��");
		int totalcost=Integer.parseInt(request.getParameter("nf_cost"));
		onfbean.setNf_cost(totalcost);
		opserviceF.set_optionupdate(ofbean,onfbean); //��ħ ����;;
		ModelAndView mv=new ModelAndView("template", "viewName", "options/Option_show.jsp");
		Gson gson=new Gson(); //gson���� ��ü�� jsonŸ�� ����� �ֱ�
		
		String foJson=gson.toJson(ofbean);
		String nfoJson=gson.toJson(onfbean); 
		
		mv.addObject("foJson",foJson);
		mv.addObject("nfoJson",nfoJson);
		
		ApartmentBean apartinfo=opserviceF.getAptInfo(user_no); //apart���� ������
		mv.addObject("apartinfo",apartinfo);//����Ʈ ���� ����
	
		long apart_xid=apartinfo.getComplex_id();
		AptComplexBean apartXinfo=opserviceF.getAptXinfo(apart_xid); //����Ʈ complex���� ������
		mv.addObject("apartXinfo",apartXinfo);//����
		mv.addObject("area",apartinfo.getApart_area());
	
		return mv;
	}
	
	
}
