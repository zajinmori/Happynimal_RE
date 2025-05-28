package com.test.pet.model;

import lombok.Data;

@Data
public class VolunteerBoardDTO {

	private String seq;
	private String idMemberShelter;
	private String idAdmin;
	private String title;
	private String content;
	private String dateVolunteerStart;
	private String dateVolunteerEnd;
    private String dateRecruitStart;
    private String dateRecruitEnd;
    private String regdate;
    private String numCount;
	
}
