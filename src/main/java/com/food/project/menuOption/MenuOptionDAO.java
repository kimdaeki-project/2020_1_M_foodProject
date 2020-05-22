package com.food.project.menuOption;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MenuOptionDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.food.project.menuOption.MenuOptionDAO.";
	
	// 메뉴옵션 생성
	public int menuOptionInsert(MenuOptionVO menuOptionVO) {
		
		return sqlSession.insert(NAMESPACE+"menuOptionInsert", menuOptionVO);
	}
	
	// 메뉴옵션 리스트 읽어오기
	public List<MenuOptionVO> menuOptionList(MenuOptionVO menuOptionVO) {
		
		return sqlSession.selectList(NAMESPACE+"menuOptionList", menuOptionVO);
	}
	
	// 메뉴옵션 단일 읽어오기
	public MenuOptionVO menuOptionSelect(MenuOptionVO menuOptionVO) {
		
		return sqlSession.selectOne(NAMESPACE+"menuOptionSelect", menuOptionVO);
	}
	
	// 메뉴옵션 카운트 읽어오기
	public long menuOptionCount() {
		
		return sqlSession.selectOne(NAMESPACE+"menuOptionCount");
	}
	
	// 메뉴옵션 수정
	public int menuOptionUpdate(MenuOptionVO menuOptionVO) {
		
		return sqlSession.update(NAMESPACE+"menuOptionUpdate", menuOptionVO);
	}
	
	// 메뉴옵션 삭제
	public int menuOptionDelete(long categoryNum) {
		
		return sqlSession.delete(NAMESPACE+"menuOptionDelete", categoryNum);
	}
}
