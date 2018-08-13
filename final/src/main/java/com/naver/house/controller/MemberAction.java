package com.naver.house.controller;

import java.io.PrintWriter;
import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.house.bean.AdminBean;
import com.naver.house.bean.Article;
import com.naver.house.bean.MemberBean;
import com.naver.house.service.MemberService;


@Controller
public class MemberAction {

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/member_join.nhn")
	public String member_join() throws Exception {
		return "member/member_join";

	}

	@RequestMapping(value = "/member_join_ok.nhn", method = RequestMethod.POST)
	public ModelAndView member_join_ok(MemberBean m, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String tel = m.getTel1() + "-" + m.getTel2() + "-" + m.getTel3();

		m.setTel(tel);
		m.setScore(m.getFamilySize() + m.getHomelessTerm() + m.getAge());

		this.memberService.insertMember(m); // db에 들어감
		ModelAndView mv = new ModelAndView("member/join_totalscore");
		mv.addObject("member", m); // 다음 jsp에 값 넘겨줌

		return mv;
	}

	@RequestMapping(value = "/admin_join.nhn")
	public String admin_join() throws Exception {
		return "member/admin_join";
	}

	@RequestMapping(value = "/admin_join_ok.nhn", method = RequestMethod.POST)
	public void Admin_join_ok(AdminBean a, HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		this.memberService.insertAdmin(a);

		response.sendRedirect("member_login.nhn");
	}

	@RequestMapping(value = "/member_login.nhn")
	public ModelAndView member_login(ModelAndView mv, HttpServletRequest request, HttpServletResponse response,
			@CookieValue(value = "saveid", required = false) Cookie readCookie) throws Exception {
		if (readCookie != null) {
			mv.addObject("saveid", readCookie.getValue());
		}
		mv.setViewName("member/member_login");
		return mv;
	}

	@RequestMapping(value="/member_login_ok.nhn",
			   method= {RequestMethod.POST, RequestMethod.GET})
	   public ModelAndView member_login_ok( HttpServletRequest request, HttpServletResponse response) throws Exception{
		   
		   //HttpSession 클래스는 세션 객체를 생성해서 로그인 인증 처리를 하기 위해서입니다.
		   response.setContentType("text/html;charset=UTF-8");
		   PrintWriter out = response.getWriter();//출력스트림 객체 생성
		   HttpSession session = request.getSession();//세션 객체 생성
		   
		   String id = request.getParameter("id").trim();
		   String password = request.getParameter("password").trim();
		   
		   /*MemberBean m = this.memberService.userCheck(id);
		   AdminBean ad= this.memberService.adminCheck(id);*/
		   
		   MemberBean m = new MemberBean();
		   AdminBean ad = new AdminBean();
		   
		   System.out.println(this.memberService.admin_idcheck(id));
		   if(this.memberService.admin_idcheck(id)!=0) { // Admin 일 때
			   ad=this.memberService.adminCheck(id);
			   if(ad.getAdmin_pwd().equals(password)) {//비번이 같을 때
				   session.setAttribute("id", id);
				  
				   System.out.println(ad.getAdmin_no());
				   session.setAttribute("Admin_no",ad.getAdmin_no());
				   
		  
				   ModelAndView loginAd = new ModelAndView("main");
				   return loginAd;
			   }else {//비번이 다를 때
				   out.println("<script>");
				   out.println("alert('비번이 다릅니다!')");
				   out.println("history.go(-1)");
				   out.println("</script>");
			   }
		   }else if(this.memberService.user_idcheck(id)!=0) { // 일반유저 일 때
			   m =this.memberService.userCheck(id);
			   if(m.getPassword().equals(password)) {//비번이 같을 때
				   session.setAttribute("id", id);
				   
				   String join_name = m.getName();
				   session.setAttribute("join_name", join_name);
				   session.setAttribute("user_no",m.getUser_no());
				 
				   
				   //jsp 폴더의 view.jsp로 이동
				   ModelAndView loginM = new ModelAndView("main");
				   return loginM;
			   }else {//비번이 다를 때
				   out.println("<script>");
				   out.println("alert('비번이 다릅니다!')");
				   out.println("history.go(-1)");
				   out.println("</script>");
			   }
		   }
		   
		   if(this.memberService.userCheck(id)==null && this.memberService.adminCheck(id)==null) {//등록되지 않은 회원일 때( id로 member, admin table 조회 시 없음 )
			   out.println("<script>");
			   out.println("alert('등록되지 않은 회원입니다!')");
			   out.println("history.back()");
			   out.println("</script>");
			   
		   }
		   return null;  
		   
	  }

