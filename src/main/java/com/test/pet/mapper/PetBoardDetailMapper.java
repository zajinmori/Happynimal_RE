package com.test.pet.mapper;

import com.test.pet.model.PetBoardDetailDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PetBoardDetailMapper {

    PetBoardDetailDTO selectPetBoardDetail(Long id);

}
