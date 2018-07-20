package com.naver.house.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.house.bean.ApartListBean;
import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.AptComplexBean;
import com.naver.house.service.ApartmentService;

@Controller
public class ApartmentController {
	public final static String PHARM_URL = "http://openapi.hira.or.kr/openapi/service/pharmacyInfoService/getParmacyBasisList";
    public final static String KEY = "TVCsVr8g3adcmCcALi9bYrk2cLFJEr3fCn16ZYY0FYOtOs6n5lC%2BmB2sN2%2FjORFcTZNOwiHJtGRb39KL2Doqmw%3D%3D";
	
	@Autowired
	private ApartmentService apartmentService;
	
	
	@RequestMapping("/main.com")
	public ModelAndView mainPage() {
		//return new ModelAndView("template");
		return new ModelAndView("apart/test");
	}
	
	@RequestMapping(value = "/apart_insertform.com")
	public ModelAndView insertform_apart() {
		
		return new ModelAndView("template", "viewName", "apart/insert_aptcomplex.jsp");
	}
	
	@RequestMapping(value = "/apart_insert.com")
	public ModelAndView insert_apart(AptComplexBean aptComplexBean, 
			ApartListBean apartListBean, 
			@RequestParam(value="chk_subway", defaultValue="false") boolean chk_subway) throws Exception {
		aptComplexBean.setComplex_state(0);
		if (chk_subway) {
			aptComplexBean.setComplex_subway(1);
		} else {
			aptComplexBean.setComplex_subway(0);
		}
		
		String id1 = aptComplexBean.getComplex_pdate().replaceAll("-", "") + new Random().nextInt(1000);
		aptComplexBean.setComplex_id(Long.parseLong(id1));
		
		
		System.out.println("단지고유 번호 : "+aptComplexBean.getComplex_id());
		System.out.println("주소 : "+aptComplexBean.getComplex_address()+"(나중에)");
		System.out.println("위도 : "+aptComplexBean.getComplex_lat()+"(나중에)");
		System.out.println("경도 : "+aptComplexBean.getComplex_lng()+"(나중에)");
		System.out.println("아파트명 : "+aptComplexBean.getComplex_apartname());
		System.out.println("분양시기 : "+aptComplexBean.getComplex_pdate());
		System.out.println("소개글 : "+aptComplexBean.getComplex_info());
		System.out.println("역세권 : "+aptComplexBean.getComplex_subway());
		System.out.println("근처역 : "+aptComplexBean.getComplex_station());
		System.out.println("소요시간 : "+aptComplexBean.getComplex_foot());
		
		List<ApartmentBean> apartmentBeanList = new ArrayList<ApartmentBean>();
		int seq = new Random().nextInt(100);
		for (ApartmentBean apart : apartListBean.getApartBeanList()) {
			for (int i = 1; i <= apart.getApart_floor(); i++) {
				for (int j = 1; j < 5; j++) {
					
					String id2 = id1 + (seq++);
					apart.setApart_id(Long.parseLong(id2));
					
					apart.setComplex_id(Long.parseLong(id1));
					
					apart.setApart_ho(Integer.parseInt(Integer.toString(i) + "0" + j));
					
					
					System.out.println("\n--------동---------- : "+apart.getApart_dong());
					System.out.println("아파트 ID : "+apart.getApart_id());
					System.out.println("단지고유 번호 : "+apart.getComplex_id());
					System.out.println("동 : "+apart.getApart_dong());
					System.out.println("호 : "+apart.getApart_ho());
					System.out.println("층 : "+apart.getApart_floor());
					System.out.println("면적 : "+apart.getApart_area());
					System.out.println("가격 : "+apart.getApart_price());
					System.out.println("방 : "+apart.getApart_room());
					System.out.println("화장실 : "+apart.getApart_toilet());
					System.out.println("인테리어사진 : "+apart.getApart_interior());
					
					apartmentBeanList.add(apart);
				}
			}
			
		}
		
		
		Map<String, Object> apartMap = new HashMap<String, Object>();
		
		apartMap.put("aptComplexBean", aptComplexBean);
		apartMap.put("apartmentListBean", apartmentBeanList);
		
		apartmentService.insert_apart(apartMap);
		
		
		return new ModelAndView("redirect:/apart_insertform.com");
		//return new ModelAndView("redirect:/apart_list.com");
	}
	
	@RequestMapping(value = "/apart_detail.com")
	public ModelAndView detail_apart(@RequestParam("complex_id") int complex_id, 
			@RequestParam(value = "page", defaultValue = "1") int page) throws Exception {
		
		return new ModelAndView("template", "viewName", "apart/detail");
	}
	
}
