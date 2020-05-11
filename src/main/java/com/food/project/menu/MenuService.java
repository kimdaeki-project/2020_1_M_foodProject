package com.food.project.menu;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.food.project.fileInfo.FileInfoDAO;
import com.food.project.fileInfo.FileInfoVO;
import com.food.project.util.FileSaver;

@Service
public class MenuService {

	@Autowired
	private MenuDAO menuDAO;
	@Autowired
	private FileSaver fileSaver;
	@Autowired
	private FileInfoDAO fileInfoDAO;
	
	// Transaction
	// 메뉴 추가
	public int menuAdd(MenuVO menuVO, MultipartFile[] files, HttpSession session) throws Exception {
		
		// 저장될 실제 경로 설정
		String path = session.getServletContext().getRealPath("/resources/upload/menu");
		System.out.println("path : " + path);
		
		// menuCount값 증가
		long num = menuDAO.menuCount();
		menuVO.setNum(num);

		// menu Table에 insert
		int result = menuDAO.menuAdd(menuVO);
		
		//파일(이미지) 등록
		for (MultipartFile file : files) {
			// 1.HDD등록
			String fileName = fileSaver.saveByUtils(file, path);
			// 2.DB등록
			FileInfoVO fileInfoVO = new FileInfoVO();
			fileInfoVO.setFileName(fileName);
			System.out.println("fileName:" + fileName);

			fileInfoVO.setOriName(file.getOriginalFilename());
			System.out.println("oriName: " + file.getOriginalFilename());
			fileInfoVO.setKind(3); // menu
			fileInfoVO.setMenuNum(num);
			System.out.println("num: " + num);
			// reviewNum, marketNum은 입력안해서 null값 부여

			result = fileInfoDAO.fileInfoInsert(fileInfoVO);
			System.out.println("result: " + result);

			if (result < 1) {
				throw new Exception();
			}
		}
		
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
	public int menuUpdate(MenuVO menuVO, MultipartFile[] files, HttpSession session) throws Exception {

		//저장될 실제 경로 설정
		String path = session.getServletContext().getRealPath("/resources/upload/menu");
				
		//1.회원정보 수정
		int result = menuDAO.menuUpdate(menuVO);
				
		//파일(이미지) 수정
		for (MultipartFile file : files) {
			//1.HDD등록(기본 HDD에 저장된 파일은 변경시 ajax로 삭제실행(fileInfoService))
			String fileName = fileSaver.saveByUtils(file, path);
			//2.DB등록
			FileInfoVO fileInfoVO = new FileInfoVO();
			fileInfoVO.setFileName(fileName);
			fileInfoVO.setOriName(file.getOriginalFilename());
			fileInfoVO.setKind(3); //menu
			fileInfoVO.setMenuNum(menuVO.getNum());
			//reviewNum, marketNum은 입력안해서 null값 부여
					
			result = fileInfoDAO.fileInfoInsert(fileInfoVO);
					
			if(result<1) {
				throw new Exception();
			}
		}
					
		return menuDAO.menuUpdate(menuVO);
	}

	// Transaction
	// 메뉴 삭제
	public int menuDelete(MenuVO menuVO, HttpSession session) throws Exception {

		// 경로 읽어오기
		String path = session.getServletContext().getRealPath("/resources/upload/menu");
		
		// 기존 계정에 관련된 파일들을 읽어옴
		FileInfoVO fileInfoVO = new FileInfoVO();
		fileInfoVO.setKind(3);
		fileInfoVO.setMenuNum(menuVO.getNum());
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
