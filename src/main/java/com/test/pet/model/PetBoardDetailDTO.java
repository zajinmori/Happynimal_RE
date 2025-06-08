package com.test.pet.model;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class PetBoardDetailDTO {

    private Long id;
    private String name;
    private int age;
    private String gender;
    private String neutered;
    private double weight;
    private String detail;
    private String location;
    private String shelterName;
    private Date regdate;
    private String petInfo;
    private List<ImageDTO> images;

}
