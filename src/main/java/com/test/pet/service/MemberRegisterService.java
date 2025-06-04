package com.test.pet.service;

import com.test.pet.mapper.AdminMapper;
import com.test.pet.mapper.UserMapper;
import com.test.pet.model.AdminDTO;
import com.test.pet.model.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MemberRegisterService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private PasswordEncoder passwordEncoder;


    public void registerByRole(String role, UserDTO user, AdminDTO admin){

        if("ADMIN".equals(role)){
            admin.setId(user.getId());
            admin.setPassword(passwordEncoder.encode(user.getPassword()));
            admin.setName(user.getName());
            admin.setRegdate(user.getRegdate());
            admin.setAddress(user.getAddress());
            admin.setNickname(user.getNickname());
            admin.setTelephone(user.getTelephone());
            admin.setSsn(user.getSsn());
            admin.setEmail(user.getEmail());
            admin.setStatus(0);
            adminMapper.insertAdmin(admin);
        } else {
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            user.setStatus(1);
            userMapper.insertUser(user);
        }

    }


}
