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
	
	// 마켓에서 받은 주문 조회
	public List<OrderedVO> marketOrder(OrderedVO orderedVO) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"marketOrder",orderedVO);
	}
	
	//주문 시퀀스 증가
	public long orderedCount() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"orderedCount");
	}
	
	//주문 전체 조회 - SelectList (판매자ID)
	public List<OrderedVO> orderedList(OrderedVO orderedVO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"orderedList",orderedVO);
	}
	
	// 주문 전체 조회 2 
	public List<OrderedVO> orderedListNot(OrderedVO orderedVO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"orderedListNot",orderedVO);
	}
	
	// 주문 마켓 기준 전체 조회 
	public List<OrderedVO> orderedMarketList(OrderedVO orderedVO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"orderedMarketList", orderedVO);
	}
	
	//주문 조회 - SelectOne (유저ID or 판매자ID)
	public OrderedVO orderedSelect(OrderedVO orderedVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"orderedSelect", orderedVO);
	}
	
	// 주문 조회 - 몇번 주문했는지
	public Long orderedQuantity(OrderedVO orderedVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"orderedQuantity", orderedVO);
	}
	
	//주문 등록 - 유저ID
	public int orderedInsert(OrderedVO orderedVO) throws Exception{
		return sqlSession.insert(NAMESPACE+"orderedInsert", orderedVO);
	}
	
	// 주문 종료
	public int orderedFinish(OrderedVO orderedVO) throws Exception {
		return sqlSession.update(NAMESPACE+"orderedFinish", orderedVO);
	}
		
	
	//장바구니 목록 전체 삭제(memberNum)
	public int cartDeleteAll(OrderedVO orderedVO) throws Exception{
		return sqlSession.delete(NAMESPACE+"cartDeleteAll",orderedVO);
	}
	
	//장바구니 낱개목록 삭제(ordered의 Num)
	public int orderDelete(OrderedVO orderedVO) throws Exception{
		return sqlSession.delete(NAMESPACE+"orderDelete", orderedVO);
	}
	
	// 마켓에서 주문 확인
	public int orderedConfirm(OrderedVO orderedVO) throws Exception {
		return sqlSession.update(NAMESPACE+"orderedConfirm", orderedVO);
	}
	
	// 결제 완료
	public int orderedDone(OrderedVO orderedVO) throws Exception {
		return sqlSession.update(NAMESPACE+"orderedDone", orderedVO);
	}
	
	// isReview 업데이트
	public int orderedIsReviewUpdate(OrderedVO orderedVO) throws Exception {
		return sqlSession.update(NAMESPACE+"orderedIsReviewUpdate", orderedVO);
	}
	
	//주문 취소 - Update(cancleType : 0.개인변심/ 1.상품문제)
	public int orderedCancle(OrderedVO orderedVO) throws Exception{
		return sqlSession.update(NAMESPACE+"orderedCancle", orderedVO);
	}
}
