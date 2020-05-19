package com.food.project.menu;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.food.project.category.CategoryService;
import com.food.project.category.CategoryVO;
import com.food.project.market.MarketVO;
import com.food.project.menuOption.MenuOptionService;
import com.food.project.menuOption.MenuOptionVO;

@Controller
@RequestMapping("/menu/**")
public class MenuController {

	@Autowired
	private MenuService menuService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private MenuOptionService menuOptionSerice;
	
	
	
	@GetMapping("menuAdd")
	public void menuAdd() throws Exception {

	}
	
	
	// transaction 필요
	@PostMapping("menuAdd")
	public ModelAndView menuAdd(MenuVO menuVO, MultipartFile[] files, HttpServletRequest request,HttpSession session) throws Exception {
		System.out.println("메뉴 추가");
		
		//로그인된 세션에서 market의  num값 획득
		MarketVO marketVO = (MarketVO)session.getAttribute("marketVO");
		long marketNum = marketVO.getNum();
		
		
		ModelAndView mv = new ModelAndView();
		Map<String, MenuOptionVO> moMap = new HashMap<String, MenuOptionVO>();
		Map<Integer, CategoryVO> cMap = new HashMap<Integer, CategoryVO>();
		
		Enumeration<String> en = request.getParameterNames();
		
		while(en.hasMoreElements()) {
			String key = en.nextElement();
			String str = request.getParameter(key);
			
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
		
		
		//메뉴 등록
		
		menuVO.setMarketNum(marketNum);
		int result = menuService.menuAdd(menuVO, files, session);
		
		
		
		if(result > 0) {
			System.out.println("메뉴는 등록 완료");
			
			
			//카테고리 등록
			CategoryVO categoryVO = new  CategoryVO();
			System.out.println("menuVO의 getnum : "+menuVO.getNum());
			categoryVO.setMenuNum(menuVO.getNum());
			System.out.println("category의 넣은  MenuNum : "+categoryVO.getMenuNum());
			
			for (Map.Entry<Integer, CategoryVO> vo : cMap.entrySet()) {
				int key2   = vo.getKey();
				CategoryVO vo2 =  vo.getValue();
				
				categoryVO.setName(vo2.getName());
				System.out.println("categoryVO Name:"+categoryVO.getName());
				
				result = categoryService.categoryInsert(categoryVO);
				System.out.println("카테고리 등록완료는 등록 완료 : "+categoryVO.getName());
				
				//메뉴 옵션 등록
				for (Map.Entry<String, MenuOptionVO> moVO : moMap.entrySet()) {
					String menuOptionKey   = moVO.getKey(); //1,1
					MenuOptionVO menuOption =  moVO.getValue(); //입력된 값(name, price)
					
					System.out.println(menuOptionKey);
					System.out.println(menuOption.getName());
					System.out.println(menuOption.getPrice());
					
					int menuOptionkeyNum = Integer.parseInt(menuOptionKey.substring(0, 1)+"");
					System.out.println("keyNum : "+menuOptionkeyNum);
					
					//카테고리의 키번호와 메뉴 옵션의 키번호가 일치할 경우에만  DB에 메뉴 옵션 등록
					if(key2 == menuOptionkeyNum) {
						
						MenuOptionVO menuOptionVO = new MenuOptionVO();
						menuOptionVO.setCategoryNum(categoryVO.getNum());
						menuOptionVO.setName(menuOption.getName());
						menuOptionVO.setPrice(menuOption.getPrice());
						
						result = menuOptionSerice.menuOptionInsert(menuOptionVO);
						
						System.out.println("메뉴 등록완료 : "+menuOptionVO.getName());
					}
					
				}

				
			}
			
			mv.setViewName("member/memberPage");
		}
		
		
		
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
