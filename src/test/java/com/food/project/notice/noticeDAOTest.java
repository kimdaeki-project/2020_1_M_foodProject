package com.food.project.notice;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.project.AbstractTestCase;


public class noticeDAOTest extends AbstractTestCase {

	@Autowired
	private NoticeDAO noticeDAO;
	
//	@Test
//	public void noticeInsertTest() throws Exception {
//	
//		NoticeVO noticeVO = new NoticeVO();
//		
//		noticeVO.setBoardNum(1);
//		noticeVO.setMemberNum(28);
//		noticeVO.setImageNum(20);
//		noticeVO.setContents("공지사항 내용입니당");
//		noticeVO.setTitle("두둠칫");
//		
//		int result = noticeDAO.noticeInsert(noticeVO);
//		assertEquals(1, result);
//	}
		
//	public List<NoticeVO> noticeListTest() throws Exception {
//	
//		return noticeDAO.noticeList();
//	}
//	
//	@Test
//	public void noticeOptionList() throws Exception {
//		
//		List<NoticeVO> list = this.noticeListTest();
//		assertNotEquals(0, list.size());
//	}
	
//	@Test
//	public void noticeSelectTest() throws Exception {
//	
//		NoticeVO noticeVO = new NoticeVO();
//		noticeVO.setBoardNum(1);
//		noticeVO = noticeDAO.noticeSelect(noticeVO);
//		assertNotNull(noticeVO);
//	}
	
//	@Test
//	public void noticeUpdateTest() throws Exception {
//	
//		NoticeVO noticeVO = new NoticeVO();
//		
//		noticeVO.setBoardNum(1);
//		noticeVO.setImageNum(20);
//		noticeVO.setContents("contents");
//		noticeVO.setTitle("title");
//		
//		int result = noticeDAO.noticeUpdate(noticeVO);
//		assertEquals(1, result);
//	}
	
	@Test
	public void noticeDeleteTest() throws Exception {
	
		NoticeVO noticeVO = new NoticeVO();
		
		noticeVO.setBoardNum(1);
		
		int result = noticeDAO.noticeDelete(noticeVO);
		assertEquals(1, result);
	}
}

