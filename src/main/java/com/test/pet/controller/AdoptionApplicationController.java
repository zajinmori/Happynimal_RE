package com.test.pet.controller;

import com.test.pet.model.PetBoardDetailDTO;
import com.test.pet.security.CustomUserDetails;
import com.test.pet.service.AdoptionService;
import com.test.pet.service.PetBoardDetailService;
import jakarta.validation.Valid;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.test.pet.model.AdoptionApplication;

import javax.servlet.http.HttpSession;

/**
 * 입양 신청 처리를 담당하는 컨트롤러 클래스입니다.
 * 신청서 작성 및 제출과 관련된 엔드포인트를 제공합니다.
 */
@Controller
public class AdoptionApplicationController {


    private final PetBoardDetailService petBoardDetailService;
    private final AdoptionService adoptionService;

    public AdoptionApplicationController(PetBoardDetailService petBoardDetailService,
                                         AdoptionService adoptionService) {
        this.petBoardDetailService = petBoardDetailService;
        this.adoptionService = adoptionService;
    }


    /**
     * 입양 신청서를 작성하는 페이지를 표시합니다.
     *
     * @param model 화면에 전달할 데이터를 담는 모델 객체
     * @return 입양 신청서 작성 화면의 뷰 이름
     */
    @GetMapping("/applicationadoption.do")
    public String showForm(Model model, HttpSession session) {

        Long id = (Long) session.getAttribute("id");
        if(id == null) {
            return "redirect:/petboard.do";
        }

        PetBoardDetailDTO dto = petBoardDetailService.getPetBoardDetail(id);


        model.addAttribute("application", new AdoptionApplication());
        model.addAttribute("petInfo", dto);

        return "application/applicationadoption";
    }


    //입양신청서 제출한거 받기
    @PostMapping("/adoptionAplicationOk.do")
    public String submitForm(@Valid @ModelAttribute("application") AdoptionApplication application,
                             BindingResult bindingResult,
                             Model model, HttpSession session) {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();

        application.setIdMember(userDetails.getUsername());

        Long id = (Long) session.getAttribute("id");
        if(id == null) {
            throw new IllegalStateException("선택된 유기동물이 없습니다.");
        }
        application.setSeqPet(id);


        if (bindingResult.hasErrors()){
            return "application/applicationadoption.do";
        }

        adoptionService.saveAdoptionApplication(application);
        return "redirect:/successapplicationadoption.do";
    }





}
