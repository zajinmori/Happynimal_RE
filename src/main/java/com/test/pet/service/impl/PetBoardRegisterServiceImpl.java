package com.test.pet.service.impl;

import com.test.pet.model.ImageDTO;
import com.test.pet.model.PetDTO;
import com.test.pet.service.ImageService;
import com.test.pet.service.PetBoardRegisterService;
import com.test.pet.service.PetImageRelationService;
import com.test.pet.service.PetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Service
public class PetBoardRegisterServiceImpl implements PetBoardRegisterService {

    @Autowired
    private PetService petService;
    @Autowired
    private ImageService imageService;
    @Autowired
    private PetImageRelationService petImageRelationService;

    @Override
    public void registerPetWithImages(PetDTO petDTO, MultipartFile[] images) throws IOException{
        petService.registerPet(petDTO);

        for(MultipartFile file : images){
            if(!file.isEmpty()){
                ImageDTO image = imageService.saveImage(file);
                petImageRelationService.linkPetAndImage(petDTO.getId(), image.getSeq());
            }
        }
    }
}
