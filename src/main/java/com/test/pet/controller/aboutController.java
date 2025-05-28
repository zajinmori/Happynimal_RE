package com.test.pet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class aboutController {

	//Happynimal 소개 컨트롤러
	@GetMapping("/about.do")
	public String about() {
		
		return "info/about";
	}

}
