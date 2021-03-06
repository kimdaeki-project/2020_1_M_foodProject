package com.food.project.market;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.food.project.fileInfo.FileInfoDAO;
import com.food.project.fileInfo.FileInfoVO;
import com.food.project.member.MemberDAO;
import com.food.project.member.MemberVO;
import com.food.project.menu.MenuDAO;
import com.food.project.menu.MenuVO;
import com.food.project.util.FileSaver;
import com.food.project.util.Pager;

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
	@Autowired
	private MenuDAO menuDAO;
	
	
	
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
	public List<MarketVO> marketList(Pager pager,MemberVO memberVO) throws Exception{
		//멤버주소값에서 구 찾기
		if(pager.getKind().equals("local")) {
			String address = memberVO.getAddress();
			String[] addressInfo = address.split(" ");
		    for (int i = 0; i < addressInfo.length; i++) {     
		        //검색된 구값 넣어주기
		        if(addressInfo[i].length()-1 == addressInfo[i].lastIndexOf("구")) {
		        	pager.setAddress(addressInfo[i]);
		            break;
		        }
		    }
		}else {
			pager.setAddress("");
		}
			
		pager.setPerPage(16);
		pager.makeRow();
		
		int totalNum = marketDAO.marketTotalNum(pager);
		pager.makePage(totalNum);
		
		return marketDAO.marketList(pager);
	}
	
	//조회 - select One
	public MarketVO marketSelect(MarketVO marketVO) throws Exception{
		return marketDAO.marketSelect(marketVO);
	}
	
	// 조회 - 마켓 총 갯수 확인
	public Long marketQuantity() throws Exception {
		return marketDAO.marketQuantity();
	}
		
	//등록
	public int marketInsert(MarketVO marketVO,MultipartFile[] files,HttpSession session) throws Exception{
		//저장될 실제 경로 설정
		String path = session.getServletContext().getRealPath("/resources/upload/market");
		path="C:\\tm\\workspaceSTS\\foodProject\\src\\main\\webapp\\resources\\upload\\market";
//		path="C:\\Users\\SIST\\Documents\\workspace-sts-3.9.12.RELEASE\\foodProject\\src\\main\\webapp\\resources\\upload\\market";
		System.out.println("path : "+path);
		
		int result = 0;
		
		//marketCount값 증가
		long num = marketDAO. marketCount();
		marketVO.setNum(num);
		
		
		//파일(이미지) 등록
		if(files.length > 0) {
			for (MultipartFile file : files) {
				//1.HDD등록
				String fileName = fileSaver.saveByUtils(file, path);
				marketVO.setThumbImg(fileName);
				
				//file의 num시퀀스값 증가
				long fileNum = fileInfoDAO.fileCount();
				
				FileInfoVO fileInfoVO = new FileInfoVO();
				fileInfoVO.setNum(fileNum);
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
		}
		
		
		//marketDB저장
		result = marketDAO.marketInsert(marketVO);
		
		
		//isFoodTruck 값 변경
		MemberVO memberVO = new MemberVO();
		memberVO.setIsFoodTruck(1);
		memberVO.setNum(marketVO.getUserNum());
		
		result = memberDAO.isFoodTruck(memberVO);
		
		
		
		return result;
	}
	
	//삭제
	public int marketDelete(MarketVO marketVO,FileInfoVO fileInfoVO,HttpSession session) throws Exception{
		String path = session.getServletContext().getRealPath("/resources/upload/market");
		path="C:\\tm\\workspaceSTS\\foodProject\\src\\main\\webapp\\resources\\upload\\market";
//		path="C:\\Users\\SIST\\Documents\\workspace-sts-3.9.12.RELEASE\\foodProject\\src\\main\\webapp\\resources\\upload\\market";
		//파일(이미지) 삭제
		
		//기존 계정에 관련된 파일들을 읽어옴
		List<FileInfoVO> list = fileInfoDAO.fileInfoList(fileInfoVO);
		
		int result = 0;
		for (FileInfoVO fileVO : list) {
			// HDD에서 파일삭제
			String fileName = fileVO.getFileName();
			result = fileSaver.deleteFile(fileName, path);
		}
		
		//DB에서 파일 삭제
		result = fileInfoDAO.fileInfoDelete(fileInfoVO);
		
		
		//멤버 isFoodTruck값 변경
		MemberVO memberVO = new MemberVO();
		memberVO.setNum(marketVO.getUserNum());
		memberVO.setIsFoodTruck(0);
		result = memberDAO.isFoodTruck(memberVO);
		
		//DeleteAt값 변경
		result = marketDAO.marketDelete(marketVO);
		
		return result;
	}
	
	// Geo 업데이트
	public int marketGeoUpdate(MarketVO marketVO) throws Exception {
		return marketDAO.marketGeoUpdate(marketVO);
	}
	
	//수정
	public int marketUpdate(MarketVO marketVO,MultipartFile file,HttpSession session) throws Exception{
		//저장될 실제 경로 설정
		String path = session.getServletContext().getRealPath("/resources/upload/market");
		path="C:\\tm\\workspaceSTS\\foodProject\\src\\main\\webapp\\resources\\upload\\market";
//		path="C:\\Users\\SIST\\Documents\\workspace-sts-3.9.12.RELEASE\\foodProject\\src\\main\\webapp\\resources\\upload\\market";
		System.out.println("path :"+path);
		int result = 0;
		
		
		if(file != null) {
			//파일(이미지) 수정
			//1.HDD등록(기본 HDD에 저장된 파일은 변경시 ajax로 삭제실행(fileInfoService))
			String fileName = fileSaver.saveByUtils(file, path);
			marketVO.setThumbImg(fileName);
			
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
		}
		
		//1.회원정보 수정
		result = marketDAO.marketUpdate(marketVO);
		
		return result;
	}
	

	
	
	
}





















