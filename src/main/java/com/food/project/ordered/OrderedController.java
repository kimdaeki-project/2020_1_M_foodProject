package com.food.project.ordered;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/ordered/**")
public class OrderedController {
	
	@Autowired
	private OrderedService orderedService;
	
	
	
	//장바구니에 값 추가
	@PostMapping("cartAdd")
	@ResponseBody
	public int cartAdd(OrderedVO orderedVO,String menuPrice,@RequestParam(value = "optionNum[]")List<String> optionNum) throws Exception{
		System.out.println("memberNum : "+orderedVO.getMemberNum());
		System.out.println("marketNum : "+orderedVO.getMarketNum());
		System.out.println("menuNum : "+orderedVO.getMenuNum());
		System.out.println("menuPrice : "+menuPrice);
		
		String cateMenuOptions = "";
		if(optionNum == null) {
			cateMenuOptions = null;
		}
		
		int amount = Integer.parseInt(menuPrice);
		
		for (String str : optionNum) {
			if(str.equals("null"))
				break;
			
			cateMenuOptions = cateMenuOptions + str +"/";
			
			String[] price = str.split(" ");
			amount += Integer.parseInt(price[1]);
		}
		
		orderedVO.setCateMenuOptions(cateMenuOptions);
		orderedVO.setAmount(amount);
		
		System.out.println("catemenuOptions : "+ cateMenuOptions);
		System.out.println("amount : "+amount);
		
		int result = orderedService.orderedInsert(orderedVO);
		if(result>0) {
			System.out.println("장바구니 등록성공");
		}else {
			System.out.println("장바구니 등록실패");
		}
		
		return result;
	}
	
	
	
	

	//주문 전체 조회 - SelectList (판매자ID) (GET)
	@GetMapping("orderedList")
	public ModelAndView orderedList(OrderedVO orderedVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		System.out.println("orderList");
		System.out.println("memberNum : "+orderedVO.getMemberNum());
		
		List<OrderedVO> orderedList = orderedService.orderedList(orderedVO);
		
		int totalAmount = 0;
		for (OrderedVO vo : orderedList) {
			totalAmount += vo.getAmount();
		}
		
		int cartSize = orderedList.size();
		
		mv.addObject("orderedList", orderedList);
		mv.addObject("totalAmount", totalAmount);
		mv.addObject("cartSize", cartSize);
		
		mv.setViewName("templates/cartAjax");
		
		return mv;
	}
	
	//주문 조회 - SelectOne (유저ID or 판매자ID) (GET)
	@GetMapping("orderedSelect")
	public ModelAndView orderedSelect(OrderedVO orderedVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		
		return mv;
	}
	
	//주문 등록 - 유저ID (GET/POST)
	@GetMapping("orderedInsert")
	public void orderedInsert() throws Exception{
	}
	@PostMapping("orderedInsert")
	public ModelAndView orderedInsert(OrderedVO orderedVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		
		return mv;
	}
	
	//주문 취소 - Update(cancleType : 0.개인변심/ 1.상품문제) (GET/POST)
	@GetMapping("orderedCancle")
	public void orderedCancle() throws Exception{
		
	}
	@PostMapping("orderedCancle")
	public ModelAndView orderedCancle(OrderedVO orderedVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		
		
		return mv;
	}
	
	
}





















