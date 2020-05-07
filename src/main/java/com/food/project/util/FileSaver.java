package com.food.project.util;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileSaver {

	public String saveByUtils(MultipartFile file, String path) throws Exception{
		
		// 폴더가 없다면 생성
		File f = new File(path);
		if(!f.exists()) {
			// 하나의 깊이를 가진 폴더 생성
			//f.mkdir();
			// 하나 이상의 깊이를 가진 폴더일 경우 전부 생성
			f.mkdirs();
		}
		
		// 파일 이름 교체
		String fileName = null;
		fileName = this.makeNameByUUID(file.getOriginalFilename());
	
		// 파일 HDD에 저장 (FileCopyUtils 사용)
		f = new File(f, fileName);
		FileCopyUtils.copy(file.getBytes(), f); 
		
		return fileName;
	}
	
	public String saveByTransfer(MultipartFile file, String path) throws Exception {
		
		// 폴더가 없다면 생성
		File f = new File(path);
		if (!f.exists()) {
			// 하나의 깊이를 가진 폴더 생성
			// f.mkdir();
			// 하나 이상의 깊이를 가진 폴더일 경우 전부 생성
			f.mkdirs();
		}
		
		// 파일 이름 교체
		String fileName = null;
		fileName = this.makeNameByUUID(file.getOriginalFilename());
		//System.out.println(fileName);
		
		// 파일 HDD에 저장
		f = new File(f, fileName);
		file.transferTo(f);
		
		return fileName;
	}
	
	public String saveByStream(MultipartFile file, String path) throws Exception {

		// 폴더가 없다면 생성
		File f = new File(path);
		if(!f.exists()) {
			// 하나의 깊이를 가진 폴더 생성
			//f.mkdir();
			// 하나 이상의 깊이를 가진 폴더일 경우 전부 생성
			f.mkdirs();
		}
		
		// 파일 이름 교체
		String fileName = null;
		fileName = this.makeNameByTime(file.getOriginalFilename());
		System.out.println("fileName" + fileName);
		
		// 파일 HDD에 저장
		f = new File(f, fileName);
		FileOutputStream fs = new FileOutputStream(f);
		fs.write(file.getBytes());
		fs.close();
		
		return fileName;
	}
	
	// 시간값을 사용한 파일명
	private String makeNameByTime(String name) {
		
		Calendar cal = Calendar.getInstance();
		Long timestamp = cal.getTimeInMillis();
		
		String fileName = name.substring(0, name.lastIndexOf("."));
		String extension = name.substring(name.lastIndexOf("."));
		
		return fileName + "_" + timestamp + extension;
	}
	
	// uuid를 사용한 파일명
	public String makeNameByUUID(String name) {
		
		String uuid = UUID.randomUUID().toString();
		String extension = name.substring(name.lastIndexOf("."));
		
		return uuid + extension;
	}
	
	// fileDelete
	public int deleteFile(String fileName, String path)throws Exception{
		File file = new File(path, fileName);
		boolean check=false;
		int result=0;
		if(file.exists()) {
			//System.out.println("save");
			check = file.delete();
		}
		if(check) {
			result=1;
		}
		
		return result;
	}
}
