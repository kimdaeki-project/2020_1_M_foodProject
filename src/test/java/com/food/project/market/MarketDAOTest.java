package com.food.project.market;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.project.AbstractTestCase;

public class MarketDAOTest extends AbstractTestCase{

	@Autowired
	private MarketDAO marketDAO;
	
	@Test
	public void marketSelect() throws Exception{
		MarketVO marketVO = new MarketVO();
		marketVO.setNum(4);
		
		marketVO = marketDAO.marketSelect(marketVO);
		
		assertNotNull(marketVO);
	
	}

}
