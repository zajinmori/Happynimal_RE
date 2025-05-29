package com.test.pet.model;

import lombok.Data;

import java.util.Date;

@Data
public class AdminDTO {

    private String id;
    private String password;
    private String name;
    private String nickname;
    private String ssn;
    private String telephone;
    private String address;
    private String email;
    private Date regdate;
    private int status;
}
