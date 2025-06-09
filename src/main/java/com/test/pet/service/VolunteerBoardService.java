package com.test.pet.service;

import com.test.pet.model.VolunteerBoardDTO;

import java.util.List;

public interface VolunteerBoardService {

    int getTotalVolunteerCount();
    List<VolunteerBoardDTO> getVolunteerBoardList(int page, int pageSize);

    int addVolunteerBoard(VolunteerBoardDTO dto);

    VolunteerBoardDTO getVolunteerBoardDetail(String seq);

    int editVolunteerBoard(VolunteerBoardDTO dto);

    int deleteVolunteerBoard(VolunteerBoardDTO dto);
}
