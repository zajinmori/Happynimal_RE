package com.test.pet.service;

import com.test.pet.model.PetResultDTO;

public interface PetResultService {

    PetResultDTO getRandomResultByScore(int totalScore);
}
