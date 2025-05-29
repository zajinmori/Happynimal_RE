package com.test.pet.mapper;

import com.test.pet.model.UserDTO;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface UserMapper {

    UserDTO findByUserId(String id);

    void insertUser(UserDTO user);

}
