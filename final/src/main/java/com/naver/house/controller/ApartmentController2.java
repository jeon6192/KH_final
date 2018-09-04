package com.naver.house.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.house.bean.ApartListBean;
import com.naver.house.bean.ApartmentBean;
import com.naver.house.bean.ApartmentBean2;
import com.naver.house.bean.AptComplexBean;
import com.naver.house.bean.AptComplexBean2;
import com.naver.house.service.ApartmentService2;
import com.naver.house.service.EventService;

@Controller
public class ApartmentController2 {

	@Autowired
	private ApartmentService2 apartmentService;

	@Autowired
	private EventService eventservice;

	@RequestMapping("/apart_test.com")
	public String testPage() {
		return "apart/test";
	}

	@RequestMapping("/main.com")
	public ModelAndView mainPage() {
		return new ModelAndView("main");
	}

	@GetMapping(value = "/complex/new")
	public ModelAndView insertform_apart() {

		return new ModelAndView("apart/insert_aptcomplex");
	}

	@PostMapping(value = "/complex")
	public ModelAndView insert_apart(AptComplexBean aptComplexBean, ApartListBean apartListBean,
			@RequestParam(value = "chk_subway", defaultValue = "false") boolean chk_subway) throws Exception {

		// 분양상태를 0 으로 setting
		aptComplexBean.setComplex_state(0);

		// 역세권이 체크 되어 있다면 complex_subway column에 1을 넣어준다
		if (chk_subway) {
			aptComplexBean.setComplex_subway(1);
		} else {
			aptComplexBean.setComplex_subway(0);
		}

		List<ApartmentBean> apartmentBeanList = new ArrayList<ApartmentBean>();

		for (ApartmentBean apart : apartListBean.getApartBeanList()) {
			int floor = apart.getApart_floor();
			int price = apart.getApart_price();
			for (int i = 1; i <= floor; i++) {
				int floor2 = (int) (((float) i / (float) floor) * 10.0);
				switch (floor2) {
				case 2:
					price = (int) (apart.getApart_price() * 1.1);
					break;
				case 4:
					price = (int) (apart.getApart_price() * 1.2);
					break;
				case 5:
					price = (int) (apart.getApart_price() * 1.3);
					break;
				case 6:
					price = (int) (apart.getApart_price() * 1.4);
					break;
				case 7:
					price = (int) (apart.getApart_price() * 1.2);
					break;
				case 8:
					price = (int) (apart.getApart_price() * 1.1);
					break;
				}

				for (int j = 1; j < 5; j++) {

					ApartmentBean apartBean = new ApartmentBean();

					apartBean.setApart_ho(Integer.parseInt(Integer.toString(i) + "0" + j));
					apartBean.setApart_dong(apart.getApart_dong());
					apartBean.setApart_floor(apart.getApart_floor());
					apartBean.setApart_area(apart.getApart_area());
					apartBean.setApart_price(price);
					apartBean.setApart_room(apart.getApart_room());
					apartBean.setApart_toilet(apart.getApart_toilet());
					apartBean.setApart_direction(apart.getApart_direction());
					apartBean.setApart_interior(apart.getApart_interior());

					apartmentBeanList.add(apartBean);
				}
			}

		}

		Map<String, Object> apartMap = new HashMap<String, Object>();

		apartMap.put("aptComplexBean", aptComplexBean);
		apartMap.put("apartmentListBean", apartmentBeanList);

		apartmentService.insert_apart(apartMap);

		return new ModelAndView("redirect:/aptSearch.com");
	}

	@ResponseBody
	@GetMapping(value = "/complex/{complex_id}")
	public ModelAndView detail_apart(@PathVariable("complex_id") int complex_id,
			@RequestParam(value = "page", defaultValue = "1") int page, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("apart/apart_contents");

		Map<String, Object> apartMap = apartmentService.detail_complex(complex_id);

		List<ApartmentBean> apartmentBeanList = (List<ApartmentBean>) apartMap.get("apartmentBeanList");

		Set<Integer> apartSet = new TreeSet<Integer>();
		for (ApartmentBean apart : apartmentBeanList) {
			apartSet.add(apart.getApart_dong());
		}

		List<Integer> dongList = new ArrayList<Integer>();
		for (Integer dong : apartSet) {
			dongList.add(dong);
		}
		HttpSession session = request.getSession();

		HashMap<String, Object> m = new HashMap<String, Object>();
		m.put("complex_id", complex_id);
		m.put("user_no", session.getAttribute("user_no"));
		int state = eventservice.event_list_state(m);

		System.out.println("complex_id= " + complex_id + "state =" + state);
		mav.addObject("apartMap", apartMap);
		mav.addObject("dongList", dongList);
		mav.addObject("state", state);
		mav.addObject("complex_id", complex_id);
		mav.addObject("user_no", session.getAttribute("user_no"));

		return mav;
	}

	@GetMapping(value = "/apart/{complex_id}/{dong}")
	public ModelAndView detail_dong(@PathVariable("dong") int dong, 
			@PathVariable("complex_id") int complex_id) throws Exception {
		ModelAndView mav = new ModelAndView("apart/dong_detail");

		ApartmentBean2 apartmentBean2 = apartmentService.detail_apart(complex_id, dong);

		mav.addObject("apart", apartmentBean2);

		return mav;
	}

	@GetMapping(value = "/complexes", headers = "Accept=*/*", produces = "application/json")
	@ResponseBody
	public List<AptComplexBean2> search_cpx(@RequestParam Map<String, Object> searchLocation) throws Exception {
		Map<String, Object> searchCpxMap = new HashMap<String, Object>();
		searchCpxMap.put("swLat", Double.parseDouble(searchLocation.get("swLat").toString()));
		searchCpxMap.put("swLng", Double.parseDouble(searchLocation.get("swLng").toString()));
		searchCpxMap.put("neLat", Double.parseDouble(searchLocation.get("neLat").toString()));
		searchCpxMap.put("neLng", Double.parseDouble(searchLocation.get("neLng").toString()));
		searchCpxMap.put("complex_id", searchLocation.get("complex_id"));

		List<AptComplexBean2> searchCpxList = apartmentService.searchCpx(searchCpxMap);
		return searchCpxList;

	}

}
