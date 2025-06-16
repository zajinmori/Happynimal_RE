package com.test.pet.controller;

import java.util.List;

import com.test.pet.model.LocationDTO;
import com.test.pet.model.PageDTO;
import com.test.pet.service.LocationService;
import com.test.pet.service.VolunteerBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.test.pet.model.VolunteerBoardDTO;


/**
 * 자원봉사 게시판을 관리하는 컨트롤러 클래스입니다.
 * 게시글의 목록 조회, 상세보기, 추가, 수정, 삭제와 같은 기능을 제공합니다.
 */
@Controller
public class VolunteerBoardController {

    @Autowired
    private VolunteerBoardService volunteerBoardService;

    @Autowired
    private LocationService locationService;

    /**
     * 자원봉사 게시판 목록을 표시합니다.
     *
     * @param model 게시판 목록 데이터를 담는 모델 객체
     * @return 게시판 목록 페이지의 뷰 이름
     */
    @GetMapping("/volunteerboard.do")
    public String volunteerboard(@RequestParam(defaultValue = "1") int page, Model model) {
        int pageSize = 10;
        int totalVolunteerCount  = volunteerBoardService.getTotalVolunteerCount();

        List<VolunteerBoardDTO> volunteerList = volunteerBoardService.getVolunteerBoardList(page, pageSize);

        PageDTO pageInfo = new PageDTO(page, pageSize, totalVolunteerCount);

        model.addAttribute("volunteerList", volunteerList);
        model.addAttribute("pageInfo", pageInfo);

        return "board/volunteerboard"; // 목록 페이지
    }

    /**
     * 특정 게시글의 상세 정보를 표시합니다.
     *
     * @param model 게시글 데이터를 담는 모델 객체
     * @param seq 게시글의 고유 번호
     * @return 게시글 상세 페이지의 뷰 이름
     */
    @GetMapping("/volunteerdetail.do")
    public String volunteerdetail(Model model, String seq) {
        VolunteerBoardDTO dto = volunteerBoardService.getVolunteerBoardDetail(seq);
        int shelterId = dto.getShelterSeq();
        LocationDTO locationDTO = locationService.getShelterById(shelterId);
        model.addAttribute("VolunteerListDTO", dto);
        return "board/volunteerdetail";
    }

    /**
     * 게시글 추가 화면을 표시합니다.
     *
     * @param model 화면 데이터를 담는 모델 객체
     * @return 게시글 추가 페이지의 뷰 이름
     */
    @GetMapping("/volunteeradd.do")
    public String volunteeradd(Model model) {
        return "board/volunteeradd"; // 게시글 추가 화면
    }

    /**
     * 새로운 게시글을 추가 처리합니다.
     *
     * @param model 게시판 정보를 담는 모델 객체
     * @param dto 추가할 게시글의 데이터
     * @return 게시판 목록 페이지로 리다이렉트
     */
    @PostMapping("/volunteeraddok")
    public String volunteeraddok(Model model, VolunteerBoardDTO dto) {
        System.out.println(dto);
        int result = volunteerBoardService.addVolunteerBoard(dto);
        return "redirect:/volunteerboard.do";
    }

    /**
     * 특정 게시글의 수정 화면을 표시합니다.
     *
     * @param model 수정할 데이터를 담는 모델 객체
     * @param seq 수정할 게시글의 고유 번호
     * @return 게시글 수정 페이지의 뷰 이름
     */
    @GetMapping("/volunteeredit.do")
    public String volunteeredit(Model model, @RequestParam("seq") String seq) {
        VolunteerBoardDTO dto = volunteerBoardService.getVolunteerBoardDetail(seq);
        model.addAttribute("VolunteerListDTO", dto);
        return "board/volunteeredit";
    }

    /**
     * 수정된 게시글을 처리합니다.
     *
     * @param model 게시글 정보를 담는 모델 객체
     * @param dto 수정된 게시글의 데이터
     * @return 수정된 게시글 상세 페이지로 리다이렉트
     */
    @PostMapping("/volunteereditok.do")
    public String volunteerediteok(Model model, @ModelAttribute VolunteerBoardDTO dto) {
        int result = volunteerBoardService.editVolunteerBoard(dto);
        return "redirect:/volunteerdetail.do?seq=" + dto.getSeq();
    }

    /**
     * 특정 게시글의 삭제 화면을 표시합니다.
     *
     * @param model 삭제할 데이터를 담는 모델 객체
     * @param seq 삭제할 게시글의 고유 번호
     * @param id 게시글 작성자의 아이디
     * @return 게시글 삭제 페이지의 뷰 이름
     */
    @GetMapping("/volunteerdel.do")
    public String volunteerdel(Model model, @RequestParam("seq") String seq, String id) {
        VolunteerBoardDTO dto = volunteerBoardService.getVolunteerBoardDetail(seq);
        model.addAttribute("VolunteerListDTO", dto);
        return "board/volunteerdel";
    }

    /**
     * 게시글 삭제를 처리합니다.
     *
     * @param model 게시판 정보를 담는 모델 객체
     * @param dto 삭제할 게시글의 데이터
     * @return 게시판 목록 페이지로 리다이렉트
     */
    @PostMapping("/volunteerdelok.do")
    public String volunteerdelok(Model model, VolunteerBoardDTO dto) {
        System.out.println("삭제 번호: " + dto.getSeq()); // seq 값 출력
        int result = volunteerBoardService.deleteVolunteerBoard(dto);
        System.out.println("삭제 결과: " + result);
        return "redirect:/volunteerboard.do";
    }
}