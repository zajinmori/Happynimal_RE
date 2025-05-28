package com.test.pet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 입양 신청 성공 화면을 처리하는 컨트롤러 클래스입니다.
 */
@Controller
public class SuccessApplicationAdoption {

    /**
     * 입양 신청 성공 화면을 표시합니다.
     *
     * @return 성공 화면의 뷰 이름
     */
    @GetMapping("/successapplicationadoption")
    public String SuccessApplicationAdoption() {
        return "application/successapplicationadoption";
    }
}

