package com.test.pet.controller;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.pet.model.AdoptionApplication;
import com.test.pet.service.AdoptionApplicationService;

/**
 * 입양 신청 처리를 담당하는 컨트롤러 클래스입니다.
 * 신청서 작성 및 제출과 관련된 엔드포인트를 제공합니다.
 */
@Controller
public class AdoptionApplicationController {

    @Autowired
    private AdoptionApplicationService adoptionApplicationService;

    /**
     * 입양 신청서를 작성하는 페이지를 표시합니다.
     *
     * @param model 화면에 전달할 데이터를 담는 모델 객체
     * @return 입양 신청서 작성 화면의 뷰 이름
     */
    @GetMapping("/applicationadoption.do")
    public String showForm(Model model) {
        model.addAttribute("application", new AdoptionApplication());
        return "application/applicationadoption";
    }


    //입양신청서 제출한거 받기
    @PostMapping("/submit")
    public String submitForm(@Valid @ModelAttribute("application") AdoptionApplication application,
                             BindingResult bindingResult,
                             Model model) {

        if (bindingResult.hasErrors()){
            return "application/applicationadoption";
        }

        adoptionApplicationService.saveAdoptionApplication(application);
        return "redirect:/successapplicationadoption";
    }





}
