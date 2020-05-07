package com.food.project.auth;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/auth/**")
public class AuthController {

	@Autowired
	private AuthService authService;
	
	@GetMapping("kakao")
	public ModelAndView kakaoAuth(@RequestParam("code") String code) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		System.out.println("kakaoAuth");
		
		System.out.println("============ code =============");
		System.out.println(code);
		
		String accessToken = authService.getKakaoAccessToken(code);
		System.out.println("controller access_token : " + accessToken);
		
		HashMap<String, Object> userInfo = authService.getKakaoUserInfo(accessToken);
		System.out.println("login Controller : " + userInfo);
		
		String nickname = (String)userInfo.get("nickname");
		String email = (String)userInfo.get("email");
		String gender = (String)userInfo.get("gender");
		
		mv.addObject("nickname", nickname);
		if(userInfo.get("email") != null) {
			mv.addObject("email", email);
		}
		if(userInfo.get("gender") != null) {
			mv.addObject("gender", gender);
		}
		
		mv.setViewName("/member/memberKakaoJoin");
		
		return mv;
	}
}
