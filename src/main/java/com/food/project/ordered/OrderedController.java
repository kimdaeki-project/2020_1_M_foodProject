package com.food.project.ordered;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.food.project.member.MemberVO;

@Controller
@RequestMapping("/ordered/**")
public class OrderedController {
	
	@Autowired
	private OrderedService orderedService;
	
	@Value("${iamport_id}")
	private String iamport_id;
	
	//장바구니에 값 추가
	@PostMapping("cartAdd")
	@ResponseBody
	public int cartAdd(OrderedVO orderedVO,String menuPrice,@RequestParam(value = "optionNum[]")List<String> optionNum) throws Exception{
		System.out.println("memberNum : "+orderedVO.getMemberNum());
		System.out.println("marketNum : "+orderedVO.getMarketNum());
		System.out.println("menuNum : "+orderedVO.getMenuNum());
		System.out.println("orderedPcs : "+orderedVO.getPcs());
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
		amount *= orderedVO.getPcs(); 
		
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
	
	//장바구니/주문창
	//주문 전체 조회 - SelectList (판매자ID) (GET)
	@GetMapping("orderedList")
	public ModelAndView orderedList(OrderedVO orderedVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("orderedList");
		System.out.println("memberNum : "+orderedVO.getMemberNum());
		
		List<OrderedVO> orderedList = orderedService.orderedList(orderedVO);
		
		int totalAmount = 0;
		for (OrderedVO vo : orderedList) {
			totalAmount += vo.getAmount();
			System.out.println(vo.getPcs());
		}
		
		int cartSize = orderedList.size();
		
		mv.addObject("orderedList", orderedList);
		mv.addObject("totalAmount", totalAmount);
		mv.addObject("cartSize", cartSize);
		
		mv.setViewName("templates/cartAjax");
		
		return mv;
	}
	
	//장바구니 전체목록 삭제(memberNum)
	@GetMapping("cartDeleteAll")
	public ModelAndView cartDeleteAll(OrderedVO orderedVO) throws Exception{
		System.out.println("cartDeleteAll");
		
		ModelAndView mv = new ModelAndView();
		
		int result = orderedService.cartDeleteAll(orderedVO);
		if(result>0) {
			mv.addObject("orderedList", null);
			mv.addObject("totalAmount", 0);
			mv.addObject("cartSize", 0);
			
			mv.setViewName("templates/cartAjax");
		}
		
		return mv;
	}
	
	//장바구니 낱개 삭제(ordered Num)
	@GetMapping("cartDeleteSelect")
	public ModelAndView cartDeleteSelect(OrderedVO orderedVO,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("orderedNum : "+orderedVO.getNum());
		
		int result = orderedService.orderDelete(orderedVO);
		System.out.println("result: "+result);
		
		if(result > 0) {
			MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
			orderedVO.setMemberNum(memberVO.getNum());
			System.out.println("memberVO.num : "+orderedVO.getMemberNum());
			
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
		}else {
			
		}
		
		return mv;
	}
	
	
	//결제 페이지로 이동
	@GetMapping("orderPage")
	public ModelAndView orderPage(OrderedVO orderedVO) throws Exception{
		ModelAndView mv = new ModelAndView();

		List<OrderedVO> orderedList = orderedService.orderedList(orderedVO);
	
		int totalAmount = 0;
		for (OrderedVO vo : orderedList) {
			totalAmount += vo.getAmount();
		}
		
		int cartSize = orderedList.size();
		
		mv.addObject("orderedList", orderedList);
		mv.addObject("totalAmount", totalAmount);
		mv.addObject("cartSize", cartSize);
		mv.addObject("iamport_id", iamport_id);
		
		mv.setViewName("order/orderPage");
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





















