package com.food.project.member;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import java.sql.Date;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.project.AbstractTestCase;

public class memberTest extends AbstractTestCase {

	@Autowired
	private MemberDAO memberDAO;

////	@Test
//	public void locationUpadateTest() throws Exception{
//		MemberVO memberVO = new MemberVO();
//		memberVO.setNum(29);
//		memberVO.setLatitude(37.552127);
//		memberVO.setLongitude(126.920294);
//		
//		int result = memberDAO.locationUpdate(memberVO);
//
//		assertEquals(1, result);
//		
//	}
	
	
////	@Test
//	public void memberLogin() throws Exception{
//		MemberVO memberVO = new MemberVO();
//		memberVO.setId("testId");
//		memberVO.setPassword("testPW");
//		
//		memberVO = memberDAO.memberLogin(memberVO);
//
//		assertNotNull(memberVO);
//	}
	
	@Test
	public void memberJoin() throws Exception{
		
		for(int i=1;i<=10;i++) {
			MemberVO memberVO = new MemberVO();
			memberVO.setId("seller_"+i);
			memberVO.setEmail("seller_"+i+"@naver.com");
			memberVO.setPassword("1234");
			memberVO.setName("sellerName_"+i);
			memberVO.setAge(i+20);
			memberVO.setGender(i%2==0?1:0);
			memberVO.setNickName("sellerNick_"+i);
			memberVO.setPhone("01012345678");
			memberVO.setAddress("서울특별시 마포구");
			memberVO.setLatitude(0);
			memberVO.setLongitude(0);
			
			int result = memberDAO.memberJoin(memberVO);
			assertEquals(1, result);
		}
		
	}
////	@Test
//	public void memberDelete() throws Exception{
//		MemberVO memberVO = new MemberVO();
//		memberVO.setId("admin2");
//		
//		int result = memberDAO.memberDelete(memberVO);
//		assertEquals(1, result);
//	}
//	
//	@Test
//	public void memberIdCheck() throws Exception{
//		MemberVO memberVO = new MemberVO();
//		memberVO.setId("admin2");
//		
//		memberVO = memberDAO.memberIdCheck(memberVO);
//		System.out.println(memberVO.getId());
//		assertNotNull(memberVO);
//	}
//	
////	@Test
//	public void memberUpdate() throws Exception{
//		MemberVO memberVO = new MemberVO();
//		memberVO.setId("admin2");
//		memberVO.setPassword("8888");
//		memberVO.setName("tm");
//		memberVO.setPhone("01088884444");
//		memberVO.setNickName("tame");
//		
//		int result = memberDAO.memberUpdate(memberVO);
//		assertEquals(1, result);
//	}

}
























