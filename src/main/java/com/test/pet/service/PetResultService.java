package com.test.pet.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.pet.mapper.PetResultMapper;
import com.test.pet.model.PetResult;

@Service
public class PetResultService {

	@Autowired
    private PetResultMapper petResultMapper;

    public PetResult getRandomResultByScore(int totalScore) {
        List<PetResult> results = petResultMapper.findResultsByScore(totalScore);
        if (results != null && !results.isEmpty()) {
            Random random = new Random();
            return results.get(random.nextInt(results.size()));
	        }
	        
	        return null;
	}
	
}
