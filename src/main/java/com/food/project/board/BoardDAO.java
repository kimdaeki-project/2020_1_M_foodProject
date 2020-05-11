package com.food.project.board;

import java.util.List;

import com.food.project.util.Pager;

public interface BoardDAO {
	
	//조회 -전체조회
	public List<BoardVO> boarList(Pager pager) throws Exception;
	
	//등록
	public int boardInsert(BoardVO boardVO) throws Exception;
	
	//삭제
	public int boardDelete(BoardVO boardVO) throws Exception;
	
	//수정
	public int boardUpdate(BoardVO boardVO) throws Exception;
	
}
