package com.food.project.menuOption;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.project.AbstractTestCase;


public class menuOptionDAOTest extends AbstractTestCase {

	@Autowired
	private MenuOptionDAO menuOptionDAO;
	
	@Test
	public void menuOptionInsert() {
		
		MenuOptionVO menuOptionVO = new MenuOptionVO();
		
		menuOptionVO.setNum(1);
		menuOptionVO.setCategoryNum(1);
		menuOptionVO.setName("설탕");
		menuOptionVO.setPrice(0);
		
		int result = menuOptionDAO.menuOptionInsert(menuOptionVO);
		assertEquals(1, result);
	}
	
//	public List<MenuOptionVO> menuOptionListTest(){
//		
//		MenuOptionVO menuOptionVO = new MenuOptionVO();
//		menuOptionVO.setCategoryNum(1);
//		return menuOptionDAO.menuOptionList(menuOptionVO);
//	}
//	
//	@Test
//	public void menuOptionList() throws Exception {
//		
//		List<MenuOptionVO> list = this.menuOptionListTest();
//		assertNotEquals(0, list.size());
//	}
	
//	@Test
//	public void menuOptionSelect() {
//		
//		MenuOptionVO menuOptionVO = new MenuOptionVO();
//		menuOptionVO.setNum(1);
//		MenuOptionVO resultVO = null;
//		resultVO = menuOptionDAO.menuOptionSelect(menuOptionVO);
//		System.out.println(resultVO.getName());
//		assertNotNull(resultVO);
//	}
	
//	@Test
//	public void menuOptionUpdate() {
//		
//		MenuOptionVO menuOptionVO = new MenuOptionVO();
//		menuOptionVO.setNum(1);
//		menuOptionVO.setName("살사소스");
//		menuOptionVO.setPrice(1000);
//		int result = menuOptionDAO.menuOptionUpdate(menuOptionVO);
//		assertEquals(1, result);
//	}
	
//	@Test
//	public void menuOptionDelete() {
//		
//		MenuOptionVO menuOptionVO = new MenuOptionVO();
//		menuOptionVO.setNum(1);
//		int result = menuOptionDAO.menuOptionDelete(menuOptionVO);
//		assertEquals(1, result);
//	}
}
