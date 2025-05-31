package com.test.pet.service.impl;

import com.test.pet.mapper.PetImageRelationDAO;
import com.test.pet.model.PetImageDTO;
import com.test.pet.service.PetImageRelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PetImageRelationServiceImpl implements PetImageRelationService {

    @Autowired
    private PetImageRelationDAO petImageRelationDAO;

    @Override
    public void linkPetAndImage(Long petId, Long imageId) {
        PetImageDTO petImageDTO = new PetImageDTO();

        petImageDTO.setSeqPet(petId);
        petImageDTO.setSeqImage(imageId);

        petImageRelationDAO.insertPetImage(petImageDTO);

    }
}
