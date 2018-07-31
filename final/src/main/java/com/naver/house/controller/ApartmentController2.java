package com.naver.house.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.house.bean.ApartListBean;
import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.ApartmentBean2;
import com.naver.house.bean.AptComplexBean;
import com.naver.house.service.ApartmentService2;

@Controller
public class ApartmentController2 {
	
	@Autowired
	private ApartmentService2 apartmentService;
	
	
	@RequestMapping("/main.com")
	public ModelAndView mainPage() {
		return new ModelAndView("main");
	}
	
	@RequestMapping(value = "/apart_insertform.com")
	public ModelAndView insertform_apart() {
		
		return new ModelAndView("apart/insert_aptcomplex");
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
		
		String id1 = aptComplexBean.getComplex_pdate().substring(2).replaceAll("-", "") + new Random().nextInt(1000);
		aptComplexBean.setComplex_id(Long.parseLong(id1));
		
		
		System.out.println("단지고유 번호 : "+aptComplexBean.getComplex_id());
		System.out.println("주소 : "+aptComplexBean.getComplex_address()+"(나중에)");
		System.out.println("위도 : "+aptComplexBean.getComplex_lat()+"(나중에)");
		System.out.println("경도 : "+aptComplexBean.getComplex_lng()+"(나중에)");
		System.out.println("아파트명 : "+aptComplexBean.getComplex_apartname());
		System.out.println("분양시작일 : "+aptComplexBean.getComplex_sdate());
		System.out.println("분양종료일 : "+aptComplexBean.getComplex_edate());
		System.out.println("분양시기 : "+aptComplexBean.getComplex_pdate());
		System.out.println("소개글 : "+aptComplexBean.getComplex_info());
		System.out.println("역세권 : "+aptComplexBean.getComplex_subway());
		System.out.println("근처역 : "+aptComplexBean.getComplex_station());
		System.out.println("소요시간 : "+aptComplexBean.getComplex_foot());
		
		List<ApartmentBean> apartmentBeanList = new ArrayList<ApartmentBean>();
		//int seq = new Random().nextInt(100);
		
		for (ApartmentBean apart : apartListBean.getApartBeanList()) {
			int floor = apart.getApart_floor();
			int price = apart.getApart_price();
			for (int i = 1; i <= floor; i++) {
				int floor2 =  (int)(((float)i/(float)floor) * 10.0);
				switch( floor2 ) {
					case 2:
						price = (int) (apart.getApart_price()*1.1);
						break;
					case 4:
						price = (int) (apart.getApart_price()*1.2);
						break;
					case 5:
						price = (int) (apart.getApart_price()*1.3);
						break;
					case 6:
						price = (int) (apart.getApart_price()*1.4);
						break;
					case 7:
						price = (int) (apart.getApart_price()*1.2);
						break;
					case 8:
						price = (int) (apart.getApart_price()*1.1);
						break;
				}
				
				for (int j = 1; j < 5; j++) {
					
					//String id2 = id1 + (seq++);
					ApartmentBean apartBean = new ApartmentBean();
					
					//apartBean.setApart_id(Long.parseLong(id2));
					apartBean.setComplex_id(Long.parseLong(id1));
					apartBean.setApart_ho(Integer.parseInt(Integer.toString(i) + "0" + j));
					apartBean.setApart_dong(apart.getApart_dong());
					apartBean.setApart_floor(apart.getApart_floor());
					apartBean.setApart_area(apart.getApart_area());
					apartBean.setApart_price(price);
					apartBean.setApart_room(apart.getApart_room());
					apartBean.setApart_toilet(apart.getApart_toilet());
					apartBean.setApart_direction(apart.getApart_direction());
					apartBean.setApart_interior(apart.getApart_interior());
					
					System.out.println("아파트 ID : "+apart.getApart_id());
					System.out.println("단지고유 번호 : "+apart.getComplex_id());
					System.out.println("동 : "+apart.getApart_dong());
					System.out.println("호 : "+apart.getApart_ho());
					System.out.println("층 : "+apart.getApart_floor());
					System.out.println("면적 : "+apart.getApart_area());
					System.out.println("가격 : "+price);
					System.out.println("방 : "+apart.getApart_room());
					System.out.println("화장실 : "+apart.getApart_toilet());
					System.out.println("집방향 : "+apart.getApart_direction());
					System.out.println("인테리어사진 : "+apart.getApart_interior());
					
					apartmentBeanList.add(apartBean);
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
	
	@RequestMapping(value = "/apart_contents.com")
	public ModelAndView detail_apart(@RequestParam("complex_id") int complex_id, 
			@RequestParam(value = "page", defaultValue = "1") int page) throws Exception {
		ModelAndView mav = new ModelAndView("apart/apart_contents");
		
		Map<String, Object> apartMap = apartmentService.detail_complex(complex_id);
		
		List<ApartmentBean> apartmentBeanList = (List<ApartmentBean>) apartMap.get("apartmentBeanList");
		System.out.println("사이즈 : "+apartmentBeanList.size());
		
		Set<Integer> apartSet = new TreeSet<Integer>();
		for (ApartmentBean apart : apartmentBeanList) {
			apartSet.add(apart.getApart_dong());
		}
		
		List<Integer> dongList = new ArrayList<Integer>();
		for (Integer dong : apartSet) {
			dongList.add(dong);
		}
		
		mav.addObject("apartMap", apartMap);
		mav.addObject("dongList", dongList);
		
		
		return mav;
	}
	
	@RequestMapping(value = "/apart_dongdetail.com")
	public ModelAndView detail_dong(@RequestParam("dong") int dong, 
			@RequestParam("complex_id") int complex_id, 
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("apart/dong_detail");
		
		ApartmentBean2 apartmentBean2 = apartmentService.detail_apart(complex_id, dong);
		
		mav.addObject("apart", apartmentBean2);
		
		
		return mav;
	}
	
	
}
