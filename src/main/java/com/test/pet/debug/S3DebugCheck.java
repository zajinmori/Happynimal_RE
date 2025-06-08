package com.test.pet.debug;

import com.amazonaws.services.s3.AmazonS3;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class S3DebugCheck {

    @Autowired(required = false)
    private AmazonS3 s3;

    @PostConstruct
    public void init() {
        System.out.println("s3 가능? :" + (s3 != null ? "LOADED 👍" : "NULL ❌"));
    }
}
