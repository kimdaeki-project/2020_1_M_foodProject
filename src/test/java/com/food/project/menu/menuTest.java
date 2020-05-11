package com.food.project.menu;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.project.AbstractTestCase;

public class menuTest extends AbstractTestCase {

	@Autowired
	private MenuDAO menuDAO;
	
//	@Test
//	public void menuAddTest() throws Exception {
//	
//		MenuVO menuVO = new MenuVO();
//		
//		menuVO.setNum(1);
//		menuVO.setMarketNum(11);
//		menuVO.setName("핫도그");
//		menuVO.setPrice(3000);
//		menuVO.setDetail("치즈듬뿍");
//		
//		int result = menuDAO.menuAdd(menuVO);
//		assertEquals(1, result);
//	}
	
//	@Test
//	public void menuAddTest() throws Exception {
//	
//		for(int i=0; i<10; i++) {
//		
//			MenuVO menuVO = new MenuVO();
//			
//			menuVO.setNum(18+i);
//			menuVO.setMarketNum(11);
//			menuVO.setName("핫도그");
//			menuVO.setPrice(3000);
//			menuVO.setDetail("치즈듬뿍");
//			
//			int result = menuDAO.menuAdd(menuVO);
//		}
//	}
	
	public List<MenuVO> menuListTest() throws Exception {
	
		MenuVO menuVO = new MenuVO();
		menuVO.setMarketNum(11);
		return menuDAO.menuList(menuVO);
	}
	
	@Test
	public void menuOptionList() throws Exception {
		
		List<MenuVO> list = this.menuListTest();
		assertNotEquals(0, list.size());
	}
	
//	@Test
//	public void menuSelectTest() throws Exception {
//	
//		MenuVO menuVO = new MenuVO();
//		menuVO.setNum(1);
//		menuVO = menuDAO.menuSelect(menuVO);
//		assertNotNull(menuVO);
//	}
	
//	@Test
//	public void menuUpdateTest() throws Exception {
//	
//		MenuVO menuVO = new MenuVO();
//		
//		menuVO.setNum(1);
//		menuVO.setMarketNum(11);
//		menuVO.setName("치즈 핫도그");
//		menuVO.setPrice(4000);
//		menuVO.setDetail("까망베르 치즈가 듬뿍 들어간 핫도그");
//		
//		int result = menuDAO.menuUpdate(menuVO);
//		assertEquals(1, result);
//	}
	
//	@Test
//	public void menuDeleteTest() throws Exception {
//	
//		MenuVO menuVO = new MenuVO();
//		
//		menuVO.setNum(1);
//		
//		int result = menuDAO.menuDelete(menuVO);
//		assertEquals(1, result);
//	}
}
