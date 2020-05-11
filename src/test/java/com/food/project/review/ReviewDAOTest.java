package com.food.project.review;

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
	public void reviewList() throws Exception{
		Pager pager = new Pager();
		pager.setStartRow(1);
		pager.setLastRow(3);
		
		List<BoardVO> list = reviewDAO.boarList(pager);
		
		assertNotNull(list);
		
	
	}

}
