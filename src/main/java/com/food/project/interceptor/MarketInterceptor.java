package com.food.project.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.food.project.member.MemberVO;

@Component
public class MarketInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		boolean check = false;
		
		Object obj = request.getSession().getAttribute("marketVO");
		if(obj != null) {
			check = true;
		}else {
			MemberVO memberVO = (MemberVO)request.getSession().getAttribute("memberVO");
			if(memberVO != null) {
				request.setAttribute("msg", "판매자가 아닙니다.");
				request.setAttribute("path", "./marketJoin");
			}else {
				request.setAttribute("msg", "로그인이 필요합니다");
				request.setAttribute("path", "../member/memberLogin");
			}
			
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
			dispatcher.forward(request, response);
		}
		
		
	
		return check;
	}
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
}
