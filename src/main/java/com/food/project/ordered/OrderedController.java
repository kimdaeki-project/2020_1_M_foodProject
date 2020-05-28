package com.food.project.ordered;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
	@Transactional
	public int cartAdd(OrderedVO orderedVO, String menuPrice, @RequestParam(value = "optionNum[]")List<String> optionNum) throws Exception{
		
		// 주문하기로 들어온 요청일 경우, 이미 주문이 있다면,주문 DB를 삭제하고 insert
		if(orderedVO.getIsCart() == 0) {
			System.out.println("in here");
			int result = orderedService.cartDeleteAll(orderedVO);
			if(result > 0) {
				System.out.println("deleteDone");
			}
		}
		
		// cateMenuOptions 만들기
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
		
		// cateMenuOptions에 값이 있을때만 적용
		if(!cateMenuOptions.equals("")) {
			cateMenuOptions = cateMenuOptions.substring(0, cateMenuOptions.length()-1);
		}
		
		// amount 만들기
		amount *= orderedVO.getPcs(); 
		
		orderedVO.setCateMenuOptions(cateMenuOptions);
		orderedVO.setAmount(amount);
		
		int result = orderedService.orderedInsert(orderedVO);
		if(result>0) {
			System.out.println("장바구니 등록성공");
		}else {
			System.out.println("장바구니 등록실패");
			throw new Exception();
		}
		
		return result;
	}
	
	// 마켓 주문 확인 요청
	@PostMapping("orderConfirm")
	@ResponseBody
	public int orderedConfirm(OrderedVO orderedVO) throws Exception {
		
		return orderedService.orderedConfirm(orderedVO);
	}
	
	// 결제 완료 창
	@GetMapping("orderDone")
	public ModelAndView orderedDone() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("ordered/orderDone");
		return mv;
	}
	
	// 결제 완료 요청
	@PostMapping("orderDone")
	@ResponseBody
	@Transactional
	public int orderedDone(OrderedVO orderedVO, @RequestParam(value = "orderedNum[]")List<String> orderedNum) throws Exception {
		
		int result = 0;
		for (String num : orderedNum) {
			if(num.equals("null"))
				break;
			
			orderedVO.setNum(Integer.parseInt(num));
			result = orderedService.orderedDone(orderedVO);
		}
		
		return result;
	}
	
	//장바구니/주문창
	//주문 전체 조회 - SelectList (판매자ID) (GET)
	@GetMapping("orderedList")
	public ModelAndView orderedList(OrderedVO orderedVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		orderedVO.setIsOrderChecked(0);		// 0: 결제 전, 1: 결제 후(주문 요청), 2: 결제 후(주문 확인)
		
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
	
	//장바구니 전체목록 삭제(memberNum)
	@GetMapping("cartDeleteAll")
	public ModelAndView cartDeleteAll(OrderedVO orderedVO) throws Exception{
		
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
		
		int result = orderedService.orderDelete(orderedVO);
		
		if(result > 0) {
			MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
			orderedVO.setMemberNum(memberVO.getNum());
			
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
	
	// 결제 페이지로 이동(isCart : false(주문하기 요청), true(장바구니에서 요청))
	@GetMapping("orderPage")
	public ModelAndView orderPage(OrderedVO orderedVO) throws Exception{
		ModelAndView mv = new ModelAndView();

		System.out.println("orderPage");
		
		List<OrderedVO> orderedList = orderedService.orderedList(orderedVO);
		System.out.println("size : "+orderedList.size());
		int totalAmount = 0;
		for (OrderedVO vo : orderedList) {
			totalAmount += vo.getAmount();
		}
		
		int cartSize = orderedList.size();
		
		mv.addObject("orderedList", orderedList);
		mv.addObject("totalAmount", totalAmount);
		mv.addObject("cartSize", cartSize);
		mv.addObject("iamport_id", iamport_id);
		
		mv.setViewName("ordered/orderPage");
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
	
	// 주문 취소 - Update(cancleType : 0.개인변심/ 1.상품문제) (GET/POST)
	@PostMapping("orderCancle")
	@ResponseBody
	public int orderCancle(OrderedVO orderedVO) throws Exception{
		
		return orderedService.orderedCancle(orderedVO);
	}
	
	// 주문/결제 내역
	@GetMapping("orderAndPay") 
	public ModelAndView orderAndPay(MemberVO memberVO) throws Exception{
	
		ModelAndView mv = new ModelAndView();
		
		OrderedVO orderedVO = new OrderedVO();
		orderedVO.setMemberNum(memberVO.getNum());
		orderedVO.setIsOrderChecked(0);
		
		List<OrderedVO> list = orderedService.orderedListNot(orderedVO);
		for (OrderedVO vo : list) {
			System.out.println(vo);
		}
		mv.addObject("orderedList", list);
		mv.setViewName("ordered/orderAndPay");
		
		return mv;
	}
	
	// 주문 종료
	@PostMapping("orderFinish")
	@ResponseBody
	public int orderedFinish(OrderedVO orderedVO) throws Exception {
		
		return orderedService.orderedFinish(orderedVO);
	}
	
	@PostMapping("orderPolling")
	@ResponseBody
	public ModelAndView orderedPolling(OrderedVO orderedVO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		// 데이터를 받아오기 위한 사전 작업(마켓 넘버만 인자로 받으면 됨)
		System.out.println("marketOrder : "+orderedVO.getMarketNum());
		
		// 데이터 가져옴
		List<OrderedVO> list = orderedService.marketOrder(orderedVO);
		
		mv.addObject("orderedList", list);
		mv.setViewName("market/marketAjax/marketOrder");
		return mv;
	}
}





















