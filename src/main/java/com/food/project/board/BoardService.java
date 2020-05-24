package com.food.project.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.food.project.util.Pager;

public interface BoardService {
	
	//조회 -전체조회
	public List<BoardVO> boardList(Pager pager) throws Exception;
	
	//등록
	//public int boardInsert(BoardVO boardVO,MultipartFile[] files,HttpSession session) throws Exception;
	
	//삭제
//	public int boardDelete(BoardVO boardVO) throws Exception;
	
	//수정
//	public int boardUpdate(BoardVO boardVO) throws Exception;
	
}
