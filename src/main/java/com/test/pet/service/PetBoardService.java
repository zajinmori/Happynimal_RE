package com.test.pet.service;

import com.test.pet.model.PetDTO;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface PetBoardService {

    void registerPetWithImages(PetDTO petDTO, MultipartFile[] images) throws IOException;
}
