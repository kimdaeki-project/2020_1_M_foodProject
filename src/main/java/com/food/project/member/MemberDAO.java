package com.food.project.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.food.project.member.MemberDAO.";
	
	// memberJoin (Insert)
	public int memberJoin(MemberVO memberVO) throws Exception {

		return sqlSession.insert(NAMESPACE+"memberJoin", memberVO);
	}
	
	// memberLogin (Select One)
	public MemberVO memberLogin(MemberVO memberVO) throws Exception {

		return sqlSession.selectOne(NAMESPACE+"memberLogin", memberVO);
	}
}
