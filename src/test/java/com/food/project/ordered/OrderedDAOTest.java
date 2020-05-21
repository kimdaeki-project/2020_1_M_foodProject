package com.food.project.ordered;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.project.AbstractTestCase;

public class OrderedDAOTest extends AbstractTestCase{

	@Autowired
	private OrderedDAO orderedDAO;
	
//	@Test
	public void orderedInsert() throws Exception{
		
		OrderedVO orderedVO = new OrderedVO();
		
		long num = orderedDAO.orderedCount();
		orderedVO.setNum(num);
		orderedVO.setMemberNum(29);
		orderedVO.setMarketNum(4);
		orderedVO.setMenuNum(168);
		orderedVO.setCateMenuOptions("aaa 1000/bbb 2200");
		orderedVO.setAmount(3200);
		orderedVO.setMerchant_uid("Fusulan_Truck_"+num);
		orderedVO.setImp_uid(null);
		orderedVO.setPg(null);
		orderedVO.setPay_method(null);
		orderedVO.setCancleDetail(null);
		orderedVO.setCancleType(2);
		orderedVO.setIsOrderChecked(0);
		
		int reuslt = orderedDAO.orderedInsert(orderedVO);
		
		assertEquals(1, reuslt);
	}
	
//	@Test
	public void orderedList() throws Exception{
		OrderedVO orderedVO = new OrderedVO();
		orderedVO.setMemberNum(29);
		List<OrderedVO> orderedList = orderedDAO.orderedList(orderedVO);
		
		assertNotNull(orderedList);
	}
		

}




















