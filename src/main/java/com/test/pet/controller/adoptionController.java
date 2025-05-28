package com.test.pet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class adoptionController {

	//유기동물 입양 안내 컨트롤러
	@GetMapping("/adoptioninfo.do")
	public String adoption() {
		
		return "info/adoptioninfo";
	}
}
