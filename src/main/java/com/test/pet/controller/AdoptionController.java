package com.test.pet.controller;

import com.test.pet.model.AdoptionApplication;
import com.test.pet.model.AdoptionDetail;
import com.test.pet.model.PageDTO;
import com.test.pet.service.AdoptionService;
import com.test.pet.service.PetBoardDetailService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdoptionController {

	private final PetBoardDetailService petBoardDetailService;
	private final AdoptionService adoptionService;

	public AdoptionController(PetBoardDetailService petBoardDetailService,
							  AdoptionService adoptionService) {
		this.petBoardDetailService = petBoardDetailService;
		this.adoptionService = adoptionService;
	}

	//유기동물 입양 안내 컨트롤러
	@GetMapping("/adoptioninfo.do")
	public String adoption(HttpSession session, Model model) {
		Long id = (Long) session.getAttribute("id");

		System.out.println("Session seq: " + session.getAttribute("id"));

		session.setAttribute("adoptSessionActive", true);
		model.addAttribute("id", id);

		return "info/adoptioninfo";
	}


	@GetMapping("/adoptioncheck.do")
	public String adoptionCheck(@RequestParam(defaultValue = "1") int page, Model model) {

		int pageSize = 10;
		int totalAdoptionCount = adoptionService.getTotalAdoption();

		List<AdoptionApplication> adoptionList = adoptionService.getAdoptionApplicationList(page, pageSize);
		PageDTO pageInfo = new PageDTO(page, pageSize, totalAdoptionCount);

		model.addAttribute("adoptionList", adoptionList);
		model.addAttribute("pageInfo", pageInfo);

		return "application/adoptioncheck";
	}


	@GetMapping("/adoptiondetail.do")
	public String adoptionDetail(@RequestParam("seq")Long seq, Model model) {
		AdoptionDetail adoptionDetail = adoptionService.getAdoptionBySeq(seq);

		if(adoptionDetail == null) {
			throw new IllegalStateException("해당 신청 정보를 찾을 수 없습니다.");
		}

		model.addAttribute("adoptionDetail", adoptionDetail);
		return "application/adoptiondetail";
	}
}
