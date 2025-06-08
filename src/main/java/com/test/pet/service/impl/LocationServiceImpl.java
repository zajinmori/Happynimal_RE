package com.test.pet.service.Impl;

import com.test.pet.mapper.ShelterLocationMapper;
import com.test.pet.model.LocationDTO;
import com.test.pet.service.LocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LocationServiceImpl implements LocationService {

    @Autowired
    private ShelterLocationMapper shelterLocationMapper;


    @Override
    public List<LocationDTO> getAllLocation() {
        return shelterLocationMapper.getAllLocation();
    }
}
