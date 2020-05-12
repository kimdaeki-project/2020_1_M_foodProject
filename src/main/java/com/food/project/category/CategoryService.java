package com.food.project.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {

	@Autowired
	private CategoryDAO categoryDAO;
	
	// 카테고리 추가
	public int categoryInsert(CategoryVO categoryVO) {
		
		categoryVO.setNum(categoryDAO.categoryCount());
		return categoryDAO.categoryInsert(categoryVO);
	}

	// 카테고리 리스트 읽어오기
	public List<CategoryVO> categoryList(CategoryVO categoryVO) {

		return categoryDAO.categoryList(categoryVO);
	}

	// 카테고리 단일 읽어오기
	public CategoryVO categorySelect(CategoryVO categoryVO) {

		return categoryDAO.categorySelect(categoryVO);
	}

	// 카테고리 수정
	public int categoryUpdate(CategoryVO categoryVO) {

		return categoryUpdate(categoryVO);
	}

	// 카테고리 삭제
	public int categoryDelete(CategoryVO categoryVO) {

		return categoryDelete(categoryVO);
	}
}