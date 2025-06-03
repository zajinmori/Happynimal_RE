package com.test.pet.controller;

import com.test.pet.model.PageDTO;
import com.test.pet.model.PetBoardDTO;
import com.test.pet.model.PetBoardDetailDTO;
import com.test.pet.model.PetDTO;
import com.test.pet.service.PetBoardDetailService;
import com.test.pet.service.PetBoardListService;
import com.test.pet.service.PetBoardRegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
public class PetBoardController {

	@Autowired
	PetBoardListService petBoardListService;

	@Autowired
	PetBoardRegisterService petBoardRegisterService;


	//유기동물 목록 컨트롤러
	@GetMapping("/petboard.do")
	public String petBoardList(@RequestParam(defaultValue = "1") int page, Model model) {
		int pageSize = 12;
		int totalPetCount = petBoardListService.getTotalPetCount();

		List<PetBoardDTO> petList = petBoardListService.getPetBoardList(page, pageSize);

		PageDTO pageInfo = new PageDTO(page, pageSize, totalPetCount);

		model.addAttribute("petList", petList);
		model.addAttribute("pageInfo", pageInfo);

		return "board/petboard";
	}

	//유기동물 등록 폼 컨트롤러
	@GetMapping("/petadd.do")
	public String petAdd() {

		return "board/petadd";
	}



	//유기동물 등록 제출 컨트롤러
	@PostMapping("/petaddok.do")
	@ResponseBody
	public ResponseEntity<String> petAddOk(
			@RequestParam("seqShelterId") Long seqShelterId,
			@RequestParam("location") String location,
			@RequestParam("name") String name,
			@RequestParam("petInfo") String petInfo,
			@RequestParam("gender") String gender,
			@RequestParam("neutered") String neutered,
			@RequestParam("age") int age,
			@RequestParam("weight") double weight,
			@RequestParam("detail") String detail,
			@RequestParam(value = "images", required = false) MultipartFile[] images
	) throws IOException {

		// DTO 수동 생성
		PetDTO petDTO = new PetDTO();
		petDTO.setSeqShelterId(seqShelterId);
		petDTO.setLocation(location);
		petDTO.setName(name);
		petDTO.setPetInfo(petInfo);
		petDTO.setGender(gender);
		petDTO.setNeutered(neutered);
		petDTO.setAge(age);
		petDTO.setWeight(weight);
		petDTO.setDetail(detail);

		System.out.println("등록된 정보: " + petDTO);
		System.out.println("이미지 개수: " + (images != null ? images.length : 0));

		petBoardRegisterService.registerPetWithImages(petDTO, images);


		return ResponseEntity.ok("등록 성공");
	}



	@GetMapping("/petdetail.do")
	public String petDetail(@RequestParam("seq") Long id, Model model) {
		PetBoardDetailDTO dto = petBoardListService.getPetBoardDetail(id);
		model.addAttribute("pet", dto);
		return "board/petboarddetail";
	}
}