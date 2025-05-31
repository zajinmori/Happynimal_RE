package com.test.pet.service.impl;

import com.test.pet.mapper.PetBoardListDAO;
import com.test.pet.mapper.PetImageDAO;
import com.test.pet.model.ImageDTO;
import com.test.pet.model.PetBoardDTO;
import com.test.pet.service.PetBoardListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Random;

@Service
public class PetBoardListServiceImpl implements PetBoardListService {

    @Autowired
    private PetBoardListDAO petBoardListDAO;

    @Autowired
    private PetImageDAO petImageDAO;

    @Override
    public List<PetBoardDTO> getAllPetBoard() {
        List<PetBoardDTO> petList = petBoardListDAO.selectAllPetBoard();

        for(PetBoardDTO petBoardDTO : petList){
            List<ImageDTO> images = petImageDAO.selectImagesByPetId(petBoardDTO.getId());
            petBoardDTO.setImages(images);

            if(images != null && !images.isEmpty()){
                ImageDTO randomDTO = images.get(new Random().nextInt(images.size()));
                petBoardDTO.setRandomImage(randomDTO.getImage());
            }
        }

        return petList;
    }
}
