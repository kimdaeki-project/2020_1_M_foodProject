package com.food.project.category;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.food.project.category.CategoryDAO.";
	
	// 카테고리 추가
	public int categoryInsert(CategoryVO categoryVO) {
		
		return sqlSession.insert(NAMESPACE+"categoryInsert", categoryVO);
	}
	
	// 카테고리 리스트 읽어오기
	public List<CategoryVO> categoryList(CategoryVO categoryVO) {
		
		return sqlSession.selectList(NAMESPACE+"categoryList", categoryVO);
	}
	
	// 카테고리 단일 읽어오기
	public CategoryVO categorySelect(CategoryVO categoryVO) {
		
		return sqlSession.selectOne(NAMESPACE+"categorySelect", categoryVO);
	}
	
	// 카테고리 카운트 읽어오기
	public long categoryCount() {
		return sqlSession.selectOne(NAMESPACE+"categoryCount");
	}
	
	// 카테고리 수정
	public int categoryUpdate(CategoryVO categoryVO) {
		
		return sqlSession.update(NAMESPACE+"categoryUpdate", categoryVO);
	}
	
	// 카테고리 삭제
	public int categoryDelete(CategoryVO categoryVO) {
		
		return sqlSession.delete(NAMESPACE+"categoryDelete", categoryVO);
	}
}
