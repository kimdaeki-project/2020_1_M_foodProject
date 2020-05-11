package com.food.project.ordered;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderedDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.food.project.ordered.OrderedDAO.";
	
	//주문 시퀀스 증가
	public long orderedCount() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"orderedCount");
	}
	
	//주문 전체 조회 - SelectList (판매자ID)
	public List<OrderedVO> orderedList(OrderedVO orderedVO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"orderedList",orderedVO);
	}
	
	//주문 조회 - SelectOne (유저ID or 판매자ID)
	public OrderedVO orderedSelect(OrderedVO orderedVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"orderedSelect", orderedVO);
	}
	
	//주문 등록 - 유저ID
	public int orderedInsert(OrderedVO orderedVO) throws Exception{
		return sqlSession.insert(NAMESPACE+"orderedInsert", orderedVO);
	}
	
	//주문 취소 - Update(cancleType : 0.개인변심/ 1.상품문제)
	public int orderedCancle(OrderedVO orderedVO) throws Exception{
		return sqlSession.update(NAMESPACE+"orderedCancle", orderedVO);
	}
	
	
}