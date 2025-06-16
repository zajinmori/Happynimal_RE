package com.test.pet.mapper;

import com.test.pet.model.LocationDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ShelterLocationMapper {

    List<LocationDTO> getAllLocation();

    LocationDTO getShelterById(int id);
}
