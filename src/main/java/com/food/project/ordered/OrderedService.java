package com.food.project.ordered;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.food.project.orderOption.OrderOptionDAO;
import com.food.project.orderOption.OrderOptionVO;

@Service
public class OrderedService {

	@Autowired
	private OrderedDAO orderedDAO;
	@Autowired
	private OrderOptionDAO orderOptionDAO;
	
	//주문 전체 조회 - SelectList (판매자ID)
	public List<OrderedVO> orderedList(OrderedVO orderedVO) throws Exception{
		
		
		return orderedDAO.orderedList(orderedVO);
	}
	
	//주문 조회 - SelectOne (유저ID or 판매자ID)
	public OrderedVO orderedSelect(OrderedVO orderedVO) throws Exception{
		
		
		return orderedDAO.orderedSelect(orderedVO);
	}
	
	//주문 등록 - 유저ID
	public int orderedInsert(OrderedVO orderedVO) throws Exception{
		//주문번호 sequence 증가
		long orderNum = orderedDAO.orderedCount();
		orderedVO.setOrderNum(orderNum);

		//주문등록
		int result = orderedDAO.orderedInsert(orderedVO);
		
		//주문 옵션등록
		OrderOptionVO orderOptionVO = new OrderOptionVO();
		orderOptionVO.setOrderNum(orderNum);
//		orderOptionVO.setOptionNum();
		result = orderOptionDAO.orderOptionInsert(orderOptionVO);
		
		return result;
	}
	
	//주문 취소 - Update(cancleType : 0.개인변심/ 1.상품문제)
	public int orderedCancle(OrderedVO orderedVO) throws Exception{
		return orderedDAO.orderedCancle(orderedVO);
	}
	
}
