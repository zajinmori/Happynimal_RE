package com.test.pet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.test.pet.model.AdoptionApplication;

@Mapper
public interface AdoptionApplicationMapper {

	 //입양 신청서 작성(insert만 하고 반환값이 없기 때문에 void 작성)
	 void insertAdoptionApplication(AdoptionApplication adoptionApplication);

	 //입양 신청서 조회
	 List<AdoptionApplication> getAllAdoptionApplications();

}
