package com.food.project;

import org.junit.Test;

public class test extends AbstractTestCase{

	@Test
	public String convertTimeForm(String time) {
		
		String hour = time.substring(0,2);
		String min = time.substring(2,4);
		
		time = hour + ":" + min;
		
		return time;
	}
}
