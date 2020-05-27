package com.food.project.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.food.project.market.MarketVO;

@Component
public class MarketInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		boolean check = false;
		
		Object marketVO = request.getSession().getAttribute("marketVO");
		
		if(marketVO != null) {
			check = true;
		}else {
			Object memberVO = request.getSession().getAttribute("memberVO");
			
			if(memberVO != null) { //로그인되어 있으면
					request.setAttribute("msg", "마켓등록이 필요합니다.");
					request.setAttribute("path", "../member/memberPage");
			}else {
				request.setAttribute("msg", "로그인이 필요합니다.");
				request.setAttribute("path", "../member/memberLogin");
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
			dispatcher.forward(request, response);
		}
		
		return check;
	}
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mv) throws Exception {
		
		MarketVO marketVO = (MarketVO)request.getSession().getAttribute("marketVO");
		MarketVO marketVO2 = (MarketVO)mv.getModel().get("marketVO");
		
		String method = request.getMethod();
		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf("/"));
		
		if(method.equals("GET") && path.equals("/marketPage")) {
			long marketNum = marketVO.getNum();
			long marketNum2 = marketVO2.getNum();
			
			if(marketNum != marketNum2) {
				mv.addObject("msg", "접근권한이 없습니다.");
				mv.addObject("path", "../");
				mv.setViewName("common/result");
			}
		}
		
		
	}
}








