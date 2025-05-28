package com.test.pet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class shelterController {

	//보호소 및 동물병원 컨트ㄹ롤러
	@GetMapping("/shelter.do")
	public String shelter() {
		
		return "info/shelterinfo";
	}
	
}
