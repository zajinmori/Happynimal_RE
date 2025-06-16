package com.test.pet.service.impl;

import com.test.pet.mapper.AdoptionApplicationMapper;
import com.test.pet.model.AdoptionApplication;
import com.test.pet.model.AdoptionDetail;
import com.test.pet.model.PetBoardDTO;
import com.test.pet.service.AdoptionService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdoptionServiceImpl implements AdoptionService {

    private final AdoptionApplicationMapper adoptionApplicationMapper;

    public AdoptionServiceImpl(AdoptionApplicationMapper adoptionApplicationMapper) {
        this.adoptionApplicationMapper = adoptionApplicationMapper;
    }


    @Override
    public void saveAdoptionApplication(AdoptionApplication adoptionApplication) {
        adoptionApplicationMapper.insertAdoptionApplication(adoptionApplication);
    }

    @Override
    public int getTotalAdoption() {
        return adoptionApplicationMapper.countAllAdoption();
    }

    @Override
    public List<AdoptionApplication> getAdoptionApplicationList(int page, int pageSize) {
        int startRow = (page - 1) * pageSize + 1;
        int endRow = page * pageSize;

        Map<String, Object> params = new HashMap<>();
        params.put("startRow", startRow);
        params.put("endRow", endRow);

        List<AdoptionApplication> adoptionList = adoptionApplicationMapper.getAllAdoptionApplications(params);

        return adoptionList;
    }

    @Override
    public AdoptionDetail getAdoptionBySeq(Long seq) {
        return adoptionApplicationMapper.detail(seq);
    }
}
