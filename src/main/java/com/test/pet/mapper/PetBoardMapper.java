package com.test.pet.mapper;

import com.test.pet.model.ImageDTO;
import com.test.pet.model.PetDTO;
import com.test.pet.model.PetImageDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PetBoardMapper {

    int insertPet(PetDTO petDTO); //성공하면 1반환하게 int로
    int insertImage(ImageDTO imageDTO);
    int insertPetImage(PetImageDTO petImageDTO);
}
