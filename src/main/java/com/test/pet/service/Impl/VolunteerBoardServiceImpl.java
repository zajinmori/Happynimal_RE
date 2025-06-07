package com.test.pet.service.Impl;

import com.test.pet.mapper.VolunteerMapper;
import com.test.pet.model.VolunteerBoardDTO;
import com.test.pet.service.VolunteerBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VolunteerBoardServiceImpl implements VolunteerBoardService {

    @Autowired
    VolunteerMapper volunteerMapper;

    @Override
    public List<VolunteerBoardDTO> getVolunteerBoardList() {
        return volunteerMapper.list();
    }

    @Override
    public int addVolunteerBoard(VolunteerBoardDTO dto) {
        return volunteerMapper.add(dto);
    }

    @Override
    public VolunteerBoardDTO getVolunteerBoardDetail(String seq) {
        return volunteerMapper.detail(seq);
    }

    @Override
    public int editVolunteerBoard(VolunteerBoardDTO dto) {
        return volunteerMapper.edit(dto);
    }

    @Override
    public int deleteVolunteerBoard(VolunteerBoardDTO dto) {
        return volunteerMapper.delete(dto);
    }
}
