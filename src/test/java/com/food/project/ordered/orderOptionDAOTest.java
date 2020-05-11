package com.food.project.ordered;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.project.AbstractTestCase;
import com.food.project.orderOption.OrderOptionDAO;
import com.food.project.orderOption.OrderOptionVO;

public class orderOptionDAOTest extends AbstractTestCase{

	@Autowired
	private OrderOptionDAO orderOptionDAO;
	
//	@Test
	public void orderOptionList() throws Exception {
		OrderOptionVO optionVO = new OrderOptionVO();
		optionVO.setOrderNum(1);
		
		List<OrderOptionVO> list = orderOptionDAO.orderOptionList(optionVO);
	}
	
//	@Test
	public void orderOptionInsert() throws Exception{
		OrderOptionVO optionVO = new OrderOptionVO();
		optionVO.setOptionNum(1);
		optionVO.setOrderNum(1);
		
		int result = orderOptionDAO.orderOptionInsert(optionVO);
		assertEquals(1, result);
	}

}
