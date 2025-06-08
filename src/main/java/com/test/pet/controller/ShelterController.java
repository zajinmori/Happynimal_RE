package com.test.pet.controller;

import com.test.pet.mapper.ShelterLocationMapper;
import com.test.pet.model.LocationDTO;
import com.test.pet.service.LocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ShelterController {

	@Autowired
	private LocationService locationService;

	//보호소 및 동물병원 컨트ㄹ롤러
	@GetMapping("/shelter.do")
	public String shelter(Model model) {
		List<LocationDTO> shelterLocations = locationService.getAllLocation();

		model.addAttribute("shelterLocations", shelterLocations);
		
		return "info/shelterinfo";
	}
	
}
