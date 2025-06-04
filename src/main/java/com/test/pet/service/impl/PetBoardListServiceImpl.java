package com.test.pet.service.Impl;

import com.test.pet.mapper.PetBoardDetailMapper;
import com.test.pet.mapper.PetBoardListMapper;
import com.test.pet.mapper.PetImageMapper;
import com.test.pet.model.ImageDTO;
import com.test.pet.model.PetBoardDTO;
import com.test.pet.model.PetBoardDetailDTO;
import com.test.pet.service.PetBoardListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

@Service
public class PetBoardListServiceImpl implements PetBoardListService {

    @Autowired
    private PetBoardListMapper petBoardListMapper;
    @Autowired
    private PetImageMapper petImageMapper;
    @Autowired
    private PetBoardDetailMapper petBoardDetailMapper;


    @Override
    public PetBoardDetailDTO getPetBoardDetail(Long id) {
        return petBoardDetailMapper.selectPetBoardDetail(id);
    }


    @Override
    public int getTotalPetCount() {
        return petBoardListMapper.countAllPets();
    }


    @Override
    public List<PetBoardDTO> getPetBoardList(int page, int pageSize) {
        int startRow = (page - 1) * pageSize + 1;
        int endRow = page * pageSize;

        Map<String, Object> params = new HashMap<>();
            params.put("startRow", startRow);
            params.put("endRow", endRow);

        List<PetBoardDTO> petList = petBoardListMapper.selectPetBoardList(params);

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
}
