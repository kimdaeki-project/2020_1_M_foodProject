package com.food.project.ordered;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class OrderedService {

	@Autowired
	private OrderedDAO orderedDAO;
	
	
	//리뷰번호로 주문정보 조회
	public OrderedVO orderReviewSelect(OrderedVO orderedVO) throws Exception{
		return orderedDAO.orderReviewSelect(orderedVO);
	}
	
	//주문 전체 조회 - SelectList (판매자ID)
	public List<OrderedVO> orderedList(OrderedVO orderedVO) throws Exception{
		return orderedDAO.orderedList(orderedVO);
	}
	
	//주문 조회 - SelectOne (유저ID or 판매자ID)
	public OrderedVO orderedSelect(OrderedVO orderedVO) throws Exception{
		return orderedDAO.orderedSelect(orderedVO);
	}
	
	//주문 등록 - 유저ID(장바구니에 등록)
	public int orderedInsert(OrderedVO orderedVO) throws Exception{
		//주문번호 sequence 증가
		long orderNum = orderedDAO.orderedCount();
		
		System.out.println("orderNum : "+orderNum);
		//장바구니 기본값 설정
		orderedVO.setNum(orderNum);
		orderedVO.setImp_uid(null);
		orderedVO.setMerchant_uid("Fusulan_Truck_"+orderNum);
		System.out.println("Merchant_uid : "+orderNum);
		orderedVO.setPg(null);
		orderedVO.setPay_method(null);
		orderedVO.setCancleType(2);
		orderedVO.setCancleDetail(null);
		orderedVO.setTimeLag(30);
		orderedVO.setIsOrderChecked(0);
		
		//주문등록
		int result = orderedDAO.orderedInsert(orderedVO);
		
		return result;
	}
	
	//장바구니 목록 전체 삭제(memberNum)
	public int cartDeleteAll(OrderedVO orderedVO) throws Exception{
		return orderedDAO.cartDeleteAll(orderedVO);
	}
	
	//장바구니 낱개 목록 취소(ordered Num)
	public int orderDelete(OrderedVO orderedVO) throws Exception{
		return orderedDAO.orderDelete(orderedVO);
	}
	
	
	//주문 취소 - Update(cancleType : 0.개인변심/ 1.상품문제)
	public int orderedCancle(OrderedVO orderedVO) throws Exception{
		return orderedDAO.orderedCancle(orderedVO);
	}
	
}
