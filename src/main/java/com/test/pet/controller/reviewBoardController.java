package com.test.pet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class reviewBoardController {

	//입양 후기 게시판
	@GetMapping("/review.do")
	public String review() {
		
		return "board/adoptionreviewboard";
	}
}
