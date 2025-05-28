package com.test.pet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.pet.mapper.AdoptionApplicationMapper;
import com.test.pet.model.AdoptionApplication;

@Service
public class AdoptionApplicationService {

	
	private final AdoptionApplicationMapper adoptionApplicationMapper;
	
	 @Autowired
	    public AdoptionApplicationService(AdoptionApplicationMapper adoptionApplicationMapper) {
	        this.adoptionApplicationMapper = adoptionApplicationMapper;
	    }
	
	
	
	// 입양 신청서 저장하기
    public void saveAdoptionApplication(AdoptionApplication application) {
        adoptionApplicationMapper.insertAdoptionApplication(application);
    }

	
}
