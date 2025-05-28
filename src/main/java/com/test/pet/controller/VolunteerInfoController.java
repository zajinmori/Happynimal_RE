package com.test.pet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


//자원봉사 정보 컨트롤러
@Controller
public class VolunteerInfoController {

	@GetMapping("/volunteerinfo.do")
	public String volunteerinfo() {
		
		return "info/volunteerinfo";
	}
}
