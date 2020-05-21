package com.food.project.cart;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.food.project.market.MarketVO;

@Controller
@RequestMapping("/cart/**")
public class CartController {

	
	@GetMapping("cartAdd")
	public void cartAdd(MarketVO marketVO,@RequestParam("optionNum[]")List<String> optionNum) throws Exception{
		System.out.println("cartAdd");
		
		System.out.println("menuNum : "+marketVO.getNum());
		
		for (String str : optionNum) {
			System.out.println(str);
		}
		
		
		
	}
}
