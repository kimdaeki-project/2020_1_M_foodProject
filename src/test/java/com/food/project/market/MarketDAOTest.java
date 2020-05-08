package com.food.project.market;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.project.AbstractTestCase;

public class MarketDAOTest extends AbstractTestCase{

	@Autowired
	private MarketDAO marketDAO;
	
//	@Test
	public void marketSelect() throws Exception{
		MarketVO marketVO = new MarketVO();
		marketVO.setNum(12);
		
		marketVO = marketDAO.marketSelect(marketVO);
		
		assertNotNull(marketVO);
	}
	
//	@Test
	public void marketList() throws Exception { 
		MarketVO marketVO = new MarketVO();
		marketVO.setUserNum(8);
		
		List<MarketVO> list = marketDAO.marketList(marketVO);
		assertNotNull(list);
		
	}

//	@Test
	public void marketInsert() throws Exception{
		MarketVO marketVO = new MarketVO();
		marketVO.setUserNum(10);
		marketVO.setCrn("170");
		marketVO.setMarketName("abcmarket");
		marketVO.setOpenTime("0830");
		marketVO.setCloseTime("1800");
		marketVO.setMarketIntro("hellooo");
		
		int result = marketDAO.marketInsert(marketVO);
		assertEquals(1, result);
	}
	
//	@Test
	public void marketDelete() throws Exception{
		MarketVO marketVO = new MarketVO();
		marketVO.setUserNum(10);
		int result = marketDAO.marketDelete(marketVO);
		assertEquals(1, result);
		
	}
	
	
	
	
	
}


























