package com.test.pet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.pet.model.PetResult;
import com.test.pet.model.QuizScore;
import com.test.pet.service.PetResultService;

/**
 * 반려동물 매칭과 관련된 컨트롤러 클래스입니다.
 * 퀴즈 페이지를 보여주고 결과를 계산합니다.
 */
@Controller
public class PetMatchController {

    @Autowired
    private PetResultService petResultService;

    /**
     * 반려동물 매칭 퀴즈 페이지를 표시합니다.
     *
     * @return 퀴즈 페이지 뷰 이름
     */
    @GetMapping("/quiz.do")
    public String showQuiz() {
        return "petquiz/quiz";
    }

    /**
     * 퀴즈 결과를 계산하고 결과 페이지를 표시합니다.
     *
     * @param quizScore 사용자가 입력한 퀴즈 점수 데이터
     * @param model 결과 데이터를 담는 모델 객체
     * @return 결과 페이지 뷰 이름
     */
    @PostMapping("/calculateResult")
    public String calculateResult(@ModelAttribute QuizScore quizScore, Model model) {
        int totalScore = quizScore.getTotalScore();
        PetResult result = petResultService.getRandomResultByScore(totalScore);
        model.addAttribute("result", result);
        return "petquiz/quizresult"; // 결과 페이지
    }
}

