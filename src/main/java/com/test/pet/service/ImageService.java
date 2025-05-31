package com.test.pet.service;

import com.test.pet.model.ImageDTO;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface ImageService {

    ImageDTO saveImage(MultipartFile file) throws IOException;
}
