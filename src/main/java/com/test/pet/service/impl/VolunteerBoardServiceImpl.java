package com.test.pet.service.impl;

import com.test.pet.mapper.VolunteerMapper;
import com.test.pet.model.VolunteerBoardDTO;
import com.test.pet.service.VolunteerBoardService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class VolunteerBoardServiceImpl implements VolunteerBoardService {


    private final VolunteerMapper volunteerMapper;

    public VolunteerBoardServiceImpl(
            VolunteerMapper volunteerMapper
    ) {
        this.volunteerMapper = volunteerMapper;
    }


    @Override
    public int getTotalVolunteerCount() {
        return volunteerMapper.countAllVolunteer();
    }

    @Override
    public List<VolunteerBoardDTO> getVolunteerBoardList(int page, int pageSize) {
        int startRow = (page - 1) * pageSize + 1;
        int endRow = page * pageSize;

        Map<String, Object> params = new HashMap<>();
            params.put("startRow", startRow);
            params.put("endRow", endRow);

        return volunteerMapper.list(params);
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