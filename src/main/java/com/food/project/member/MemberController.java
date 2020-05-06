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
	
	//로그인(GET/POST)
	@GetMapping("memberLogin")
	public void memberLogin(@CookieValue(value = "cId",required = false)String cId) throws Exception{
		
	}
	@PostMapping("memberLogin")
	public ModelAndView memberLogin(MemberVO memberVO,HttpSession session,String remember,HttpServletResponse response) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		Cookie cookie = new Cookie("cId", "");
		if(remember != null) {
			cookie.setValue(memberVO.getId());
		}
		response.addCookie(cookie);
		
		memberVO = memberService.memberLogin(memberVO);
		if(memberVO != null) {
			session.setAttribute("memberVO", memberVO);
			System.out.println("로그인 성공");
		}else {
			mv.setViewName("./memberLogin");
		}
		return mv;
	}
	
	//로그아웃(GET)
	
	//회원가입(GET/POST)
	
	//아이디 중복검사(GET)
	
	//회원탈퇴(GET)
	
	//회원정보수정(GET/POST)
}
