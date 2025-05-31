package com.test.pet.model;

import lombok.Data;

@Data
public class PetBoardDTO {

    private String id;
    private String name;
    private String shelterId;
    private String shelterName;
    private String image;
    private int age;
    private String gender;
}
