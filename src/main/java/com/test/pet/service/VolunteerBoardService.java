package com.test.pet.service;

import com.test.pet.model.VolunteerBoardDTO;

import java.util.List;

public interface VolunteerBoardService {

    List<VolunteerBoardDTO> getVolunteerBoardList();

    int addVolunteerBoard(VolunteerBoardDTO dto);

    VolunteerBoardDTO getVolunteerBoardDetail(String seq);

    int editVolunteerBoard(VolunteerBoardDTO dto);

    int deleteVolunteerBoard(VolunteerBoardDTO dto);
}
