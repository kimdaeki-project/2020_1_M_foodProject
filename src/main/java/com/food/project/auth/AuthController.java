package com.food.project.auth;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/auth/**")
public class AuthController {

	@GetMapping("kakao")
	public ModelAndView kakaoAuth(@RequestParam("code") String code) throws Exception {
		
		System.out.println("kakaoAuth");
		
		System.out.println("============ code =============");
		System.out.println(code);
		
		ModelAndView mv = new ModelAndView();
		return mv;
	}
}
