package com.test.pet.model;

import lombok.Data;

@Data
public class PetResultDTO {
	
	private String seq;
	private String minScore;
	private String maxScore;
	private String result;
	private String recommended;
	private String image;
	private String url;


}
