package com.food.project.menu;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.food.project.category.CategoryVO;
import com.food.project.market.MarketVO;
import com.food.project.menuOption.MenuOptionVO;

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
	public ModelAndView menuAdd(MenuVO menuVO, HttpServletRequest request,HttpSession session) throws Exception {
		System.out.println("메뉴 추가");
		
		MarketVO marketVO = (MarketVO)session.getAttribute("marketVO");
		long marketNum = marketVO.getNum();
		
		Map<String, MenuOptionVO> moMap = new HashMap<String, MenuOptionVO>();
		Map<Integer, CategoryVO> cMap = new HashMap<Integer, CategoryVO>();
		
		Enumeration<String> en = request.getParameterNames();
		
		while(en.hasMoreElements()) {
//			System.out.println("Param :"+ en.nextElement());
			
			String key = en.nextElement();
			String str = request.getParameter(key);
//			System.out.println("Param :"+ key + " Str :"+str);
			
			String[] keys = key.split("_");
			switch (keys[0]) {
			case "menu":
				
				if(keys[1].equals("name")) {
					menuVO.setName(str);
				}else if(keys[1].equals("price")) {
					menuVO.setPrice(Integer.parseInt(str));
				}else if(keys[1].equals("detail")) {
					menuVO.setDetail(str);
				}
				break;

			case "cate":
				
				String cateName = str;
				Integer cateKey = Integer.parseInt(keys[2]);
				
				CategoryVO categoryVO = new CategoryVO();
				categoryVO.setName(cateName);
				
				cMap.put(cateKey, categoryVO);
				
				break;
				
			case "op" :
				
				String value = str;
				String index = keys[2];
				String index2 = keys[3];
				String indexKey = index + "," + index2;
				
				if(keys[1].equals("name")) {
					
					if(moMap.containsKey(indexKey)) {
						
						MenuOptionVO menuOptionVO = moMap.get(indexKey);
						menuOptionVO.setName(value);
						moMap.put(indexKey, menuOptionVO);
					
					} else {
					
						MenuOptionVO menuOptionVO = new MenuOptionVO();
						menuOptionVO.setName(value);
						moMap.put(indexKey, menuOptionVO);
					}
					
				} else if(keys[1].equals("price")) {
				
					if(moMap.containsKey(indexKey)) {
						
						MenuOptionVO menuOptionVO = moMap.get(indexKey);
						menuOptionVO.setPrice(Integer.parseInt(value));
						moMap.put(indexKey, menuOptionVO);
					
					} else {
					
						MenuOptionVO menuOptionVO = new MenuOptionVO();
						menuOptionVO.setPrice(Integer.parseInt(value));
						moMap.put(indexKey, menuOptionVO);
					}
				}
				
				break;
			
			default:
				break;
			}
			
			

				
			
			
			
			
			
			
		}
		
		System.out.println("menuVO");
		System.out.println("price : "+menuVO.getPrice());
		System.out.println("name : "+menuVO.getName());
		System.out.println("detail : "+menuVO.getDetail());
		System.out.println();
		
		System.out.println("categoryVO");
		for (Map.Entry<Integer, CategoryVO> vo : cMap.entrySet()) {
			int key2   = vo.getKey();
			CategoryVO vo2 =  vo.getValue();
			
			System.out.println("============");
			System.out.println(key2);
			System.out.println(vo2.getName());
			System.out.println("============");
		}
		System.out.println();
		
		
		System.out.println("menuOptionVO");
		for (Map.Entry<String, MenuOptionVO> vo : moMap.entrySet()) {
			String key2   = vo.getKey();
			MenuOptionVO vo2 =  vo.getValue();
			
			System.out.println("============");
			System.out.println(key2);
			System.out.println(vo2.getName());
			System.out.println(vo2.getPrice());
			System.out.println("============");
		}
		System.out.println();
//		
		
		
		ModelAndView mv = new ModelAndView();
		
		

		
		
		
		return mv;
	}

	@GetMapping("menuList")
	public ModelAndView menuList(MenuVO menuVO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		// 메뉴 List 가져오기
		List<MenuVO> list = menuService.menuList(menuVO);
		
		mv.addObject("menuList", list);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("menuSelect")
	public ModelAndView menuSelect(MenuVO menuVO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		// 메뉴VO 가져오기
		menuVO = menuService.menuSelect(menuVO);
		
		mv.addObject("menuVO", menuVO);
		mv.setViewName("menu/menuSelect");
		return mv;
	}
	
	@GetMapping("menuUpdate")
	public ModelAndView menuUpdate(MenuVO menuVO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		menuVO = (MenuVO)menuService.menuSelect(menuVO);
		mv.addObject("menuVO",menuVO);
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
