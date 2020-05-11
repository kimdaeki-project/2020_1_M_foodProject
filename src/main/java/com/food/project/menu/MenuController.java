package com.food.project.menu;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/menu/**")
public class MenuController {

	@Autowired
	private MenuService menuService;
	
	@GetMapping("menuAdd")
	public void menuAdd() throws Exception {

	}
	
	// transaction 필요
	@PostMapping("menuAdd") 
	public ModelAndView menuAdd(MenuVO menuVO, MultipartFile[] files, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		// 이미지 파일 저장 및 fileName 가져와서 thumbImg에 넣어주기
		
		// 메뉴 insert
		menuVO.setMarketNum(11);// test value
		int result = menuService.menuAdd(menuVO, files, session);
		String msg = "메뉴 추가 실패";
		String url = "./menuAdd";
		if(result > 0) {
			msg = "메뉴가 추가 되었습니다";
			url = "./menuList";
		}
		
		// 이미지 테이블에 insert
		mv.addObject("msg", msg);
		mv.addObject("path", url);
		mv.setViewName("common/result");
		return mv;
	}

	@GetMapping("menuList")
	public ModelAndView menuList() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		// 메뉴 List 가져오기
		List<MenuVO> list = menuService.menuList();
		
		mv.addObject("menuList", list);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("menuSelect")
	public ModelAndView menuSelect(MenuVO menuVO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		// 메뉴VO 가져오기
		menuVO = menuService.menuSelect(menuVO);
		
		mv.addObject("vo", menuVO);
		mv.setViewName("menu/menuSelect");
		return mv;
	}
	
	@GetMapping("menuUpdate")
	public ModelAndView menuUpdate(MenuVO menuVO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		menuVO = (MenuVO)menuService.menuSelect(menuVO);
		mv.addObject("vo",menuVO);
		mv.setViewName("menu/menuUpdate");
		
		return mv;
	}
	
	@PostMapping("menuUpdate")
	public ModelAndView menuUpdate(MenuVO menuVO, MultipartFile[] files, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		// 대표 이미지 변경
		int result = menuService.menuUpdate(menuVO, files, session);
		String msg = "메뉴 수정 실패";
		String url = "./menuSelect?num="+menuVO.getNum();
		if(result > 0) {
			msg = "메뉴가 수정 되었습니다";
			url = "./menuList";
		}
		
		// 이미지 테이블에 insert
		mv.addObject("msg", msg);
		mv.addObject("path", url);
		mv.setViewName("common/result");
		return mv;
	}
	
	@GetMapping("menuDelete")
	public ModelAndView menuDelete(MenuVO menuVO, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		int result = menuService.menuDelete(menuVO, session);
		String msg = "메뉴 삭제 실패";
		String url = "./menuSelect?num="+menuVO.getNum();
		if(result > 0) {
			msg = "메뉴가 삭제 되었습니다";
			url = "./menuList";
		}
		
		// 이미지 테이블에 insert
		mv.addObject("msg", msg);
		mv.addObject("path", url);
		mv.setViewName("common/result");
		return mv;
	}
}
