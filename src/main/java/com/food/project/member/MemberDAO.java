package com.food.project.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.food.project.member.MemberDAO.";
	
	
	//로그인
	public MemberVO memberLogin(MemberVO memberVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"memberLogin", memberVO);
	}

	//회원가입
	public int memberJoin(MemberVO memberVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"memberJoin", memberVO);
	}
	
	//아이디 중복검사
		
	//회원탈회
		
	//회원정보수정
}