package com.food.project.menuOption;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuOptionService {

	@Autowired
	private MenuOptionDAO menuOptionDAO;
	
	
	public int menuOptionInsert(MenuOptionVO menuOptionVO) throws Exception{
			
		long num = menuOptionDAO.menuOptionCount();
		menuOptionVO.setNum(num);
		
		return menuOptionDAO.menuOptionInsert(menuOptionVO);
	}
	
	
	public long menuOptionCount() throws Exception{
		return menuOptionDAO.menuOptionCount();
	}
}
