package com.test.pet.service.impl;

import com.test.pet.mapper.PetBoardInsertMapper;
import com.test.pet.mapper.PetImageMapper;
import com.test.pet.mapper.PetImageRelationMapper;
import com.test.pet.model.ImageDTO;
import com.test.pet.model.PetDTO;
import com.test.pet.model.PetImageDTO;
import com.test.pet.service.PetBoardRegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class PetBoardRegisterServiceImpl implements PetBoardRegisterService {

    @Autowired
    private PetBoardRegisterService petBoardRegisterService;


    @Override
    public void registerPetWithImages(PetDTO petDTO, MultipartFile[] images) throws IOException{
        petBoardRegisterService.registerPet(petDTO);

        for(MultipartFile file : images){
            if(!file.isEmpty()){
                ImageDTO image = petBoardRegisterService.saveImage(file);
                petBoardRegisterService.linkPetAndImage(petDTO.getId(), image.getSeq());
            }
        }
    }



    @Autowired
    private PetBoardInsertMapper petBoardInsertMapper;

    @Override
    public void registerPet(PetDTO petDTO){
        petBoardInsertMapper.insertPet(petDTO);
    }



    @Autowired
    private PetImageMapper petImageMapper;
    @Autowired
    private ServletContext servletContext;

    @Override
    public ImageDTO saveImage(MultipartFile file) throws IOException{

        String filename = UUID.randomUUID() + "_" + file.getOriginalFilename();
        String path = servletContext.getRealPath("/upload");

        System.out.println("저장 경로: " + path);

        File uploadDir = new File(path);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // upload 폴더가 없으면 생성
        }

        file.transferTo(new File(path,filename));

        //image 테이블에 저장
        ImageDTO imageDTO = new ImageDTO();
        imageDTO.setImage(filename);
        petImageMapper.insertImage(imageDTO);

        return imageDTO;

    }

    @Autowired
    private PetImageRelationMapper petImageRelationMapper;

    @Override
    public void linkPetAndImage(Long petId, Long imageId) {
        PetImageDTO petImageDTO = new PetImageDTO();

        petImageDTO.setSeqPet(petId);
        petImageDTO.setSeqImage(imageId);

        petImageRelationMapper.insertPetImage(petImageDTO);

    }


}
