package com.food.project.interceptor;

import java.awt.Menu;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.food.project.market.MarketVO;
import com.food.project.member.MemberVO;
import com.food.project.menu.MenuVO;

@Component
public class MenuInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		boolean check = false;
		String method = request.getMethod();
		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf("/"));
		
		System.out.println(path);
		
		MarketVO marketVO = (MarketVO)request.getSession().getAttribute("marketVO");
		
		
		if(marketVO != null) {
			if(method.equals("GET") && path.equals("/menuDelete")) {
				long num = marketVO.getNum();
				long marketNum = Long.parseLong(request.getParameter("marketNum"));
				
				System.out.println(num);
				System.out.println(marketNum);
				
				if(num != marketNum) {
					request.setAttribute("msg", "접근권한이 없습니다.");
					request.setAttribute("path", "../");
					
					RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
					dispatcher.forward(request, response);
				}else {
					check = true;
				}
			}else {
				check = true;
			}
			
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
		String method = request.getMethod();
		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf("/"));

		if(method.equals("GET") && path.equals("/marketMenu")) {
			List<MenuVO> menuList = (List<MenuVO>)mv.getModel().get("menuList");
			MarketVO marketVO = (MarketVO)request.getSession().getAttribute("marketVO");

			long menu_marketNum = menuList.get(0).getMarketNum();
			long market_num = marketVO.getNum();
			
			if(menu_marketNum != market_num) {
				mv.addObject("msg", "접근권한이 없습니다.");
				mv.addObject("path", "../");
				mv.setViewName("common/result");
			}
			
		}else if(method.equals("GET") && path.equals("/menuUpdate")) {
			
			System.out.println("menuUpdateHadler IN");
			
			MarketVO marketVO = (MarketVO)request.getSession().getAttribute("marketVO");
			MarketVO marketVO2 = (MarketVO)mv.getModel().get("marketVO");
			
			
			long num = marketVO.getNum();
			long marketNum = marketVO2.getNum();
			
			
			
			if(num != marketNum) {
				mv.addObject("msg", "접근권한이 없습니다.");
				mv.addObject("path", "../");
				mv.setViewName("common/result");
			}
			
		}
	}
}


















