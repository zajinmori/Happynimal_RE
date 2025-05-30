package com.test.pet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PetBoardController {

	//유기동물 목록 컨트롤러
	@GetMapping("/petboard.do")
	public String petBoard() {
		
		return "board/petboard";
	}

}
