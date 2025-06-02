package com.test.pet.service.impl;

import com.test.pet.mapper.PetBoardDetailMapper;
import com.test.pet.mapper.PetBoardListMapper;
import com.test.pet.model.PetBoardDetailDTO;
import com.test.pet.service.PetBoardDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PetBoardDetailServiceImpl implements PetBoardDetailService {

    @Autowired
    private PetBoardDetailMapper petBoardDetailMapper;

    @Override
    public PetBoardDetailDTO getPetBoardDetail(Long id) {
        return petBoardDetailMapper.selectPetBoardDetail(id);
    }
}
