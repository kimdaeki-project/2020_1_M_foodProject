package com.food.project.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/category/**")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;
	
	// 카테고리 추가
	@GetMapping("categoryInsert")
	public void categoryInsert() {

	}

	@PostMapping("categoryInsert")
	public int categoryInsert(CategoryVO categoryVO) {

		return categoryService.categoryInsert(categoryVO);
	}

	// 카테고리 리스트 읽어오기
	@GetMapping("categoryList")
	public ModelAndView categoryList(CategoryVO categoryVO) {
		System.out.println("ddd");

		ModelAndView mv = new ModelAndView();
		
		List<CategoryVO> list = categoryService.categoryList(categoryVO);
		for (CategoryVO categoryVO2 : list) {
			System.out.println(categoryVO2.getName());
		}
		
		mv.addObject("categoryList", list);
		mv.setViewName("category/categoryList");
		
		return mv;
	}

	// 카테고리 단일 읽어오기
	@GetMapping("categorySelect")
	public ModelAndView categorySelect(CategoryVO categoryVO) {

		ModelAndView mv = new ModelAndView();
		
		categoryVO = categoryService.categorySelect(categoryVO);
		
		mv.addObject("categoryVO", categoryVO);
		mv.setViewName("category/categorySelect");
		
		return mv;
	}

	// 카테고리 수정
	@GetMapping("categoryUpdate")
	public void categoryUpdate() {

	}
	
	@PostMapping("categoryUpdate")
	public ModelAndView categoryUpdate(CategoryVO categoryVO) {
		
		ModelAndView mv = new ModelAndView();
		
		int result = categoryService.categoryUpdate(categoryVO);
		
		mv.setViewName("categoryList");
		
		return mv;
	}

	// 카테고리 삭제
	@GetMapping("categoryDelete")
	public ModelAndView categoryDelete(CategoryVO categoryVO) {

		ModelAndView mv = new ModelAndView();
		
		int result = categoryService.categoryDelete(categoryVO);
		
		mv.setViewName("categoryList");
		
		return mv;
	}
}
