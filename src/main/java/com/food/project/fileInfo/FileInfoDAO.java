package com.food.project.fileInfo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FileInfoDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.food.project.fileInfo.FileDAO.";
	
	//파일 시퀀스값 증가
	public long fileCount() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"fileCount");
	}
	
	//파일 조회
	public List<FileInfoVO> fileInfoList(FileInfoVO fileInfoVO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"fileInfoList", fileInfoVO);
	}
	
	//파일삽입
	public int fileInfoInsert(FileInfoVO fileInfoVO) throws Exception{
		return sqlSession.insert(NAMESPACE+"fileInfoInsert", fileInfoVO);
	}
	
	//파일삭제
	public int fileInfoDelete(FileInfoVO fileInfoVO) throws Exception{
		return sqlSession.delete(NAMESPACE+"fileInfoDelete", fileInfoVO);
	}
	
}
