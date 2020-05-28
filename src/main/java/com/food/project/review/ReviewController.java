package com.food.project.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.food.project.board.BoardVO;
import com.food.project.market.MarketService;
import com.food.project.market.MarketVO;
import com.food.project.member.MemberService;
import com.food.project.member.MemberVO;
import com.food.project.ordered.OrderedService;
import com.food.project.ordered.OrderedVO;
import com.food.project.util.Pager;

@Controller
@RequestMapping("/review/**")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	@Autowired
	private MarketService marketService;
	@Autowired
	private OrderedService orderedService;
	@Autowired
	private MemberService memberService;
	
	
	//판매자 마켓에 존재하는 리뷰 리스트 조회
	@GetMapping("reviewMarket")
	public ModelAndView marketReview(Pager pager,MarketVO marketVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		pager.setMarketNum(marketVO.getNum());
		List<ReviewVO> reviewList = reviewService.reviewMarketList(pager);
		
		mv.addObject("reviewList", reviewList);
		
		mv.setViewName("review/reviewMarket");
		return mv;
	}
	
	//판매자 덧글작성(GET/POST)
	@GetMapping("reviewReply")
	public ModelAndView reviewReply(ReviewVO reviewVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//리뷰 작성자의 정보
		reviewVO = reviewService.reviewSelect(reviewVO);
		
		//멤버 정보 조회(memberVO.nickName)
		MemberVO memberVO = new MemberVO();
		memberVO.setNum(reviewVO.getMemberNum());
		memberVO = memberService.memberSelect(memberVO);
		
		//메뉴명 조회(orderedVO.menuName)
		OrderedVO orderedVO = new OrderedVO();
		orderedVO.setNum(reviewVO.getOrderNum());
		orderedVO = orderedService.orderedSelect(orderedVO);
		
		
		mv.addObject("reviewVO", reviewVO);
		mv.addObject("memberVO", memberVO);
		mv.addObject("orderedVO", orderedVO);
		
		mv.setViewName("review/reviewReply");
		
		return mv;
	}
	
	//판매자 덧글작성
	@PostMapping("reviewReply")
	public ModelAndView reviewReply2(ReviewVO reviewVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//리뷰에 덧글 등록
		int result = reviewService.boardReply(reviewVO);
		
		if(result > 0) {
			System.out.println("덧글 등록 성공");
			mv.setViewName("redirect:../member/memberPage");
		}else {
			System.out.println("덧글 등록 실패");
		}
		
		return mv;
	}
	
	//판매자 답글 업데이트
	@GetMapping("reviewReplyUpdate")
	public ModelAndView reviewReplyUpdate(ReviewVO reviewVO) throws Exception{
		System.out.println("reviewReplyUpdate Controller IN");
		ModelAndView mv = new ModelAndView();
		
		//리뷰 작성자의 정보
		reviewVO = reviewService.reviewSelect(reviewVO);
		
		//멤버 정보 조회(memberVO.nickName)
		MemberVO memberVO = new MemberVO();
		memberVO.setNum(reviewVO.getMemberNum());
		memberVO = memberService.memberSelect(memberVO);
		
		//메뉴명 조회(orderedVO.menuName)
		OrderedVO orderedVO = new OrderedVO();
		orderedVO.setNum(reviewVO.getOrderNum());
		orderedVO = orderedService.orderedSelect(orderedVO);
		
		//덧글 불러오기(reviewVO2.contents)
		ReviewVO reviewVO2  = new ReviewVO();
		reviewVO2 = reviewVO;
		reviewVO2.setBoardNum(reviewVO.getIsReply());
		reviewVO2 = reviewService.reviewSelect(reviewVO2);
		
		mv.addObject("reviewVO", reviewVO); //구매자
		mv.addObject("reviewVO2", reviewVO2); //판매자
		mv.addObject("memberVO", memberVO);
		mv.addObject("orderedVO", orderedVO);
		
		mv.setViewName("review/reviewReplyUpdate");
		
		return mv;
		
	}
	
	//판매자 답글 업데이트
	@PostMapping("reviewReplyUpdate")
	public ModelAndView reviewReplyUpdate2(ReviewVO reviewVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("re2 : "+reviewVO.getBoardNum());
		System.out.println("re2 : "+reviewVO.getContents());
		
		
		int result = reviewService.boardUpdate(reviewVO);
		String msg = "수정이 실패했습니다.";
		String path = "../member/memberPage";
		if(result > 0) {
			msg="수정 완료";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("path", path);
		mv.setViewName("common/result");
		
		return mv;
	}
	
	
	
	//한 멤버가 작성한 리뷰목록 출력
	@GetMapping("myReviewList")
	public ModelAndView myReviewList(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		long memberNum = memberVO.getNum();
		List<ReviewVO> myReviewList = reviewService.myReviewList(memberNum); 
		
		if(myReviewList != null) {
			mv.addObject("myReviewList", myReviewList);
			mv.setViewName("member/myReview");
		}
		return mv;
	}
	
	
	
	
	
	//리뷰리스트 출력(GET)
	@GetMapping("reviewList")
	public ModelAndView reviewList(Pager pager,MarketVO marketVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//넘겨받은 userNum으로 해당 마켓의 전체 정보 조회
		marketVO = marketService.marketSelect(marketVO);
		
		//다음 페이저 값 계산해서 출력할 리뷰 페이지 연산 및 조회
		pager.setMarketNum(marketVO.getNum());
		List<BoardVO> list = reviewService.boardList(pager);
		
		if(list != null) {
			mv.addObject("pager", pager);
			mv.addObject("reviewList", list);
			
			mv.setViewName("review/reviewPagingAjax");
		}
		
		return mv;
		
	}
	
	//구매자 리뷰 작성
	@GetMapping("reviewInsert")
	public ModelAndView reviewInsert(OrderedVO orderedVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//orderedVO의 num값으로 orderedVO 조회
		orderedVO = orderedService.orderedSelect(orderedVO);
		
		//reviewInsert 페이지로 orderedVO 객체 전달
		mv.addObject("orderedVO", orderedVO);
		mv.setViewName("review/reviewInsert");
		
		return mv;
	}
	//구매자 리뷰 등록
	@PostMapping("reviewInsert")
	public ModelAndView reviewInsert(OrderedVO orderedVO,ReviewVO reviewVO,MultipartFile[] files,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = reviewService.boardInsert(reviewVO,files,session);
		System.out.println("리뷰 등록 결과 : "+result);
		
		if(result > 0) {
			System.out.println("odernum : "+orderedVO.getNum());
			orderedVO.setIsReview(reviewVO.getBoardNum());
			result = orderedService.orderedIsReviewUpdate(orderedVO);
		}
		
		if(result > 0) {
			mv.addObject("msg", "후기 등록이 완료되었습니다.");
			mv.addObject("path", "../member/memberPage");
		}else {
			mv.addObject("msg", "후기 등록 실패");
		}
		
		mv.setViewName("common/result");
		return mv;
	}
	
	//구매자 리뷰 삭제
	@GetMapping("reviewDelete")
	public ModelAndView reviewDelete(ReviewVO reviewVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		System.out.println("rboardNum : "+reviewVO.getBoardNum());
		System.out.println("rorderNum : "+reviewVO.getOrderNum());
		
		int result = reviewService.boardDelete(reviewVO);
		if(result > 0) {
			System.out.println("리뷰 삭제 완료");
			
			OrderedVO orderedVO = new OrderedVO();
			
			orderedVO.setNum(reviewVO.getOrderNum());
			orderedVO.setIsReview(0);
			orderedService.orderedIsReviewUpdate(orderedVO);
			
		}else {
			System.out.println("리뷰 삭제 실패");
		}
		mv.setViewName("redirect: ../member/memberPage");
		
		return mv;
	}
	
	//구매자 리뷰 수정
	@GetMapping("reviewUpdate")
	public ModelAndView getReviewUpdate(ReviewVO reviewVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//reviewVO조회 
		reviewVO = reviewService.reviewSelect(reviewVO);
		
		//orderNum으로 orderedVO조회
		OrderedVO orderedVO = new OrderedVO();
		orderedVO.setNum(reviewVO.getOrderNum());
		orderedVO = orderedService.orderedSelect(orderedVO);
		
		mv.addObject("reviewVO", reviewVO);
		mv.addObject("orderedVO", orderedVO);
		
		mv.setViewName("review/reviewUpdate");
		
		return mv;
	}
	//구매자 리뷰 수정
	@PostMapping("reviewUpdate")
	public ModelAndView reviewUpdate(ReviewVO reviewVO,MultipartFile[] files,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = reviewService.boardUpdate(reviewVO,files,session);
		
		if(result > 0) {
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제실패");
		}
		
		mv.setViewName("redirect:../member/memberPage");
		
		return mv;
	}
	
	

}
