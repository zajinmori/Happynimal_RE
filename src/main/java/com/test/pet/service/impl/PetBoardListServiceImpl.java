package com.test.pet.service.impl;

import com.test.pet.mapper.PetBoardDetailMapper;
import com.test.pet.mapper.PetBoardListMapper;
import com.test.pet.mapper.PetImageMapper;
import com.test.pet.model.ImageDTO;
import com.test.pet.model.PetBoardDTO;
import com.test.pet.model.PetBoardDetailDTO;
import com.test.pet.service.PetBoardListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Random;

@Service
public class PetBoardListServiceImpl implements PetBoardListService {

    @Autowired
    private PetBoardListMapper petBoardListMapper;

    @Autowired
    private PetImageMapper petImageMapper;

    @Override
    public List<PetBoardDTO> getAllPetBoard() {
        List<PetBoardDTO> petList = petBoardListMapper.selectAllPetBoard();

        for(PetBoardDTO petBoardDTO : petList){
            List<ImageDTO> images = petImageMapper.selectImagesByPetId(petBoardDTO.getId());
            petBoardDTO.setImages(images);

            if(images != null && !images.isEmpty()){
                ImageDTO randomDTO = images.get(new Random().nextInt(images.size()));
                petBoardDTO.setRandomImage(randomDTO.getImage());
            }
        }

        return petList;
    }


    @Autowired
    private PetBoardDetailMapper petBoardDetailMapper;

    @Override
    public PetBoardDetailDTO getPetBoardDetail(Long id) {
        return petBoardDetailMapper.selectPetBoardDetail(id);
    }
}
