package com.food.project.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class MemberInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		boolean check = false;
		
		Object obj = request.getSession().getAttribute("memberVO");
		
		if(obj != null) {
			check = true;
		}else {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("path", "./memberLogin");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
			dispatcher.forward(request, response);
		}
		
	
		return check;
	}
	
	
}
