package com.test.pet.service.impl;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.Bucket;
import com.test.pet.mapper.PetResultMapper;
import com.test.pet.model.PetResultDTO;
import com.test.pet.service.PetResultService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Random;

@Service
public class PetResultServiceImpl implements PetResultService {

    private final PetResultMapper petResultMapper;
    private final AmazonS3 amazonS3;
    private final String bucketName;

    public PetResultServiceImpl(PetResultMapper petResultMapper, AmazonS3 amazonS3, @Value("${aws.bucketName}") String bucketName) {
        this.petResultMapper = petResultMapper;
        this.amazonS3=amazonS3;
        this.bucketName=bucketName;
    }



    @Override
    public PetResultDTO getRandomResultByScore(int totalScore) {
        List<PetResultDTO> dto = petResultMapper.findResultsByScore(totalScore);
        if (dto != null && !dto.isEmpty()) {
            PetResultDTO selected = dto.get(new Random().nextInt(dto.size()));
            String fileName = selected.getImage();
            String url = null;

            if(fileName != null && !fileName.isBlank()){
                url = amazonS3.getUrl(bucketName, fileName).toString();
            }

            selected.setUrl(url);
            return selected;
        }

        return null;
    }



}
