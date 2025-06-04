package com.test.pet.controller;

import com.test.pet.model.AdminDTO;
import com.test.pet.model.UserDTO;
import com.test.pet.service.MemberRegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RegisterMemberController {

    @GetMapping("/register.do")
    public String resister() {
        return "auth/register";
    }


    @Autowired
    MemberRegisterService memberRegisterService = new MemberRegisterService();

    @PostMapping("/registerOk.do")
    public String registerOk(@RequestParam String role, UserDTO user, AdminDTO admin){
        memberRegisterService.registerByRole(role, user, admin);
        return "redirect:/login.do";
    }

}
