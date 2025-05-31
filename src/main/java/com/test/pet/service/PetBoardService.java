package com.test.pet.service;

import com.test.pet.mapper.PetBoardMapper;
import com.test.pet.model.ImageDTO;
import com.test.pet.model.PetDTO;
import com.test.pet.model.PetImageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

@Service
public class PetBoardService {

    @Autowired
    private PetBoardMapper petBoardMapper;
    @Autowired
    private ServletContext servletContext;

    public void registerPet(PetDTO petDTO){

        petBoardMapper.insertPet(petDTO);
    }

    public void saveImage(PetDTO petDTO, MultipartFile[] images) throws IOException {

       for(MultipartFile file : images){
           if(!file.isEmpty()){
               //저장
               String filename = UUID.randomUUID() + "_" + file.getOriginalFilename();
               String path = servletContext.getRealPath("/resources/img/");
               file.transferTo(new File(path,filename));

               //image 테이블에 저장
               ImageDTO imageDTO = new ImageDTO();
               imageDTO.setImage(filename);
               petBoardMapper.insertImage(imageDTO);

               //관계 테이블 저장
               PetImageDTO petImageDTO = new PetImageDTO();
               petImageDTO.setSeqPet(petDTO.getId());
               petImageDTO.setSeqImage(imageDTO.getSeq());
               petBoardMapper.insertPetImage(petImageDTO);


           }

       }
    }
}
