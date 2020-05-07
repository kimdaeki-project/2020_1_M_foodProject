package com.food.project.market;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MarketService {

	@Autowired
	private MarketDAO marketDAO;
	
	//조회 - select One
	public MarketVO marketSelect(MarketVO marketVO) throws Exception{
		return marketDAO.marketSelect(marketVO);
	}
	
	//등록
	public int marketInsert(MarketVO marketVO) throws Exception{
		return marketDAO.marketInsert(marketVO);
	}
	
	//삭제
	public int marketDelete(MarketVO marketVO) throws Exception{
		return marketDAO.marketDelete(marketVO);
	}
	
	//수정
	public int marketUpdate(MarketVO marketVO) throws Exception{
		return marketDAO.marketUpdate(marketVO);
	}
	
}
