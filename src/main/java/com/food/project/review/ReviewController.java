package com.food.project.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.food.project.board.BoardVO;
import com.food.project.util.Pager;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	//덧글달기(GET)
	@GetMapping("reviewReply")
	@ResponseBody
	public int reviewReply(ReviewVO reviewVO) throws Exception{
		
		int result = reviewService.boardReply(reviewVO);
		if(result > 0) {
			System.out.println("덧글 등록 성공");
		}else {
			System.out.println("덧글 등록 실패");
		}
		return result;
	}
	
	
	//리뷰리스트 출력(GET)
	@GetMapping("reviewList")
	public ModelAndView reviewList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<BoardVO> list = reviewService.boardList(pager);
		if(list != null) {
			mv.addObject("pager", pager);
			mv.addObject("reviewList", list);
			
			mv.setViewName("");
		}else {
			mv.setViewName("");
		}
		
		return mv;
		
	}
	
	//리뷰등록(POST)
	@PostMapping("reviewInsert")
	@ResponseBody
	public int reviewInsert(ReviewVO reviewVO,MultipartFile[] files,HttpSession session) throws Exception{
		int result = reviewService.boardInsert(reviewVO,files,session);
		if(result > 0) {
			System.out.println("리뷰등록 성공");
		}else {
			System.out.println("리뷰 등록 실패");
		}
		
		return result;
	}
	
	//리뷰삭제(GET)
	@GetMapping("reviewDelete")
	@ResponseBody
	public int reviewDelete(ReviewVO reviewVO) throws Exception{
		int result = reviewService.boardDelete(reviewVO);
		if(result > 0) {
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제실패");
		}
		
		return result;
	}
	
	//리뷰수정(POST)
	@PostMapping("reviewUpdate")
	@ResponseBody
	public int reviewUpdate(ReviewVO reviewVO) throws Exception{
		int result = reviewService.boardUpdate(reviewVO);
		if(result > 0) {
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제실패");
		}
		
		return result;
	}
}












