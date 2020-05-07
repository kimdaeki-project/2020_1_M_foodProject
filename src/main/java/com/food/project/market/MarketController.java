package com.food.project.market;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/market/**")
public class MarketController {

	
	@Autowired
	private MarketService marketService;
	
	//조회 - select List(GET)
	@GetMapping("marketList")
	public void marketList(MarketVO marketVO) throws Exception{
		List<MarketVO> list = marketService.marketList(marketVO);
	}
	
	//조회 - select One(GET)
	@GetMapping("marketSelect")
	public void marketSelect(MarketVO marketVO) throws Exception{
		
		marketVO = marketService.marketSelect(marketVO);
	}
	
	//등록(GET/POST)
	@GetMapping("marketInsert")
	public void marketInsert() throws Exception{
		
	}
	@PostMapping("marketInsert")
	public void marketInsert(MarketVO marketVO,MultipartFile[] files,HttpSession session) throws Exception{
		int result = marketService.marketInsert(marketVO,files,session);
	}
	
	//삭제(GET)
	@GetMapping("marketDelete")
	public void marketDelete(MarketVO marketVO) throws Exception{
		int result = marketService.marketDelete(marketVO);
	}
	
	//수정(GET/POST)
	@GetMapping("marketUpdate")
	public void marketUpdate() throws Exception{
		
	}
	
	@PostMapping("marketUpdate")
	public void marketUpdate(MarketVO marketVO) throws Exception{
		int result = marketService.marketUpdate(marketVO);
	}
	
}

















