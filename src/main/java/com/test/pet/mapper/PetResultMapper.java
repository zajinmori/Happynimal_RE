package com.test.pet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.test.pet.model.PetResult;

@Mapper
@Repository
public interface PetResultMapper {
	 List<PetResult> findResultsByScore(@Param("score") int score);
}
