package com.food.project.member;

import java.text.SimpleDateFormat;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.food.project.mail.MailService;
import com.food.project.mail.MailVO;
import com.food.project.market.MarketService;
import com.food.project.market.MarketVO;

@Controller
@RequestMapping("/member/**")
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private MarketService marketService;
	
	@Autowired
	private MailService mailService;
	
	
	@GetMapping("memberIdFind")
	public void memberIdFind() throws Exception{
		
	}
	
	@GetMapping("memberPwFind")
	public void memberPwFind() throws Exception{
		
	}
	
	public int emailRnd() {
		//6자리 랜덤 값 생성
		int rnd = (int)(Math.floor(Math.random() * 1000000)+100000);
		if(rnd>1000000){
			rnd = rnd - 100000;
		}
		return rnd;
	}
	
	@PostMapping("mailCertification")
	@ResponseBody
	public int idSearch(String email,String name,String id) throws Exception{
		MailVO mailVO = new MailVO();
		MemberVO memberVO = new MemberVO();
		int result = 0;
		memberVO.setEmail(email);
		
		
		mailVO.setSenderMail("foodProject200501@gmail.com");
		mailVO.setSenderName("Fusulian");
		mailVO.setReceiveMail(email);
		

		
		if(id == null) { //아이디 찾기
			memberVO.setName(name);
			memberVO.setType("id");
			memberVO = memberService.emailSearch(memberVO);
			if(memberVO != null) {
				result = 1;
				id = memberVO.getId();
				mailVO.setSubject("Fusulian 아이디 찾기 메일입니다!");
				mailVO.setMessage("사용자의 아이디는 '"+ id +"' 입니다.");
				
				mailService.sendMail(mailVO);
			}else {
				return 0;
			}
			
		}else { //비밀번호 찾기
			System.out.println("비번 찾기");
			memberVO.setId(id);
			memberVO.setType("pwd");
			memberVO = memberService.emailSearch(memberVO);
			if(memberVO != null) {
				int pwd = emailRnd();
				mailVO.setSubject("Fusulian 비밀번호 찾기 메일입니다!");
				mailVO.setMessage("사용자의 임시 비밀번호는 '"+ pwd +"' 입니다.");
				
				memberVO.setPassword(pwd+"");
				
				result = memberService.temporaryPW(memberVO);
				
				mailService.sendMail(mailVO);
			}else {
				return 0;
			}
		}
		return result;
	}
	
	
	
	// 로그인(GET/POST)
	@GetMapping("memberLogin")
	public void memberLogin(@CookieValue(value = "cId", required = false) String cId,String id) throws Exception {

	}

	@PostMapping("memberLogin")
	public ModelAndView memberLogin(MemberVO memberVO, HttpSession session, String remember,HttpServletResponse response) throws Exception {

		ModelAndView mv = new ModelAndView();

		Cookie cookie = new Cookie("cId", "");
		if (remember != null) {
			cookie.setValue(memberVO.getId());
		}
		response.addCookie(cookie);

		if(memberVO.getAddress() == null) {
			System.out.println("address null");
		}
		
		
		memberVO = memberService.memberLogin(memberVO);
		
		if (memberVO != null) {
			
			if(memberVO.getIsFoodTruck() == 1) {
				MarketVO marketVO = new MarketVO();
				marketVO.setUserNum(memberVO.getNum());
				marketVO= marketService.marketSelect(marketVO);
				
				session.setAttribute("marketVO", marketVO);
			}
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
	public String memberLogout(HttpSession session,long num) throws Exception {

		MarketVO marketVO = new MarketVO();
		marketVO.setUserNum(num);
		marketVO.setIsOpen(0);
		
		int reulst = marketService.isOpen2(marketVO);
		if(reulst>0) {
			System.out.println("상점종료");
		}else {
			System.out.println("실패");
		}
		
		session.invalidate();

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
		
		System.out.println(memberVO.getId());
		System.out.println(memberVO.getBirth());

		int result = memberService.memberJoin(memberVO);

		if (result > 0) {
			System.out.println("회원가입 성공");
			mv.setViewName("redirect:../");
		}

		return mv;
	}

	// 아이디 중복검사(GET)
	@GetMapping("memberIdCheck")
	@ResponseBody
	public int memberIdCheck(MemberVO memberVO) throws Exception {
		//System.out.println(memberVO.getId());
		int result = 1;
		memberVO = memberService.memberIdCheck(memberVO);
		
		if (memberVO != null) {
			System.out.println("이미 있는 아이디");
			result = 0;
		}

		return result;
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
	public ModelAndView memberUpdate(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		memberVO = memberService.memberSelect(memberVO);
		
		mv.addObject("memberVO", memberVO);
		mv.setViewName("member/memberUpdate");
		
		return mv;
	}

	@PostMapping("memberUpdate")
	public ModelAndView memberUpdate(MemberVO memberVO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		System.out.println("memberUpdate");
		int result = memberService.memberUpdate(memberVO);
		
		if (result > 0) {
//			session.setAttribute("memberVO", memberVO);
		}
		
		System.out.println("result: "+result);
		mv.addObject("msg",result);
		mv.addObject("path","./memberPage");
		
		mv.setViewName("common/result");

		return mv;
	}

	//마이페이지
	@GetMapping("memberPage") public void memberPage() throws Exception{
	}
	//회원 리뷰관리 페이지
	@GetMapping("myReview") public void myReview() throws Exception{
	}	
	//판매자 신청 페이지
	@GetMapping("sellerApply") public void sellerApply() throws Exception{
	}
}
