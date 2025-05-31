package com.test.pet.service.impl;

import com.test.pet.mapper.PetImageDAO;
import com.test.pet.model.ImageDTO;
import com.test.pet.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class ImageServiceImpl implements ImageService {

    @Autowired
    private PetImageDAO petImageDAO;

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
        petImageDAO.insertImage(imageDTO);

        return imageDTO;

    }
}
