package com.food.project.market;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/market/**")
public class MarketController {

	@Autowired
	private MarketService marketService;
	
	//조회 - select One(GET)
	
	//등록(GET/POST)
	
	//삭제(GET)
	
	//수정(GET/POST)
	
	@GetMapping("marketList") public void marketList() throws Exception{
	     
	   }
	
	@GetMapping("marketSelect") public void marketSelect() throws Exception{
	     
	   }
}
