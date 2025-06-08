package com.test.pet.mapper;

import com.test.pet.model.PetImageDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PetImageRelationMapper {

    int insertPetImage(PetImageDTO petImageDTO);
}
