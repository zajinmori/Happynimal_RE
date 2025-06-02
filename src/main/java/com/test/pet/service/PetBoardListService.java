package com.test.pet.service;


import com.test.pet.model.PetBoardDTO;
import com.test.pet.model.PetBoardDetailDTO;

import java.util.List;

public interface PetBoardListService {

    List<PetBoardDTO> getAllPetBoard();

    PetBoardDetailDTO getPetBoardDetail(Long id);

}
