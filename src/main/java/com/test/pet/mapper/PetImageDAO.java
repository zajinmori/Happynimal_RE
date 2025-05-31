package com.test.pet.mapper;

import com.test.pet.model.ImageDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PetImageDAO {

    int insertImage(ImageDTO imageDTO);

    List<ImageDTO> selectImagesByPetId(@Param("petId") Long petId);
}
