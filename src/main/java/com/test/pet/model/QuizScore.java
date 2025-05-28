package com.test.pet.model;

import java.util.List;

import lombok.Data;

@Data
public class QuizScore {

	private int q1;
    private int q2;
    private int q3;
    private int q4;
    private int q5;
    private int q6;
    private int q7;
    private int q8;
    private int q9;
    private int q10;

    public int getTotalScore() {
        return q1 + q2 + q3 + q4 + q5 + q6 + q7 + q8 + q9 + q10;
    }
	
}
