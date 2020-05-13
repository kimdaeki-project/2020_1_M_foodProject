package com.food.project.member;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member/**")
public class MemberController {

	@Autowired
	private MemberService memberService;
	

	// 로그인(GET/POST)
	@GetMapping("memberLogin")
	public void memberLogin(@CookieValue(value = "cId", required = false) String cId) throws Exception {

	}

	@PostMapping("memberLogin")
	public ModelAndView memberLogin(MemberVO memberVO, HttpSession session, String remember,
			HttpServletResponse response) throws Exception {

		ModelAndView mv = new ModelAndView();

		Cookie cookie = new Cookie("cId", "");
		if (remember != null) {
			cookie.setValue(memberVO.getId());
		}
		response.addCookie(cookie);

//		System.out.println("latitude: "+memberVO.getLatitude());
//		System.out.println("longittude: "+memberVO.getLongitude());
		
		memberVO = memberService.memberLogin(memberVO);
		
		if (memberVO != null) {
			session.setAttribute("memberVO", memberVO);
			
			mv.setViewName("redirect:../");
			System.out.println("로그인 성공");
		}else if(memberVO == null){
			mv.setViewName("member/memberLogin");
			System.out.println("로그인 실패");
		}
		return mv;
	}

	// 로그아웃(GET)
	@GetMapping("memberLogout")
	public String memberLogout(HttpSession session) throws Exception {
		session.invalidate();
		System.out.println("로그아웃");

		return "redirect:/";
	}

	// 회원가입(GET/POST)
	@GetMapping("memberJoin")
	public void memberJoin() throws Exception {
		
	}

	@PostMapping("memberJoin")
	public ModelAndView memberJoin(MemberVO memberVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("memberJoin post");

		int result = memberService.memberJoin(memberVO);

		if (result > 0) {
			System.out.println("회원가입 성공");
			mv.setViewName("redirect:../");
		}

		return mv;
	}

	// 아이디 중복검사(GET)
	@GetMapping("memberIdCheck")
	public ModelAndView memberIdCheck(MemberVO memberVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		System.out.println(memberVO.getId());
		
		memberVO = memberService.memberIdCheck(memberVO);
		
		if (memberVO != null) {
			System.out.println("이미 있는 아이디");
			mv.addObject("result", 0);
		} else {
			System.out.println("사용 가능 아이디");
			mv.addObject("result", 1);
		}
		
		mv.setViewName("member/memberLogin");

		return mv;
	}

	// 회원탈퇴(GET)
	@GetMapping("memberDelete")
	public ModelAndView memberDelete(MemberVO memberVO,HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();

		int result = memberService.memberDelete(memberVO);
		if (result > 0) {
			session.invalidate();
			System.out.println("회원탈퇴성공");
			mv.setViewName("redirect:/");
		}

		return mv;
	}

	// 회원정보수정(GET/POST)
	@GetMapping("memberUpdate")
	public void memberUpdate() {
	}

	@PostMapping("memberUpdate")
	public ModelAndView memberUpdate(MemberVO memberVO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("emberid: "+memberVO.getId());
		
		int result = memberService.memberUpdate(memberVO);
		
		if (result > 0) {
			session.setAttribute("memberVO", memberVO);
			mv.setViewName("redirect:./memberPage");
		} else {
			mv.addObject("result", "업데이트 실패");
			mv.addObject("path", "./memberPage");
			mv.setViewName("common/result");
		}

		return mv;
	}

	//마이페이지
	@GetMapping("memberPage") public void memberPage() throws Exception{
	  
	}
	
	
	//회원 리뷰관리 페이지
	@GetMapping("myReview") public void myReview() throws Exception{
	}
	//회원 주문내역 페이지
	@GetMapping("orderAndPay") public void orderAndPay() throws Exception{
	}	
	//판매자 신청 페이지
	@GetMapping("sellerApply") public void sellerApply() throws Exception{
	}
	 
}
