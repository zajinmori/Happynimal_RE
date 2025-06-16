package com.test.pet.model;

import lombok.Data;

import java.sql.Timestamp;
import java.util.Date;

@Data
public class VolunteerBoardDTO {

	private int seq;
	private int shelterSeq;
	private String shelterName;
	private String title;
	private String content;
	private Date dateVolunteerStart;
	private Date dateVolunteerEnd;
    private Date dateRecruitStart;
    private Date dateRecruitEnd;
    private Timestamp regdate;
	private int personnel;
	private double latitude;
	private double longitude;

	
}
