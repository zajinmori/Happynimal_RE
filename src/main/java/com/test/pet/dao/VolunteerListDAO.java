package com.test.pet.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.pet.mapper.VolunteerMapper;
import com.test.pet.model.VolunteerBoardDTO;

@Repository
public class VolunteerListDAO {

	  @Autowired
	    private VolunteerMapper mapper;
	  

	    // 입양 후기 목록 조회
	    public List<VolunteerBoardDTO> getVolunteerList() {
	        return mapper.list();
	    }
	    
	    // 입양 후기 추가
	    public int add(VolunteerBoardDTO dto) {
	        return mapper.add(dto);
	    }

		public VolunteerBoardDTO get(String seq) {
			return mapper.get(seq);
		}

		public int volunteeredit(VolunteerBoardDTO dto) {
			  return mapper.edit(dto);
		}

		public int volunteerdel(VolunteerBoardDTO dto) {
			return mapper.del(dto);
		}


	}