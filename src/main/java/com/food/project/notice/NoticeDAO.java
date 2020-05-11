package com.food.project.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.food.project.notice.NoticeDAO.";
	
	// 공지 추가
	public int noticeInsert(NoticeVO noticeVO) {
		
		return sqlSession.insert(NAMESPACE+"noticeInsert", noticeVO);
	}
	
	// 공지 리스트 읽어오기
	public List<NoticeVO> noticeList() {
		
		return sqlSession.selectList(NAMESPACE+"noticeList");
	}
	
	// 공지 단일 읽어오기
	public NoticeVO noticeSelect(NoticeVO noticeVO) {
		
		return sqlSession.selectOne(NAMESPACE+"noticeSelect", noticeVO);
	}
	
	// 공지 카운트 읽어오기
	public long noticeCount() {
		
		return sqlSession.selectOne(NAMESPACE+"noticeCount");
	}
	
	// 공지 수정
	public int noticeUpdate(NoticeVO noticeVO) {
		
		return sqlSession.update(NAMESPACE+"noticeUpdate", noticeVO);
	}
	
	// 공지 삭제
	public int noticeDelete(NoticeVO noticeVO) {
		
		return sqlSession.delete(NAMESPACE+"noticeDelete", noticeVO);
	}
}
