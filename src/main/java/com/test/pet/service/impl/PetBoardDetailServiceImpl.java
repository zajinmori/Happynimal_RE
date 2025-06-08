package com.test.pet.service.Impl;

import com.amazonaws.services.s3.AmazonS3;
import com.test.pet.mapper.PetBoardDetailMapper;
import com.test.pet.mapper.PetImageMapper;
import com.test.pet.model.ImageDTO;
import com.test.pet.model.PetBoardDetailDTO;
import com.test.pet.service.PetBoardDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PetBoardDetailServiceImpl implements PetBoardDetailService {

    @Autowired
    private PetBoardDetailMapper petBoardDetailMapper;
    @Autowired
    private PetImageMapper petImageMapper;
    @Autowired
    private AmazonS3 amazonS3;

    @Value("${aws.bucketName}")
    private String bucketName;

    @Override
    public PetBoardDetailDTO getPetBoardDetail(Long id) {
        System.out.println("getPetBoardDetail() 호출됨, id = " + id);
        PetBoardDetailDTO dto = petBoardDetailMapper.selectPetBoardDetail(id);

        List<ImageDTO> images = petImageMapper.selectImagesByPetId(id);

        for(ImageDTO image : images){
            String url = amazonS3.getUrl(bucketName, image.getImage()).toString();
            image.setUrl(url);
            System.out.println("이미지 키: " + image.getUrl());
            System.out.println("S3 URL: " + url);
        }

        dto.setImages(images);
        return dto;
    }
}
