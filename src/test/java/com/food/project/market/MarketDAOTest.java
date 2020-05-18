package com.food.project.market;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.project.AbstractTestCase;

public class MarketDAOTest extends AbstractTestCase{

	@Autowired
	private MarketDAO marketDAO;
	
////	@Test
//	public void marketSelect() throws Exception{
//		MarketVO marketVO = new MarketVO();
//		marketVO.setNum(12);
//		
//		marketVO = marketDAO.marketSelect(marketVO);
//		
//		assertNotNull(marketVO);
//	}
	
//	@Test
//	public void marketList() throws Exception { 
//		List<MarketVO> list = marketDAO.marketList();
//		
//		
//		if(list == null) {
//			System.out.println("비어있음");
//		}else {
//			System.out.println("값 들어있음");
//			for (MarketVO vo : list) {
//				System.out.println(vo.getMarketName());
//			}
//		}
//		
//		
//		
//		assertNotNull(list);
//		
//	}

	@Test
	public void marketInsert() throws Exception{
	
		int j = -1;
		for(int i=6; i<=15; i++) {
		
			MarketVO marketVO = new MarketVO();
			marketVO.setNum(i);
			marketVO.setUserNum(i+30);
			marketVO.setCategoryNum((i-6)%2==0?(++j):j);
			marketVO.setCrn("123-000"+i);
			marketVO.setMarketName("modAfter");
			marketVO.setOpenTime("0900");
			marketVO.setCloseTime("1800");
			marketVO.setMarketIntro("맛집_"+i);
			marketVO.setThumbImg("Default");
			
			int result = marketDAO.marketInsert(marketVO);
			assertEquals(1, result);
		}
	}
	
////	@Test
//	public void marketDelete() throws Exception{
//		MarketVO marketVO = new MarketVO();
//		marketVO.setUserNum(10);
//		int result = marketDAO.marketDelete(marketVO);
//		assertEquals(1, result);
//		
//	}
}


























