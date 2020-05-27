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
		
		if(method.equals("GET") && path.equals("/myReviewList")) {
			List<ReviewVO> myReviewList = (List<ReviewVO>)mv.getModel().get("myReviewList");
			
			long num = myReviewList.get(0).getMemberNum();
			
			if(num != memberNum) {
				mv.addObject("msg", "접근권한이 없습니다.");
				mv.addObject("path", "../");
				mv.setViewName("common/result");
			}
		}else if(method.equals("GET") && path.equals("/reviewUpdate")){
			ReviewVO reviewVO = (ReviewVO)mv.getModel().get("reviewVO");
			
			long num = reviewVO.getMemberNum();
			if(num != memberNum) {
				mv.addObject("msg", "접근권한이 없습니다.");
				mv.addObject("path", "../");
				mv.setViewName("common/result");
			}
			
		}
		
	}
	
}



















