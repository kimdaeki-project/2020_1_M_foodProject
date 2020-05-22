package com.food.project.menu;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MenuDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.food.project.menu.MenuDAO.";
	
	// 메뉴 추가
	public int menuAdd(MenuVO menuVO) throws Exception {
				
		return sqlSession.insert(NAMESPACE+"menuAdd", menuVO);
	}
	
	// 메뉴 리스트 읽어오기
	public List<MenuVO> menuList(MenuVO menuVO) throws Exception {
		
		System.out.println("asdasdas");
		return sqlSession.selectList(NAMESPACE+"menuList", menuVO);
	}
	
	// 메뉴 단일 읽어오기
	public MenuVO menuSelect(MenuVO menuVO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"menuSelect", menuVO);
	}
	
	// 메뉴 seq 값 가져오기
	public Long menuCount() throws Exception {

		return sqlSession.selectOne(NAMESPACE + "menuCount");
	}
	
	// 메뉴 수정
	public int menuUpdate(MenuVO menuVO) throws Exception {
		return sqlSession.update(NAMESPACE+"menuUpdate", menuVO);
	}
	
	// 메뉴 삭제
	public int menuDelete(MenuVO menuVO) throws Exception {
		
		return sqlSession.delete(NAMESPACE+"menuDelete", menuVO);
	}
}
