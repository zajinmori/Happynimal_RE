package com.test.pet.service;

import com.test.pet.model.ImageDTO;
import com.test.pet.model.PetDTO;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface PetBoardRegisterService {

    void registerPetWithImages(PetDTO petDTO, MultipartFile[] images) throws IOException;

    void registerPet(PetDTO petDTO);

    ImageDTO saveImage(MultipartFile file) throws IOException;

    void linkPetAndImage(Long petId, Long imageId);
}
