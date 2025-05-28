package com.test.pet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PetBoardController {

	//유기동물 목록 컨트롤러
	@GetMapping("/petboard.do")
	public String petboard() {
		
		return "board/petboard";
	}
}
