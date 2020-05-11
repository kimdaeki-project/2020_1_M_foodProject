package com.food.project.category;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.project.AbstractTestCase;

public class categoryDAOTest extends AbstractTestCase {

	@Autowired
	private CategoryDAO categoryDAO;
	
//	@Test
//	public void categoryInsert() {
//		
//		CategoryVO categoryVO = new CategoryVO();
//		
//		categoryVO.setNum(2);
//		categoryVO.setMenuNum(22);
//		categoryVO.setName("음료");
//		
//		int result = categoryDAO.categoryInsert(categoryVO);
//		assertEquals(1, result);
//	}
	
//	public List<CategoryVO> categoryListTest(){
//		
//		CategoryVO categoryVO = new CategoryVO();
//		categoryVO.setMenuNum(22);
//		return categoryDAO.categoryList(categoryVO);
//	}
//	
//	@Test
//	public void categoryList() throws Exception {
//		
//		List<CategoryVO> list = this.categoryListTest();
//		assertNotEquals(0, list.size());
//	}
	
//	@Test
//	public void categorySelect() {
//		
//		CategoryVO categoryVO = new CategoryVO();
//		categoryVO.setNum(1);
//		CategoryVO resultVO = null;
//		resultVO = categoryDAO.categorySelect(categoryVO);
//		System.out.println(resultVO.getName());
//		assertNotNull(resultVO);
//	}
	
//	@Test
//	public void categoryUpdate() {
//		
//		CategoryVO categoryVO = new CategoryVO();
//		categoryVO.setNum(2);
//		categoryVO.setName("음료수");
//		int result = categoryDAO.categoryUpdate(categoryVO);
//		assertEquals(1, result);
//	}
	
	@Test
	public void categoryDelete() {
		
		CategoryVO categoryVO = new CategoryVO();
		categoryVO.setNum(2);
		int result = categoryDAO.categoryDelete(categoryVO);
		assertEquals(1, result);
	}
}
