package com.food.project.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.food.project.board.BoardService;
import com.food.project.board.BoardVO;
import com.food.project.util.Pager;

@Service
public class ReviewService implements BoardService{

	@Autowired
	private ReviewDAO reviewDAO;
	
	
	//덧글달기
	public int boardReply(BoardVO boardVO) throws Exception{
		int result = reviewDAO.boardReplyUpdate(boardVO);
		result = reviewDAO.boardReply(boardVO);
		
		return result;
	}
	
	//리뷰리스트 출력
	@Override
	public List<BoardVO> boardList(Pager pager) throws Exception {
		pager.makeRow();
		
		long totalCount = reviewDAO.boardCount(pager);
		pager.makePage(totalCount);
		return reviewDAO.boarList(pager);
	}

	//리뷰 등록
	@Override
	public int boardInsert(BoardVO boardVO) throws Exception {
		return reviewDAO.boardInsert(boardVO);
	}

	//리뷰 삭제
	@Override
	public int boardDelete(BoardVO boardVO) throws Exception {
		return reviewDAO.boardDelete(boardVO);
	}

	//리뷰 수정
	@Override
	public int boardUpdate(BoardVO boardVO) throws Exception {
		return reviewDAO.boardUpdate(boardVO);
	}

	
}