	@RequestMapping(value = "/join_check.nhn")
	public String join_check() throws Exception {
		return "member/join_check";
	}

	@RequestMapping(value = "/member_idcheck.nhn", method = RequestMethod.POST)
	public void member_idcheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		int re = memberService.checkMemberId(id);
		out.print(re);
	}

	@RequestMapping(value = "/member_edit.nhn")
	public ModelAndView member_edit(HttpServletRequest request)
			// ,HttpServletResponse response
			throws Exception {

		// HttpSession 클래스는 세션 객체를 생성해서 로그인 인증 처리를 하기 위해서입니다.
		HttpSession session = request.getSession();// 세션 객체 생성
		// 아이디 키값의 세션 아이디를 구함
		String id = (String) session.getAttribute("id");

		// interceptor로 처리
		MemberBean editm = this.memberService.userCheck(id);
		String tel = editm.getTel();
		System.out.println("tel "+tel);
		StringTokenizer st01 = new StringTokenizer(tel, "-");
		String tel1 = st01.nextToken();// 첫번째(국번 집전화번호 저장)
		String tel2 = st01.nextToken();// 두번째(가운데 자리)
		String tel3 = st01.nextToken();// 세번째(뒷자리)
		System.out.println(tel1+tel2+tel3);
		

		ModelAndView m = new ModelAndView("member/member_edit");
		m.addObject("editm", editm);
		m.addObject("tel1", tel1);
		m.addObject("tel2", tel2);
		m.addObject("tel3", tel3);

		return m;
	}

	
	@RequestMapping(value = "/member_edit_ok.nhn", method = { RequestMethod.POST, RequestMethod.GET })
	public void member_edit_ok(MemberBean m, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		m.setId(id);
		String mtel = m.getTel1() + "-" + m.getTel2() + "-" + m.getTel3();
		m.setTel(mtel);
		this.memberService.updateMember(m);

		MemberBean editm = this.memberService.userCheck(id);
		String tel = editm.getTel();
		
		StringTokenizer st01 = new StringTokenizer(tel, "-");
		String tel1 = st01.nextToken();
		String tel2 = st01.nextToken();
		String tel3 = st01.nextToken();

		m.setTel(tel);
		m.setId(id);
		
		response.sendRedirect("member_edit.nhn");
		
	}

	@RequestMapping(value = "/member_logout.nhn")
	public String member_logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "member/member_logout";
		
	}

	
	
	// (window->Preferences->workspace->Refresh using native hooks or pooling )
	/* 회원정보 삭제 폼 */
	@RequestMapping(value = "/member_del.nhn")
	public void member_del(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		// PrintWriter out = response.getWriter();//출력 스트림 생성
		HttpSession session = request.getSession();

		String id = (String) session.getAttribute("id");

		System.out.println("!!! 지울 아이디  : " + id);

		
		this.memberService.deleteMember(id);
		session.invalidate();
		
		PrintWriter out = response.getWriter();
		out.println(1);
		

	}

	@RequestMapping(value = "/member_del_ok.nhn")
	public void member_del_ok(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String id = (String) session.getAttribute("id");

		MemberBean member = this.memberService.userCheck(id);

		out.println("<script>");
		out.println("alert('정말로 탈퇴하시겠습니까?')");
		/* out.println("history.back()"); */
		out.println("</script>");

		MemberBean delm = new MemberBean();
		delm.setId(id);

		this.memberService.deleteMember(id);

		session.invalidate();
		response.sendRedirect("member_login.nhn");

	}
	
	@RequestMapping(value = "/admin_detail.nhn")
	public ModelAndView memberlist(ModelAndView mv) throws Exception{
		List<MemberBean> list = new ArrayList<MemberBean>(); 
		list = memberService.getList();
		 mv.setViewName("member/admin_detail");
		 mv.addObject("totallist", list);
        return mv;
	}
	
	
	
	@RequestMapping(value = "/member_info.nhn")
	public ModelAndView memberinfo(HttpServletRequest request, ModelAndView mv,@RequestParam(value="id")String id) throws Exception{
		// 아이디 키값의 세션 아이디를 구함
		
		// HttpSession 클래스는 세션 객체를 생성해서 로그인 인증 처리를 하기 위해서입니다.
				HttpSession session = request.getSession();// 세션 객체 생성
				// 아이디 키값의 세션 아이디를 구함
				String id11 = (String) session.getAttribute("id");

				// interceptor로 처리
				MemberBean memberinfo = this.memberService.userCheck(id);
				String tel = memberinfo.getTel();
				// java.util 패키지의 StringTokernizer 클래스는 첫번째 전달 인자를
				// 두번째-를 기준으로 문자열을 파싱해줍니다.
				// 집 전화번호 저장
				StringTokenizer st01 = new StringTokenizer(tel, "-");
				String tel1 = st01.nextToken();// 첫번째(국번 집전화번호 저장)
				String tel2 = st01.nextToken();// 두번째(가운데 자리)
				String tel3 = st01.nextToken();// 세번째(뒷자리)

				// java.util 패키지의 StringTokernizer 클래스는 첫번째 전달인자는
				// 두번째-를 기준으로 문자열을 파싱해줍니다.
				// 휴대폰 번호 저장

				// java.util 패키지의 StringTokenizer 클래스는 첫번째 전달인자를
				// 두번째 @를 기준으로 문자열을 파싱해줍니다.

				ModelAndView m = new ModelAndView("member/member_info");
				m.addObject("memberinfo", memberinfo);
				m.addObject("tel1", tel1);
				m.addObject("tel2", tel2);
				m.addObject("tel3", tel3);

				return m;
		 

	}
	
	@RequestMapping(value = "/mypage_main.nhn")
	public String mypage_main() throws Exception {
		return "member/mypage_main";
	}
	
	
	@RequestMapping(value="/password_find.nhn")
	   public String password_find() {
		   return "member/password_find";
	   }
	
	@RequestMapping(value="/password_find_ok.nhn", method=RequestMethod.POST)
	   public ModelAndView password_find_ok(HttpServletRequest request, HttpServletResponse response) throws Exception{
		   response.setContentType("text/html;charset=utf-8");
		   String id=request.getParameter("id").trim();
		   String name=request.getParameter("name").trim();
		   
		   Map pm = new HashMap();
		   pm.put("id", id);
		   pm.put("name", name);
		   
		   MemberBean member = this.memberService.findpassword(pm);
		   PrintWriter out = response.getWriter();
		   if(member==null) {
			   System.out.println("true!!!");
			   out.println("<script>");
			   out.println("alert('회원아이디와 이름이 맞지 않습니다.')");
			   out.println("history.go(-1)");
			   out.println("</script>");
		   }else {
			   System.out.println("false!!!");
			   /*ModelAndView passwordM = new ModelAndView("member/password_find");
			   passwordM.addObject("passwordok", member.getPassword());
			   return passwordM;*/
			   
			   out.println("<script>");
			   System.out.println(member.getPassword());
			   out.println("alert('비밀번호는 "+member.getPassword()+"');");
			   out.println("history.go(-1);");
			   out.println("</script>");
		   }
		   return null; 
	   }
	
	

	@RequestMapping(value = "/member_qnalist.nhn")
	public ModelAndView qnalist(ModelAndView mv,@RequestParam("id")String id) throws Exception{
		List<Article> list = new ArrayList<Article>(); 
		list = memberService.getqnaList(id);
		 mv.setViewName("member/member_qnalist");
		 mv.addObject("totallist", list);
        return mv;
	}
}
