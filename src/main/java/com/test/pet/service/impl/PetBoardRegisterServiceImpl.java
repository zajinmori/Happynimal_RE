package com.test.pet.service.Impl;

import com.amazonaws.services.s3.AmazonS3;
import com.test.pet.mapper.PetBoardInsertMapper;
import com.test.pet.mapper.PetImageMapper;
import com.test.pet.mapper.PetImageRelationMapper;
import com.test.pet.model.ImageDTO;
import com.test.pet.model.PetDTO;
import com.test.pet.model.PetImageDTO;
import com.test.pet.service.PetBoardRegisterService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class PetBoardRegisterServiceImpl implements PetBoardRegisterService {

    private final AmazonS3 amazonS3;
    private final PetBoardInsertMapper petBoardInsertMapper;
    private final PetImageMapper petImageMapper;
    private final PetImageRelationMapper petImageRelationMapper;
    private final ServletContext servletContext;
    private final String bucketName;

    public PetBoardRegisterServiceImpl(
            AmazonS3 amazonS3,
            PetBoardInsertMapper petBoardInsertMapper,
            PetImageMapper petImageMapper,
            PetImageRelationMapper petImageRelationMapper,
            ServletContext servletContext,
            @Value("${aws.bucketName}") String bucketName
    ) {
        this.amazonS3 = amazonS3;
        this.petBoardInsertMapper = petBoardInsertMapper;
        this.petImageMapper = petImageMapper;
        this.petImageRelationMapper = petImageRelationMapper;
        this.servletContext = servletContext;
        this.bucketName = bucketName;
    }



    @Override
    public void registerPetWithImages(PetDTO petDTO, MultipartFile[] images) throws IOException{
        this.registerPet(petDTO);

        for(MultipartFile file : images){
            if(!file.isEmpty()){
                ImageDTO image = this.saveImage(file);
                this.linkPetAndImage(petDTO.getId(), image.getSeq());
            }
        }
    }



    @Override
    public void registerPet(PetDTO petDTO){
        petBoardInsertMapper.insertPet(petDTO);
    }





    @Override
    public ImageDTO saveImage(MultipartFile file) throws IOException{

        System.out.println(bucketName);

        String filename = UUID.randomUUID() + "_" + file.getOriginalFilename();

        File tempFile = File.createTempFile("upload-", null);
        file.transferTo(tempFile);
        amazonS3.putObject(bucketName, filename, tempFile);
        tempFile.delete();

        String fileUrl = amazonS3.getUrl(bucketName, filename).toString();

        //image 테이블에 저장
        ImageDTO imageDTO = new ImageDTO();
        imageDTO.setImage(filename);
        petImageMapper.insertImage(imageDTO);

        return imageDTO;

    }



    @Override
    public void linkPetAndImage(Long petId, Long imageId) {
        PetImageDTO petImageDTO = new PetImageDTO();

        petImageDTO.setSeqPet(petId);
        petImageDTO.setSeqImage(imageId);

        petImageRelationMapper.insertPetImage(petImageDTO);

    }


}
