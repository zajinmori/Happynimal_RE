package com.test.pet.controller;

import com.test.pet.model.PetDTO;
import com.test.pet.service.PetBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Date;

@Controller
public class PetBoardController {

	//유기동물 목록 컨트롤러
	@GetMapping("/petboard.do")
	public String petboard() {
		
		return "board/petboard";
	}

	//유기동물 등록 폼 컨트롤러
	@GetMapping("/petadd.do")
	public String petAdd(){

		return "board/petadd";
	}


	@Autowired
	PetBoardService petBoardService;

	//유기동물 등록 제출 컨트롤러
	@PostMapping("/petaddok.do")
	public String petAddOk(@ModelAttribute PetDTO petDTO, @RequestParam("image") MultipartFile[] image) throws IOException {

		System.out.println(petDTO);
		System.out.println("📷 이미지 개수: " + image.length);


		petBoardService.registerPet(petDTO);
		petBoardService.saveImage(petDTO, image);

		return "redirect:/petboard.do";
	}
}
