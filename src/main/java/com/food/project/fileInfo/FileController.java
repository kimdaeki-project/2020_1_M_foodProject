package com.food.project.fileInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.project.util.FileSaver;

@Controller
@RequestMapping("fileInfo")
public class FileController {

	@Autowired
	private FileInfoService fileInfoService;
	@Autowired
	private FileSaver fileSaver;
	
	
	@GetMapping("fileDelete")
	@ResponseBody
	public int fileDelete(FileInfoVO fileInfoVO) throws Exception{
		
//		System.out.println("FileInfo C IN");
//		System.out.println("kind : "+fileInfoVO.getKind());
//		System.out.println("refNum : "+fileInfoVO.getRefNum());
		
		int result = fileInfoService.fileInfoDelete(fileInfoVO);
		
		if(result > 0) {
			System.out.println("파일 삭제 성공");
		}else {
			System.out.println("파일 삭제 실패");
		}
		
		
		return result;
	}
 	
}
