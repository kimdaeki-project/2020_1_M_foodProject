package com.food.project.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.food.project.member.MemberDAO.";
	
	//location 업데이트
	public int locationUpdate(MemberVO memberVO) throws Exception{
		return sqlSession.update(NAMESPACE+"locationUpdate", memberVO);
	}
	
	//isFoodTruck 업데이트
	public int isFoodTruck(MemberVO memberVO) throws Exception{
		return sqlSession.update(NAMESPACE+"isFoodTruck", memberVO);
	}
	
	//멤버값 조회
	public MemberVO memberSelect(MemberVO memberVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberSelect", memberVO);
	}
	
	//로그인
	public MemberVO memberLogin(MemberVO memberVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"memberLogin", memberVO);
	}

	//회원가입
	public int memberJoin(MemberVO memberVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"memberJoin", memberVO);
	}
	
	//아이디 중복검사
	public MemberVO memberIdCheck(MemberVO memberVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberIdCheck", memberVO);
	}
		
	//회원탈회
	public int memberDelete(MemberVO memberVO) throws Exception{
		return sqlSession.update(NAMESPACE+"memberDelete", memberVO);
	}
	
	//회원정보수정
	public int memberUpdate(MemberVO memberVO) throws Exception{
		return sqlSession.update(NAMESPACE+"memberUpdate", memberVO);
	}
}









