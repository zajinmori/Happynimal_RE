package com.test.pet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.test.pet.model.PetResultDTO;

@Mapper
public interface PetResultMapper {
	 List<PetResultDTO> findResultsByScore(@Param("score") int score);
}
