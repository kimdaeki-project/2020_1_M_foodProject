package com.food.project.market;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MarketDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.food.project.market.MarcketDAO.";

	//조회 - select List (하나의 판매자에 대한 여러 푸드트럭의 정보 - userNum으로 조회)
	public List<MarketVO> marketList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"marketList");
	}
	
	//조회 - select One (하나의 푸드트럭에 대한 정보 - num으로 조회)
	public MarketVO marketSelect(MarketVO marketVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"marketSelect", marketVO);
	}
	
	//market_seq값 증가
	public long marketCount() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"marketCount");
	}
	
	//등록 
	public int marketInsert(MarketVO marketVO) throws Exception{
		return sqlSession.insert(NAMESPACE+"marketInsert", marketVO);
	}
	
	//삭제 - (userNum)deleteAt => sysdate 삽입
	public int marketDelete(MarketVO marketVO) throws Exception{
		return sqlSession.update(NAMESPACE+"marketDelete",marketVO);
	}
	
	//수정
	public int marketUpdate(MarketVO marketVO) throws Exception{
		return sqlSession.update(NAMESPACE+"marketUpdate",marketVO);
	}
	
	//isOpen
	public int isOpen(MarketVO marketVO) throws Exception{
		return sqlSession.update(NAMESPACE+"isOpen", marketVO);
	}
	

}
