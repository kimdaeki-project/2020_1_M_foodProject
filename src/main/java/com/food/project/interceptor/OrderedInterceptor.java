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
import com.food.project.ordered.OrderedVO;
import com.food.project.review.ReviewVO;

@Component
public class OrderedInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		boolean check = false;
		String method = request.getMethod();
		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf("/"));
		
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("memberVO");
		
		if(memberVO == null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("path", "../member/memberLogin");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
			dispatcher.forward(request, response);
		}
		
		System.out.println("pass");
		
		return check;
	}
	 
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,ModelAndView mv) throws Exception {
		//myReviewList
		String method = request.getMethod();
		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf("/"));
		
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("memberVO");
		MarketVO marketVO = (MarketVO)request.getSession().getAttribute("marketVO");
		
		System.out.println("=================================");
		System.out.println(path);
		
		if(method.equals("GET") && path.equals("/orderedList")) {
			List<OrderedVO> orderedList = (List<OrderedVO>)mv.getModel().get("orderedList");
			if(orderedList.get(0).getMemberNum() != memberVO.getNum()) {
				mv.addObject("msg", "접근권한이 없습니다.");
				mv.addObject("path", "../");
				mv.setViewName("common/result");
			}	
		}
		
		if(method.equals("GET") && path.equals("/orderPage")) {
			List<OrderedVO> orderedList = (List<OrderedVO>)mv.getModel().get("orderedList");
			if(orderedList.get(0).getMemberNum() != memberVO.getNum()) {
				mv.addObject("msg", "접근권한이 없습니다.");
				mv.addObject("path", "../");
				mv.setViewName("common/result");
			}	
		}
		
		/* else if(method.equals("GET") && path.equals("/reviewUpdate")){
			ReviewVO reviewVO = (ReviewVO)mv.getModel().get("reviewVO");
			
			long num = reviewVO.getMemberNum();
			if(num != memberNum) {
				mv.addObject("msg", "접근권한이 없습니다.");
				mv.addObject("path", "../");
				mv.setViewName("common/result");
			}
		*/	
	}
}
