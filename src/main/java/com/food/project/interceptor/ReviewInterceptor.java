package com.food.project.interceptor;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.food.project.market.MarketVO;
import com.food.project.member.MemberVO;
import com.food.project.review.ReviewVO;


@Component
public class ReviewInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		boolean check = false;
		String method = request.getMethod();
		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf("/"));
		
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("memberVO");
		MarketVO marketVO = (MarketVO)request.getSession().getAttribute("marketVO");
		
		if(memberVO != null) {
			if(path.equals("/reviewReply") || path.equals("/reviewReplyUpdate") || path.equals("/reviewMarket")) {
				if(marketVO != null) {
					if(method.equals("GET") && path.equals("/reviewReply")) {
						System.out.println("ININININ");
						
						long num = Long.parseLong(request.getParameter("marketNum"));
						long marketNum = marketVO.getNum(); 
						
						System.out.println("se Num : "+marketNum);
						System.out.println("pa Num : "+num);
						
						if(marketNum != num) {
							request.setAttribute("msg", "권한이 필요합니다.");
							request.setAttribute("path", "../");
							
							RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
							dispatcher.forward(request, response);
						}
					}else {
						check= true;
					}
					
				}else {
					request.setAttribute("msg", "판매자 등록이 필요합니다.");
					request.setAttribute("path", "../member/memberPage");
					
					RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
					dispatcher.forward(request, response);
				}
			}
			
			if(method.equals("GET") && path.equals("/reviewDelete")) {
				long memberNum = Long.parseLong(request.getParameter("memberNum"));
				if(memberNum != memberVO.getNum()) {
					request.setAttribute("msg", "권한이 필요합니다.");
					request.setAttribute("path", "../");
					
					RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
					dispatcher.forward(request, response);
				}else {
					check= true;
				}
			}else {
				check = true;
			}
			
		}else {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("path", "../member/memberLogin");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
			dispatcher.forward(request, response);
		}
		
		return check;
	}
	 
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,ModelAndView mv) throws Exception {
		//myReviewList
		String method = request.getMethod();
		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf("/"));
		
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("memberVO");
		long memberNum = memberVO.getNum();
		
		MarketVO marketVO = (MarketVO)request.getSession().getAttribute("marketVO");
		
		if(method.equals("GET") && path.equals("/myReviewList")) {
			List<ReviewVO> myReviewList = (List<ReviewVO>)mv.getModel().get("myReviewList");
			if(myReviewList.size() > 0) {
				long num = myReviewList.get(0).getMemberNum();
				
				if(num != memberNum) {
					mv.addObject("msg", "접근권한이 없습니다.");
					mv.addObject("path", "../");
					mv.setViewName("common/result");
				}
			}
			
		}else if(method.equals("GET") && path.equals("/reviewUpdate")){
			ReviewVO reviewVO = (ReviewVO)mv.getModel().get("reviewVO");
			
			long num = reviewVO.getMemberNum();
			if(num != memberNum) {
				mv.addObject("msg", "접근권한이 없습니다.");
				mv.addObject("path", "../");
				mv.setViewName("common/result");
			}
			
		}else if(method.equals("GET") && path.equals("/reviewMarket")){
			List<ReviewVO> reviewList = (List<ReviewVO>)mv.getModel().get("reviewList");
			
			if(reviewList.size() > 0) {
				long num = reviewList.get(0).getMarketNum();
				long marketNum = marketVO.getNum();
				
				System.out.println("session Num: "+marketNum);
				System.out.println("mv Num : "+num);
				
				
				if(num != marketNum) {
					mv.addObject("msg", "접근권한이 없습니다.");
					mv.addObject("path", "../");
					mv.setViewName("common/result");
				}
			}
			
		
		}else if(method.equals("GET") && path.equals("/reviewReplyUpdate")) {
			long marketNum = marketVO.getNum();
			
			ReviewVO reviewVO = (ReviewVO)mv.getModel().get("reviewVO2");
			long num = reviewVO.getMarketNum();
			if(num != marketNum) {
				mv.addObject("msg", "접근권한이 없습니다.");
				mv.addObject("path", "../");
				mv.setViewName("common/result");
			}
			
		}
	}
	
}



















