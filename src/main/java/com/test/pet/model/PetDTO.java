package com.test.pet.model;

import lombok.Data;

import java.util.Date;

@Data
public class PetDTO {

    private Long id;
    private String name;
    private int age;
    private String gender;
    private String neutered;
    private double weight;
    private String detail;
    private String location;
    private Long seqShelterId;
    private Date regdate;
    private String petInfo;

}
