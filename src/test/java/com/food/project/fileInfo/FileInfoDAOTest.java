package com.food.project.fileInfo;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.project.AbstractTestCase;

public class FileInfoDAOTest extends AbstractTestCase{

	@Autowired
	private FileInfoDAO fileInfoDAO;
	
	@Test
	public void fileInfoDelete() throws Exception{
		FileInfoVO fileInfoVO = new FileInfoVO();
		fileInfoVO.setKind(1);
		fileInfoVO.setMarketNum(13);
		
		int result = fileInfoDAO.fileInfoDelete(fileInfoVO);
		assertEquals(1, result);
		
	}
	
//	@Test
	public void fileInfoList() throws Exception{
		FileInfoVO fileInfoVO = new FileInfoVO();
		fileInfoVO.setKind(2);
		fileInfoVO.setMarketNum(11);
		
		List<FileInfoVO> list = fileInfoDAO.fileInfoList(fileInfoVO);
		for (FileInfoVO fileInfoVO2 : list) {
			System.out.println(fileInfoVO2.getFileName());
		}
		
		assertNotNull(list);
	}
	
//	@Test
	public void fileInfoUpdate() throws Exception{
		FileInfoVO fileInfoVO = new FileInfoVO();
		fileInfoVO.setFileName("upadte");
		fileInfoVO.setOriName("up");
		fileInfoVO.setKind(1); //market
		fileInfoVO.setMarketNum(12);
		//reviewNum, foodNum은 입력안해서 null값 부여
		
		int result = fileInfoDAO.fileInfoInsert(fileInfoVO);
		
	}
	
//	@Test
	public void fileInfoInsert() throws Exception {
		for (int i = 0; i < 3; i++) {
			FileInfoVO fileInfoVO = new FileInfoVO();
			fileInfoVO.setFileName("fil2");
			fileInfoVO.setOriName("ori");
			fileInfoVO.setKind(1); //market
			fileInfoVO.setMarketNum(13);
			
			int result = fileInfoDAO.fileInfoInsert(fileInfoVO);
			assertEquals(1, result);
			
		}
		
		
	}

}
