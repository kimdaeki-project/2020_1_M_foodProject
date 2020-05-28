package com.food.project.market;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.food.project.member.MemberVO;
import com.food.project.util.Pager;

@Repository
public class MarketDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.food.project.market.MarcketDAO.";

	
	//조회 - 마켓명을 이용해 마켓의 주인이름(userName)을 도출
	public List<MarketVO> marketSearch(MarketVO marketVO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"marketSearch", marketVO);
	}
	
	//조회 - SELECT List (주소로 해당 구 안에 있는 모든 푸드트럭의 정보 조회 - address(String)으로 조회)
	public List<MarketVO> marketGuList(MarketVO marketVO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"marketGuList", marketVO);
	}
	
	//pager totalNum
	public int marketTotalNum(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"marketTotalNum",pager);
	}
	
	//조회 - select List (하나의 판매자에 대한 여러 푸드트럭의 정보 - userNum으로 조회)
	public List<MarketVO> marketList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"marketList",pager);
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
	
	// Geo 업데이트
	public int marketGeoUpdate(MarketVO marketVO) throws Exception {
		return sqlSession.update(NAMESPACE+"marketGeoUpdate", marketVO);
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
