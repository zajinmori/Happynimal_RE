package com.test.pet.mapper;

import com.test.pet.model.PetBoardDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface PetBoardListMapper {

   /* List<PetBoardDTO> selectAllPetBoard();*/

    int countAllPets();
    List<PetBoardDTO> selectPetBoardList(Map<String, Object> params);
}
