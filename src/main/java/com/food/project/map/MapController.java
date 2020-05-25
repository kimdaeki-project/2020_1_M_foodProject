package com.food.project.map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/map/**")
public class MapController {

	@GetMapping("mapBasic")
	public void mapBasic() {
		
	}
	
	@GetMapping("Sample")
	public void Sample() {
		
	}
	
	@PostMapping("Sample")
	public void Sample(String roadFullAddr) {
		
		System.out.println(roadFullAddr);
	}
	
	@GetMapping("jusoPopup")
	public void jusoPopup() {
		
	}
	
	@PostMapping("jusoPopup")
	public void jusoPopup(String inputYn) {
		
	}
}
