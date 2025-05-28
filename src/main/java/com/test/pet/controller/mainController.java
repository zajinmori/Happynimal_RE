package com.test.pet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class mainController {

	//홈 화면 컨트롤러
	@GetMapping("/index.do")
	public String main() {
		
		return "inc/index";
	}
	
}
