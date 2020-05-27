package com.food.project.fileInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FileInfoService {

	@Autowired
	private FileInfoDAO fileInfoDAO;
	
	public int fileInfoDelete(FileInfoVO fileInfoVO) throws Exception{
		return fileInfoDAO.fileInfoDelete(fileInfoVO);
	}
	
}
