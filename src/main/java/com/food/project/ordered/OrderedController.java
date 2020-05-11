package com.food.project.ordered;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/ordered/**")
public class OrderedController {

	@Autowired
	private OrderedService orderedService;

	//주문 전체 조회 - SelectList (판매자ID) (GET)
	@GetMapping("orderedList")
	public ModelAndView orderedList(OrderedVO orderedVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<OrderedVO> list = orderedService.orderedList(orderedVO);
		//형꺼 옵션 값 줘~
		
		if(list != null) {
			mv.addObject("orderedList", list);
			//여기도 추가
			mv.setViewName("");
		}
		
		return mv;
	}
	
	//주문 조회 - SelectOne (유저ID or 판매자ID) (GET)
	@GetMapping("orderedSelect")
	public ModelAndView orderedSelect(OrderedVO orderedVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		orderedVO = orderedService.orderedSelect(orderedVO);
		//옵션 값 불러와야댐
		
		if(orderedVO != null) {
			mv.addObject("orderedVO", orderedVO);
			//여기도 추가
			mv.setViewName("");
		}
		
		return mv;
	}
	
	//주문 등록 - 유저ID (GET/POST)
	@GetMapping("orderedInsert")
	public void orderedInsert() throws Exception{
	}
	@PostMapping("orderedInsert")
	public ModelAndView orderedInsert(OrderedVO orderedVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = orderedService.orderedInsert(orderedVO);
		
		if(result > 0) {
			mv.addObject("reseult", result);
			mv.setViewName("");
		}
		
		return mv;
	}
	
	//주문 취소 - Update(cancleType : 0.개인변심/ 1.상품문제) (GET/POST)
	@GetMapping("orderedCancle")
	public void orderedCancle() throws Exception{
		
	}
	@PostMapping("orderedCancle")
	public ModelAndView orderedCancle(OrderedVO orderedVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = orderedService.orderedCancle(orderedVO);
		if(result > 0) {
			mv.addObject("result", result);
			mv.setViewName("");
		}
		
		return mv;
	}
	
	
}





















