package com.food.project.fileInfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.food.project.util.FileSaver;

@Service
public class FileInfoService {

	@Autowired
	private FileInfoDAO fileInfoDAO;
	@Autowired
	private FileSaver fileSaver;
	
	public int fileInfoDelete(FileInfoVO fileInfoVO) throws Exception{

		String path ="";
		switch (fileInfoVO.getKind()){
		case 1: //market
			path= "C:\\tm\\workspaceSTS\\foodProject\\src\\main\\webapp\\resources\\upload\\market";
			break;
		case 2: //review
			path= "C:\\tm\\workspaceSTS\\foodProject\\src\\main\\webapp\\resources\\upload\\review";
			break;
		case 3: //menu
			path= "C:\\tm\\workspaceSTS\\foodProject\\src\\main\\webapp\\resources\\upload\\menu";
			break;
		default:
			break;
		}
		
		List<FileInfoVO> fileList = fileInfoDAO.fileInfoList(fileInfoVO);
		
		for (FileInfoVO fileVo : fileList) {
			String fileName = fileVo.getFileName();
			fileSaver.deleteFile(fileName, path);
		}
		
		return fileInfoDAO.fileInfoDelete(fileInfoVO);
	}
	
}
