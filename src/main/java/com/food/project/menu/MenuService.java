package com.food.project.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuService {

	@Autowired
	private MenuDAO menuDAO;

	// 메뉴 추가
	public int menuAdd(MenuVO menuVO) throws Exception {

		return menuDAO.menuAdd(menuVO);
	}

	// 메뉴 리스트 읽어오기
	public List<MenuVO> menuList() throws Exception {

		return menuDAO.menuList();
	}

	// 메뉴 단일 읽어오기
	public MenuVO menuSelect(MenuVO menuVO) throws Exception {

		return menuDAO.menuSelect(menuVO);
	}

	// 메뉴 수정
	public int menuUpdate(MenuVO menuVO) throws Exception {

		return menuDAO.menuUpdate(menuVO);
	}

	// 메뉴 삭제
	public int menuDelete(MenuVO menuVO) throws Exception {

		return menuDAO.menuDelete(menuVO);
	}
}
