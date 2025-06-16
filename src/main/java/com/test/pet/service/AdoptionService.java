package com.test.pet.service;

import com.test.pet.model.AdoptionApplication;
import com.test.pet.model.AdoptionDetail;

import java.util.List;

public interface AdoptionService {

    void saveAdoptionApplication(AdoptionApplication adoptionApplication);
    int getTotalAdoption();
    List<AdoptionApplication> getAdoptionApplicationList(int page, int pageSize);
    AdoptionDetail getAdoptionBySeq(Long seq);
}
