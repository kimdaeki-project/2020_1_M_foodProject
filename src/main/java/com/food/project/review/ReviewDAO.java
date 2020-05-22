package com.food.project.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.food.project.board.BoardDAO;
import com.food.project.board.BoardVO;
import com.food.project.market.MarketVO;
import com.food.project.util.Pager;

@Repository
public class ReviewDAO implements BoardDAO{

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.food.project.review.ReviewDAO.";
	
	
	
	//이미지가 존재하는 리뷰의 전체 목록 조회
	public List<ReviewVO> imgTatalList(MarketVO marketVO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"imgTatalList", marketVO);
	}
	
	//boardNum으로 하나의 리뷰 조회
	public ReviewVO reviewSelect(ReviewVO reviewVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"reviewSelect", reviewVO);
	}
	
	//한 사용자가 작성한 리뷰 목록 출력
	public List<ReviewVO> myReviewList(long memberNum) throws Exception{
		return sqlSession.selectList(NAMESPACE+"myReviewList",memberNum);
	}
	
	//한 마켓의 총 평점 계산
	public Double marketAvg(long marketNum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"marketAvg", marketNum);
	}
	
	//한 마켓의 총 리뷰개수 
	public int marketReviewCount(long marketNum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"marketReviewCount", marketNum);
	}
	
	//reiew seq 증가
	public long boardSeq() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"boardSeq");
	}
	
	
	//board개수 파악
	public long boardCount(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"boardCount",pager);
	}
	
	//replyUpdate
	public int boardReplyUpdate(BoardVO boardVO) throws Exception{
		return sqlSession.update(NAMESPACE+"boardReplyUpdate", boardVO);
	}
	
	//replay
	public int boardReply(BoardVO boardVO) throws Exception{
		return sqlSession.insert(NAMESPACE+"boardReply", boardVO);
	}
	
	//조회 - 전체 리스트
	@Override
	public List<BoardVO> boarList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"baordList",pager);
	}

	//리뷰 등록
	@Override
	public int boardInsert(BoardVO boardVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"boardInsert",boardVO);
	}

	//리뷰 삭제
	@Override
	public int boardDelete(BoardVO boardVO) throws Exception {
		return sqlSession.delete(NAMESPACE+"boardDelete", boardVO);
	}

	//리뷰 갱신
	@Override
	public int boardUpdate(BoardVO boardVO) throws Exception {
		return sqlSession.update(NAMESPACE+"boardUpdate", boardVO);
	}

	
}
