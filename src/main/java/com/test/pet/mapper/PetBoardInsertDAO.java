package com.test.pet.mapper;

import com.test.pet.model.PetDTO;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface PetBoardInsertDAO {

    int insertPet(PetDTO petDTO); //성공하면 1반환하게 int로
}
