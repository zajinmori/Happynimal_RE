package com.test.pet.service;


import com.test.pet.model.PetBoardDTO;
import com.test.pet.model.PetBoardDetailDTO;

import java.util.List;

public interface PetBoardListService {


    //상세페이지
    PetBoardDetailDTO getPetBoardDetail(Long id);

    //유기동물 정보, 이미지 + 페이징
    int getTotalPetCount();
    List<PetBoardDTO> getPetBoardList(int page, int pageSize);

}
