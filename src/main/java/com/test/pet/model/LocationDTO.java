package com.test.pet.model;

import lombok.Data;

@Data
public class LocationDTO {

    private Long id;
    private String name;
    private double latitude;
    private double longitude;
    private String address;
    private String telephone;
}
