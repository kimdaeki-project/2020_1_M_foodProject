package com.food.project.market;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.food.project.fileInfo.FileInfoDAO;
import com.food.project.fileInfo.FileInfoVO;
import com.food.project.member.MemberDAO;
import com.food.project.member.MemberVO;
import com.food.project.util.FileSaver;

@Service
@Transactional
public class MarketService {

	@Autowired
	private MarketDAO marketDAO;
	@Autowired
	private FileSaver fileSaver;
	@Autowired
	private FileInfoDAO fileInfoDAO;
	@Autowired
	private MemberDAO memberDAO;
	
	
	//marketName을 이용해 userName(MarketVO) 도출
	public List<MarketVO> marketSearch(MarketVO marketVO) throws Exception{
		return marketDAO.marketSearch(marketVO);
	}
	
	
	//isOpen
	public int isOpen(MarketVO marketVO,MemberVO memberVO) throws Exception{
		int result = marketDAO.isOpen(marketVO);
		
		//위치(위도, 경도) 저장하기
		result = memberDAO.locationUpdate(memberVO);
		
		return result;
	}
	//isClose
		public int isOpen2(MarketVO marketVO) throws Exception{
			int result = marketDAO.isOpen(marketVO);
			
			return result;
		}
	
	//조회 - selectList
	public List<MarketVO> marketList() throws Exception{
		return marketDAO.marketList();
	}
	
	//조회 - select One
	public MarketVO marketSelect(MarketVO marketVO) throws Exception{
		return marketDAO.marketSelect(marketVO);
	}
	
	//등록
	public int marketInsert(MarketVO marketVO,MultipartFile[] files,HttpSession session) throws Exception{
		//저장될 실제 경로 설정
		String path = session.getServletContext().getRealPath("/resources/upload/market");
		System.out.println("path : "+path);
		
		//marketCount값 증가
		long num = marketDAO. marketCount();
		marketVO.setNum(num);
		
		
//		System.out.println("userNum: "+marketVO.getUserNum());
		
		//marketDB저장
		marketVO.setThumbImg("");
		int result = marketDAO.marketInsert(marketVO);
		
//		System.out.println("marketinsert result : "+result);
		
		//파일(이미지) 등록
		for (MultipartFile file : files) {
			//1.HDD등록
			String fileName = fileSaver.saveByUtils(file, path);
			//2.DB등록
			
			//file의 num시퀀스값 증가
			num = fileInfoDAO.fileCount();
			
			FileInfoVO fileInfoVO = new FileInfoVO();
			fileInfoVO.setNum(num);
			fileInfoVO.setFileName(fileName);
			
			fileInfoVO.setOriName(file.getOriginalFilename());
			fileInfoVO.setKind(1); //market
			fileInfoVO.setRefNum(num);
			//reviewNum, foodNum은 입력안해서 null값 부여
			
			result = fileInfoDAO.fileInfoInsert(fileInfoVO);
			
			if(result<1) {
				throw new Exception();
			}
		}
		
		//isFoodTruck 값 변경
		MemberVO memberVO = new MemberVO();
		memberVO.setIsFoodTruck(1);
		memberVO.setNum(marketVO.getUserNum());
		
		result = memberDAO.isFoodTruck(memberVO);
		
		return result;
	}
	
	//삭제
	public int marketDelete(MarketVO marketVO,HttpSession session) throws Exception{
		String path = session.getServletContext().getRealPath("/resources/upload/market");
		
		//파일(이미지) 삭제
		
		//기존 계정에 관련된 파일들을 읽어옴
		FileInfoVO fileInfoVO = new FileInfoVO();
		fileInfoVO.setKind(1);
		fileInfoVO.setRefNum(marketVO.getNum());
		List<FileInfoVO> list = fileInfoDAO.fileInfoList(fileInfoVO);
		
		int result = 0;
		for (FileInfoVO fileVO : list) {
			// HDD에서 파일삭제
			String fileName = fileVO.getFileName();
			result = fileSaver.deleteFile(fileName, path);
		}
		//DB에서 삭제
		result = fileInfoDAO.fileInfoDelete(fileInfoVO);
		
		
		return marketDAO.marketDelete(marketVO);
	}
	
	// Geo 업데이트
	public int marketGeoUpdate(MarketVO marketVO) throws Exception {
		return marketDAO.marketGeoUpdate(marketVO);
	}
	
	//수정
	public int marketUpdate(MarketVO marketVO,MultipartFile file,HttpSession session) throws Exception{
		//저장될 실제 경로 설정
		String path = session.getServletContext().getRealPath("/resources/upload/market");
		System.out.println("path :"+path);
		int result = 0;
		
		//파일(이미지) 수정
		//1.HDD등록(기본 HDD에 저장된 파일은 변경시 ajax로 삭제실행(fileInfoService))
		String fileName = fileSaver.saveByUtils(file, path);
		System.out.println("fileName : "+fileName);

		//2.DB등록
		FileInfoVO fileInfoVO = new FileInfoVO();
		
		long num = fileInfoDAO.fileCount();
		fileInfoVO.setNum(num);
		
		fileInfoVO.setFileName(fileName);
		fileInfoVO.setOriName(file.getOriginalFilename());
		System.out.println("oriName:" +file.getOriginalFilename());
		fileInfoVO.setKind(1); //market
		fileInfoVO.setRefNum(marketVO.getNum());
		System.out.println("refNum:" +fileInfoVO.getRefNum());
		//reviewNum, foodNum은 입력안해서 null값 부여

		result = fileInfoDAO.fileInfoInsert(fileInfoVO);
		System.out.println("fileUpdate result : "+result);

		if(result<1) {
			throw new Exception();
		}

		
		//1.회원정보 수정
		marketVO.setThumbImg(fileName);
		result = marketDAO.marketUpdate(marketVO);
		System.out.println("marketUpdate result : "+result);
		
		return result;
	}
	
	
	
}





















