package com.test.pet.mapper;

import com.test.pet.model.PetBoardDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PetBoardListDAO {

    List<PetBoardDTO> selectAllPetBoard();
}
