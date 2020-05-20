package com.food.project.payment;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/payment/**")
public class PaymentController {
	
	@Value("${iamport_id}")
	private String iamport_id;
	
	@GetMapping("test")
	public ModelAndView test() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("iamport_id", iamport_id);
		mv.addObject("name", "공짜");
		mv.addObject("email", "test@naver.com");
		mv.addObject("phone", "01020052005");
		mv.addObject("address", "서울 구로구 상수동 와우산로 94");
		mv.addObject("totalPrice", 0); 
	    
		return mv;
	}
}
