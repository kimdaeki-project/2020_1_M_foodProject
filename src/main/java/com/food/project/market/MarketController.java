package com.food.project.market;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.food.project.board.BoardVO;
import com.food.project.member.MemberService;
import com.food.project.member.MemberVO;
import com.food.project.menu.MenuService;
import com.food.project.menu.MenuVO;
import com.food.project.review.ReviewService;
import com.food.project.util.Pager;

@Controller
@RequestMapping("/market/**")
public class MarketController {

	
	@Autowired
	private MarketService marketService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ReviewService reviewService;

	
	//마켓종료
	@GetMapping("marketIsOpen")
	@ResponseBody
	public int marketIsOpen(MarketVO marketVO,MemberVO memberVO,HttpSession session) throws Exception{
		//member의 num으로 해당 marketSelect
		marketVO.setUserNum(memberVO.getNum());
		
		int result = marketService.isOpen2(marketVO);
		marketVO = marketService.marketSelect(marketVO);
		
		if(result > 0) {
			session.setAttribute("marketVO",marketVO);
			System.out.println("영업종료");
		}else {
		}
		
		return result;
	}
	
	//마켓 오픈 
	@PostMapping("marketIsOpen")
	@ResponseBody
	public int marketIsOpen2(MarketVO marketVO,MemberVO memberVO,HttpSession session) throws Exception{
//		System.out.println("la"+memberVO.getLatitude());
//		System.out.println("lo"+memberVO.getLongitude());
		//member의 num으로 해당 marketSelect
		marketVO.setUserNum(memberVO.getNum());
		
		int result = marketService.isOpen(marketVO,memberVO);
		marketVO = marketService.marketSelect(marketVO);
		
		if(result > 0) {
			session.setAttribute("marketVO",marketVO);
			System.out.println("영업시작");
		}else {
		}
		
		
		return result;
	}
	
	
	//조회 - select List(GET)
	@GetMapping("marketList")
	public ModelAndView marketList() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		List<MarketVO> list = marketService.marketList();
		
		mv.addObject("marketList", list);
		mv.setViewName("market/marketList");
		
		return mv;
	}

	//조회 - select One(GET)
	@GetMapping("marketSelect")
	public ModelAndView marketSelect(MarketVO marketVO,Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		marketVO = marketService.marketSelect(marketVO);
		
		System.out.println("marketController");
		System.out.println("userNum : "+marketVO.getUserNum());
		System.out.println("curPage : "+pager.getCurPage());
		System.out.println();
		
		//Market의  usernum으로 해당 트럭의 주소값 조회
		MemberVO memberVO = new MemberVO();
		memberVO.setNum(marketVO.getUserNum());
		memberVO = memberService.memberSelect(memberVO);
		
		//메뉴
		MenuVO menuVO = new MenuVO();
		menuVO.setMarketNum(marketVO.getNum());
		List<MenuVO> MemuList = menuService.menuList(menuVO);

		//리뷰																										/////////////
		List<BoardVO> reviewList = reviewService.boardList(pager);
		
		//마켓의 전체 평균 값 조회
		double marketRate = reviewService.marketAvg(marketVO.getNum()); 
		System.out.println(marketRate);
		
		//전체 리뷰개수
		int totalReview = reviewService.marketReviewCount(marketVO.getNum());
		
		//파일(이미지)
		mv.addObject("menuList", MemuList);
		mv.addObject("marketVO", marketVO);
		mv.addObject("memberVO", memberVO);
		mv.addObject("reviewList", reviewList);
		mv.addObject("pager", pager);
		
		mv.addObject("marketRate", marketRate);
		mv.addObject("totalReview", totalReview);
		
		mv.setViewName("market/marketSelect");
		return mv;
	}

	//등록(GET/POST)
	@GetMapping("marketJoin")
	public void marketInsert() throws Exception{
		
	}
	@PostMapping("marketJoin")
	public ModelAndView marketInsert(MarketVO marketVO,MultipartFile[] files,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		marketVO.setUserNum(memberVO.getNum());
		
		int result = marketService.marketInsert(marketVO,files,session);
		
		memberVO = memberService.memberSelect(memberVO);
		
		if(result > 0) {
			session.setAttribute("memberVO", memberVO);
			mv.addObject("msg", "판매자 등록에 성공하였습니다.");
		}else {
			mv.addObject("msg", "판매자 등록에 실패하였습니다.");
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
	
	@PostMapping("marketGeoUpdate")
	@ResponseBody
	public int marketGeoUpdate(MarketVO marketVO) throws Exception {
		
		System.out.println(marketVO.getUserNum());
		System.out.println(marketVO.getAddress());
		
		int result = marketService.marketGeoUpdate(marketVO);
		
		return result;
	}
	
	//수정(GET/POST)
	@GetMapping("marketPage")
	public ModelAndView marketUpdate(MemberVO memberVO,MarketVO marketVO,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		System.out.println("marketPage num: "+marketVO.getNum());
		
		marketVO.setUserNum(memberVO.getNum());
		
		marketVO = marketService.marketSelect(marketVO);
		
		if(marketVO != null) {
			System.out.println("마켓 셀렉트");
			mv.addObject("marketVO", marketVO);
			mv.setViewName("market/marketPage");
		}else {
			System.out.println("조회 실패");
			mv.setViewName("member/memberPage");
		}
		
		return mv;
	}
	
	@PostMapping("marketPage")
	public ModelAndView marketUpdate(MarketVO marketVO,MultipartFile files,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("마켓 수정");
		
		int result = marketService.marketUpdate(marketVO,files,session);
		
		mv.addObject("result", result);
		mv.setViewName("member/memberPage");
		
		return mv;
	}

}

















