package com.food.project.orderOption;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderOptionDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.food.project.orderOption.OrderOptionDAO.";
	
	//주문에 대한 옵션 등록
	public int orderOptionInsert(OrderOptionVO orderOptionVO) throws Exception{
		return sqlSession.insert(NAMESPACE+"orderOptionInsert", orderOptionVO);
	}
	
	//주문에 대한 옵션 전체 조회
	public List<OrderOptionVO> orderOptionList(OrderOptionVO orderOptionVO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"orderOptionList",orderOptionVO);
	}
	
	
}
