package com.test.pet.mapper;

import java.util.List;
import java.util.Map;

import com.test.pet.model.VolunteerBoardDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface VolunteerMapper {
	
	int countAllVolunteer();
	public List<VolunteerBoardDTO> list(Map<String, Object> params);

	public int add(VolunteerBoardDTO dto);
	
	VolunteerBoardDTO detail(String seq);

	public int edit(VolunteerBoardDTO dto);

	public int delete(VolunteerBoardDTO dto);


	

}
