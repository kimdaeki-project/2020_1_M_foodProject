package com.food.project.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	//로그인
	public MemberVO memberLogin(MemberVO memberVO) throws Exception{
		return memberDAO.memberLogin(memberVO);
	}
	
	//멤버값 조회
	public MemberVO memberSelect(MemberVO memberVO) throws Exception{
		return memberDAO.memberSelect(memberVO);
	}
	
	//회원가입
	public int memberJoin(MemberVO memberVO) throws Exception{
		return memberDAO.memberJoin(memberVO);
	}
		
	//아이디 중복검사
	public MemberVO memberIdCheck(MemberVO memberVO) throws Exception{
		return memberDAO.memberIdCheck(memberVO);
	}
		
	//회원탈회
	public int memberDelete(MemberVO memberVO) throws Exception{
		return memberDAO.memberDelete(memberVO);
	}
		
	//회원정보수정
	public int memberUpdate(MemberVO memberVO) throws Exception{
		return memberDAO.memberUpdate(memberVO);
	}
	
}
