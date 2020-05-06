package com.food.project.member;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.project.AbstractTestCase;

public class memberTest extends AbstractTestCase {

	@Autowired
	private MemberDAO memberDAO;

	@Test
	public void memberSelectTest() throws Exception{

		MemberVO memberVO = new MemberVO();
		memberVO = memberDAO.memberLogin(memberVO);
		System.out.println(memberVO.getId());
		System.out.println(memberVO.getEmail());
		assertNotNull(memberVO);
	}
}
