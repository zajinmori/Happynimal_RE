package com.test.pet.model;

import lombok.Data;

import java.util.List;

@Data
public class PetBoardDTO {

    private Long id;
    private String name;
    private Integer age;
    private String shelterName;

    private List<ImageDTO> images;
    private String randomImage;
}
