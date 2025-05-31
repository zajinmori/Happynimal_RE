package com.test.pet.service.impl;

import com.test.pet.mapper.PetBoardDAO;
import com.test.pet.model.PetDTO;
import com.test.pet.service.PetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PetServiceImpl implements PetService {

    @Autowired
    private PetBoardDAO petBoardDAO;

    @Override
    public void registerPet(PetDTO petDTO){
        petBoardDAO.insertPet(petDTO);
    }
}
