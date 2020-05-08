package com.food.project.market;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.food.project.member.MemberVO;

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
	@GetMapping("marketJoin")
	public void marketInsert() throws Exception{
		
	}
	@PostMapping("marketJoin")
	public ModelAndView marketInsert(MarketVO marketVO,MultipartFile[] files,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		System.out.println(memberVO.getNum());
		marketVO.setUserNum(memberVO.getNum());
		
		int result = marketService.marketInsert(marketVO,files,session);
		mv.addObject("msg", "판매자 등록에 실패하였습니다.");
		if(result > 0) {
			mv.addObject("msg", "판매자 등록에 성공하였습니다.");
		}
		mv.addObject("path", "../member/memberPage");
		mv.setViewName("common/result");

		return mv;
		
	}
	
	//삭제(GET)
	@GetMapping("marketDelete")
	public String marketDelete(MarketVO marketVO,HttpSession session) throws Exception{
		System.out.println("marketDelete");
		int result = marketService.marketDelete(marketVO,session);
		if(result > 0) {
			
		}
		
		return "redirect:../member/memberPage";
		
	}
	
	//수정(GET/POST)
	@GetMapping("marketUpdate")
	public void marketUpdate() throws Exception{
		
	}
	
	@PostMapping("marketUpdate")
	public void marketUpdate(MarketVO marketVO,MultipartFile[] files,HttpSession session) throws Exception{
		int result = marketService.marketUpdate(marketVO,files,session);
	}
	
}

















