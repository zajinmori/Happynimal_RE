package com.test.pet.mapper;

import com.test.pet.model.ImageDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PetImageDAO {

    int insertImage(ImageDTO imageDTO);
}
