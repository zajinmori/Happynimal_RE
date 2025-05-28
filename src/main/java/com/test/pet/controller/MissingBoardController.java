package com.test.pet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MissingBoardController {

	//유기동물 발견 ?!
	@GetMapping("/missingboard.do")
	public String missing() {
		
		return "board/missingboard";
	}
	
}
