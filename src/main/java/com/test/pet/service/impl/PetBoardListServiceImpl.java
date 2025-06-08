package com.test.pet.service.Impl;

import com.amazonaws.services.s3.AmazonS3;
import com.test.pet.mapper.PetBoardDetailMapper;
import com.test.pet.mapper.PetBoardListMapper;
import com.test.pet.mapper.PetImageMapper;
import com.test.pet.model.ImageDTO;
import com.test.pet.model.PetBoardDTO;
import com.test.pet.model.PetBoardDetailDTO;
import com.test.pet.service.PetBoardListService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

@Service
public class PetBoardListServiceImpl implements PetBoardListService {

    private final PetBoardListMapper petBoardListMapper;
    private final PetImageMapper petImageMapper;
    private final PetBoardDetailMapper petBoardDetailMapper;
    private final AmazonS3 amazonS3;
    private final String bucketName;

    public PetBoardListServiceImpl(
            PetBoardListMapper petBoardListMapper,
            PetImageMapper petImageMapper,
            PetBoardDetailMapper petBoardDetailMapper,
            AmazonS3 amazonS3,
            @Value("${aws.bucketName}") String bucketName) {
        this.petBoardListMapper = petBoardListMapper;
        this.petImageMapper = petImageMapper;
        this.petBoardDetailMapper = petBoardDetailMapper;
        this.amazonS3 = amazonS3;
        this.bucketName = bucketName;
    }



    @Override
    public PetBoardDetailDTO getPetBoardDetail(Long id) {
        return petBoardDetailMapper.selectPetBoardDetail(id);
    }


    @Override
    public int getTotalPetCount() {
        return petBoardListMapper.countAllPets();
    }


    @Override
    public List<PetBoardDTO> getPetBoardList(int page, int pageSize) {
        int startRow = (page - 1) * pageSize + 1;
        int endRow = page * pageSize;

        Map<String, Object> params = new HashMap<>();
            params.put("startRow", startRow);
            params.put("endRow", endRow);

        List<PetBoardDTO> petList = petBoardListMapper.selectPetBoardList(params);

        for(PetBoardDTO petBoardDTO : petList){
            List<ImageDTO> images = petImageMapper.selectImagesByPetId(petBoardDTO.getId());
         if(images != null && !images.isEmpty()){
            for(ImageDTO imageDTO : images){
                String key = imageDTO.getImage();//S3에 저장된 파일명
                String url = amazonS3.getUrl(bucketName, key).toString();
                imageDTO.setUrl(url);
            }

            petBoardDTO.setImages(images);


                ImageDTO randomDTO = images.get(new Random().nextInt(images.size()));
                petBoardDTO.setRandomImage(randomDTO.getUrl());
            } else{
             petBoardDTO.setImages(null);
             petBoardDTO.setRandomImage(null);
         }
        }
        return petList;
    }
}
