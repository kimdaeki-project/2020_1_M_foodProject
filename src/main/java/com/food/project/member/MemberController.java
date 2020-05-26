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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.food.project.mail.MailService;
import com.food.project.mail.MailVO;
import com.food.project.market.MarketService;
import com.food.project.market.MarketVO;

import oracle.jdbc.proxy.annotation.Post;

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
		System.out.println(rnd);
		
		return rnd;
	}
	
	@PostMapping("mailCertification")
	@ResponseBody
	public int idSearch(String email,String name,String id,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MailVO mailVO = new MailVO();
		MemberVO memberVO = new MemberVO();
		int result = 0;
		int rnd = 0;
		
		memberVO.setName(name);
		memberVO.setEmail(email);
		
		
		//아이디 비번 찾기 결정
		if(id == null) { //아이디 찾기
			System.out.println("아이디 찾기");
			
			
			memberVO = memberService.emailSearch(memberVO);
			if(memberVO != null) {
				System.out.println("아이디가 존재하는 이메일");
				rnd = emailRnd();
				result = 1; //아이디가 존재
				session.setAttribute("mailCertification", rnd);
				
			}else {
				System.out.println("등록되지 않은 이메일입니다.");
				return 0;
			}
			
			
		}else {
			System.out.println("비번 찾기");
			memberVO.setId(id);
		}
		
		
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>> result1 : "+result);
		
		mailVO.setSubject("Fusulian 아이디/비밀번호 찾기 메일입니다!");
		mailVO.setSenderMail("foodProject200501@gmail.com");
		mailVO.setSenderName("Fusulian");
		mailVO.setReceiveMail(email);
		mailVO.setMessage("인증 번호는 '"+ rnd +"' 입니다.");
		
		mailService.sendMail(mailVO);
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>> result2 : "+result);
		
		
		return result;
	}
	
	
	
	// 로그인(GET/POST)
	@GetMapping("memberLogin")
	public void memberLogin(@CookieValue(value = "cId", required = false) String cId) throws Exception {

	}

	@PostMapping("memberLogin")
	public ModelAndView memberLogin(MemberVO memberVO, HttpSession session, String remember,HttpServletResponse response) throws Exception {

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
