package com.food.project.member;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.project.AbstractTestCase;

public class memberTest extends AbstractTestCase {

	@Autowired
	private MemberDAO memberDAO;

	@Test
	public void memberLogin() throws Exception{
		MemberVO memberVO = new MemberVO();
		memberVO.setId("testId");
		memberVO.setPassword("testPW");
		
		memberVO = memberDAO.memberLogin(memberVO);

		assertNotNull(memberVO);
	}
}
