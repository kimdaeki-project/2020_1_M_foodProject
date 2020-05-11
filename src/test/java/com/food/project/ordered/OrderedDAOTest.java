package com.food.project.ordered;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.project.AbstractTestCase;

public class OrderedDAOTest extends AbstractTestCase{

	@Autowired
	private OrderedDAO orderedDAO;
	
	@Test
	public void orderedCount() throws Exception{
		
		long count = orderedDAO.orderedCount();
		
		assertEquals(10, count);
	}
	
	
//	@Test
	public void orderedList() throws Exception {
		OrderedVO orderedVO = new OrderedVO();
		orderedVO.setSellerID("seller");
		
		List<OrderedVO> list = orderedDAO.orderedList(orderedVO);
		assertNotNull(list);
	}
	
//	@Test
	public void orderedSelect() throws Exception{
		OrderedVO orderedVO = new OrderedVO();
		orderedVO.setUserID("user");
		
		orderedVO = orderedDAO.orderedSelect(orderedVO);
		assertNotNull(orderedVO);
	}
	
//	@Test
	public void orderedInsert() throws Exception{
		OrderedVO orderedVO = new OrderedVO();
		for(int i=0;i<5;i++) {
			orderedVO.setSellerID("seller"+i);
			orderedVO.setUserID("user"+i);
			orderedVO.setPayType(1);
			orderedVO.setCount(1);
			orderedVO.setMenuNum(5);
			
			int result = orderedDAO.orderedInsert(orderedVO);
			assertEquals(1, result);
			
		}
	}
	
//	@Test
	public void orderedCancle() throws Exception{
		OrderedVO orderedVO = new OrderedVO();
		orderedVO.setUserID("user1");
		orderedVO.setCancleType(1);
		
		int result = orderedDAO.orderedCancle(orderedVO);
		assertEquals(1, result);
	}

}




















