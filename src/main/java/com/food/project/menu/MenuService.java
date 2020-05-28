package com.food.project.menu;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.food.project.fileInfo.FileInfoDAO;
import com.food.project.fileInfo.FileInfoVO;
import com.food.project.util.FileSaver;

@Service
@Transactional
public class MenuService {

	@Autowired
	private MenuDAO menuDAO;
	@Autowired
	private FileSaver fileSaver;
	@Autowired
	private FileInfoDAO fileInfoDAO;
	

	//마켓 메뉴 리스트 조회
	public List<MenuVO> marketMenuList(MenuVO menuVO) throws Exception{
		return menuDAO.marketMenuList(menuVO);
	}
	
	// 메뉴 추가
	public int menuAdd(MenuVO menuVO, MultipartFile[] files, HttpSession session) throws Exception {
		// 저장될 실제 경로 설정
		String path = session.getServletContext().getRealPath("/resources/upload/menu");
		
		path="C:\\tm\\workspaceSTS\\foodProject\\src\\main\\webapp\\resources\\upload\\menu";
//		path="C:\\Users\\SIST\\Documents\\workspace-sts-3.9.12.RELEASE\\foodProject\\src\\main\\webapp\\resources\\upload\\menu"; //신우

		System.out.println("path : " + path);
		
		int result = 0;
		
		// menuCount값 증가(menu의 num값 시퀀스 사용 1증가)
		long num = menuDAO.menuCount();
		menuVO.setNum(num);

		
		//파일(이미지) 등록
		for (MultipartFile file : files) {
			// 1.HDD등록
			String fileName = fileSaver.saveByUtils(file, path);
			// 2.DB등록
			FileInfoVO fileInfoVO = new FileInfoVO();
			long filNum = fileInfoDAO.fileCount();
			
			fileInfoVO.setNum(filNum);
			fileInfoVO.setFileName(fileName);
			System.out.println("fileName:" + fileName);

			fileInfoVO.setOriName(file.getOriginalFilename());
			System.out.println("oriName: " + file.getOriginalFilename());
			fileInfoVO.setKind(3); // menu
			fileInfoVO.setRefNum(num);
			System.out.println("Refnum: " + num);
			
			result = fileInfoDAO.fileInfoInsert(fileInfoVO);

			
			//menuVO에 thumbImg값에 fileName값 삽입
			menuVO.setThumbImg(fileName);
			System.out.println("menuVO.thumbImg : "+fileName);
			
			if (result < 1) {
				throw new Exception();
			}
		}
		
		// menu Table에 insert
		result = menuDAO.menuAdd(menuVO);
		
		return result;
	}

	// 메뉴 리스트 읽어오기
	public List<MenuVO> menuList(MenuVO menuVO) throws Exception {
		return menuDAO.menuList(menuVO);
	}

	// 메뉴 단일 읽어오기
	public MenuVO menuSelect(MenuVO menuVO) throws Exception {
		return menuDAO.menuSelect(menuVO);
	}

	// 메뉴 수정
	public int menuUpdate(MenuVO menuVO, MultipartFile file, HttpSession session) throws Exception {
		//저장될 실제 경로 설정
		String path = session.getServletContext().getRealPath("/resources/upload/menu");

		path="C:\\tm\\workspaceSTS\\foodProject\\src\\main\\webapp\\resources\\upload\\menu";
//		path="C:\\Users\\SIST\\Documents\\workspace-sts-3.9.12.RELEASE\\foodProject\\src\\main\\webapp\\resources\\upload\\menu"; //신우
		
		int result = 0;
		

		
		//파일(이미지) 수정
		if(file != null) {
				//1.HDD등록(기본 HDD에 저장된 파일은 변경시 ajax로 삭제실행(fileInfoService))
				String fileName = fileSaver.saveByUtils(file, path);
				menuVO.setThumbImg(fileName);
				//2.DB등록
				FileInfoVO fileInfoVO = new FileInfoVO();
				long num = fileInfoDAO.fileCount();
				fileInfoVO.setNum(num);
				fileInfoVO.setFileName(fileName);
				fileInfoVO.setOriName(file.getOriginalFilename());
				fileInfoVO.setKind(3); //menu
				fileInfoVO.setRefNum(menuVO.getNum());
				//reviewNum, marketNum은 입력안해서 null값 부여
						
				result = fileInfoDAO.fileInfoInsert(fileInfoVO);
				
				System.out.println("파일 저장결과 : "+result);
				if(result<1) {
					throw new Exception();
				}
		}
		
		result = menuDAO.menuUpdate(menuVO);
		System.out.println("menu Service Result : "+result);
		
		return result;
	}

	// Transaction
	// 메뉴 삭제
	public int menuDelete(MenuVO menuVO, HttpSession session) throws Exception {
		// 경로 읽어오기
		String path = session.getServletContext().getRealPath("/resources/upload/menu");
		path="C:\\tm\\workspaceSTS\\foodProject\\src\\main\\webapp\\resources\\upload\\menu";
//		path="C:\\Users\\SIST\\Documents\\workspace-sts-3.9.12.RELEASE\\foodProject\\src\\main\\webapp\\resources\\upload\\menu"; //신우
	
		// 기존 계정에 관련된 파일들을 읽어옴
		FileInfoVO fileInfoVO = new FileInfoVO();
		fileInfoVO.setKind(3);
		fileInfoVO.setRefNum(menuVO.getNum());
		List<FileInfoVO> list = fileInfoDAO.fileInfoList(fileInfoVO);

		int result = 0;
		for (FileInfoVO fileVO : list) {
			// HDD에서 파일삭제
			String fileName = fileVO.getFileName();
			result = fileSaver.deleteFile(fileName, path);
		}
		
		// fileInfo Table 에서 삭제
		result = fileInfoDAO.fileInfoDelete(fileInfoVO);
		
		// menuDelete 삭제
		return menuDAO.menuDelete(menuVO);
	}
}
