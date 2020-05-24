package com.food.project.review;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.project.AbstractTestCase;
import com.food.project.board.BoardVO;
import com.food.project.util.Pager;

public class ReviewDAOTest extends AbstractTestCase{

	@Autowired
	private ReviewDAO reviewDAO; 
	
	
	@Test
	public void reviewUpdate() throws Exception{
		
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setBoardNum(111);
		reviewVO.setContents("돈끼스 맛있엉3");
		reviewVO.setRating(3);
		reviewVO.setFileName("d4d71b01-76f5-443c-b057-de4c0b06b1b6_슬기.png");
		
		int result = reviewDAO.boardUpdate(reviewVO);
		assertEquals(1, result);
	}
	
//	@Test
	public void myReviewList() throws Exception{
		
		List<ReviewVO> list = reviewDAO.myReviewList(29);
		for (ReviewVO reviewVO : list) {
			System.out.println(reviewVO.getContents());
		}
		
		assertNotNull(list);
		
	}
	
//	@Test
	public void reviewList() throws Exception{
		Pager pager = new Pager();
		pager.setStartRow(1);
		pager.setLastRow(3);
		
		List<BoardVO> list = reviewDAO.boarList(pager);

		
		assertNotNull(list);
	}
	
	
//	@Test
	public void reviewInsert() throws Exception{
		
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setMemberNum(8);
		reviewVO.setMarketNum(8);
		reviewVO.setFileName("");
		reviewVO.setContents("contents");
		
		int result = reviewDAO.boardInsert(reviewVO);
		assertEquals(1, result);
	}
	
//	@Test
	public void reviewReplyUpdate() throws Exception{
		
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setBoardNum(9);
		
		int result = reviewDAO.boardReplyUpdate(reviewVO);
		assertEquals(1, result);
	}
	
//	@Test
	public void reviewReply() throws Exception{
		
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setBoardNum(16);
		reviewVO.setMemberNum(8);
		reviewVO.setMarketNum(8);
		reviewVO.setFileName("");
		reviewVO.setContents("contents22");
		
		int result = reviewDAO.boardReply(reviewVO);
		assertEquals(1, result);
	}

}
