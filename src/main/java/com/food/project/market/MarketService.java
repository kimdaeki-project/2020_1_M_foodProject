package com.food.project.market;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane.MoveAction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.food.project.util.FileSaver;

@Service
public class MarketService {

	@Autowired
	private MarketDAO marketDAO;
	@Autowired
	private FileSaver fileSaver;
	
	
	//조회 - selectList
	public List<MarketVO> marketList(MarketVO marketVO) throws Exception{
		return marketDAO.marketList(marketVO);
	}
	
	//조회 - select One
	public MarketVO marketSelect(MarketVO marketVO) throws Exception{
		return marketDAO.marketSelect(marketVO);
	}
	
	//등록
	public int marketInsert(MarketVO marketVO,MultipartFile[] files,HttpSession session) throws Exception{
		//저장될 실제 경로 설정
		String path = session.getServletContext().getRealPath("/resources/upload/market");
		
		//marketCount값 증가
		long num = marketDAO. marketCount();
		marketVO.setNum(num);
		
		//marketDB저장
		int result = marketDAO.marketInsert(marketVO);
		
		//파일(이미지) 등록
		for (MultipartFile file : files) {
			//1.HDD등록
			String fileName = fileSaver.saveByUtils(file, path);
			
			//2.DB등록
			
		}
		
		
		
		return result;
	}
	
	//삭제
	public int marketDelete(MarketVO marketVO) throws Exception{
		//파일(이미지) 삭제
		//1.DB삭제
		//2.HDD삭제
		
		return marketDAO.marketDelete(marketVO);
	}
	
	//수정
	public int marketUpdate(MarketVO marketVO,HttpSession session) throws Exception{
		//저장될 실제 경로 설정
		String path = session.getServletContext().getRealPath("/resources/upload/market");
		//1.회원정보 수정
		int result = marketDAO.marketUpdate(marketVO);
		
		//파일(이미지) 수정
		//1.DB값 변경(푸드트럭번호Num)
		//2.HDD삭제 후 삽입
		
		return result;
	}
	
}





















