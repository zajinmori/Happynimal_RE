package com.test.pet.model;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

import java.util.Date;

@Data
public class AdoptionApplication {

	private String idMember;
	private long seqPet;
	private long seq;
	private Date regdate;

	@NotBlank(message = "이름은 필수 입력입니다.")
	private String name;

	@NotBlank(message = "성별은 필수입니다.")
	private String gender;

	@NotBlank(message = "나이는 필수입니다.")
	@Pattern(regexp = "\\d+", message = "나이는 숫자만 입력하세요.")
	private String age;

	@NotBlank(message = "전화번호는 필수입니다.")
	@Pattern(regexp = "010-\\d{4}-\\d{4}", message = "전화번호 형식: 010-1234-5678")
	private String telephone;

	@NotBlank(message = "이메일은 필수입니다.")
	@Email(message = "이메일 형식이 맞지 않습니다.")
	private String email;

	@NotBlank(message = "연락 가능 시간은 필수입니다.")
	private String calltime;

	@NotBlank(message = "지역은 필수입니다.")
	private String region;

	@NotBlank(message = "결혼여부는 필수입니다.")
	private String maritalStatus;

	@NotBlank(message = "직업은 필수입니다.")
	private String job;

	@NotBlank(message = "꼭 내용을 입력해 주세요!")
	private String q1;

	private String q1Memo;

	@NotBlank(message = "꼭 내용을 입력해 주세요!")
	private String q2;

	private String q3Adult;
	private String q3Minor;

	private String q4;

	private String q5;

	@NotBlank(message = "꼭 내용을 입력해 주세요!")
	private String q6Memo;
	private String q7;
	private String q8;

	@NotBlank(message = "꼭 내용을 입력해 주세요!")
	private String q9;

	@NotBlank(message = "꼭 내용을 입력해 주세요!")
	private String q10;

	@NotBlank(message = "꼭 내용을 입력해 주세요!")
	private String q11;

	@NotBlank(message = "꼭 내용을 입력해 주세요!")
	private String q12;
	private String q13;
	
	

	//로그 출력용 ~
	@Override
	public String toString() {
	    return "AdoptionApplication{" +
	            "name='" + name + '\'' +
	            ", gender='" + gender + '\'' +
	            ", age=" + age +
	            ", telephone='" + telephone + '\'' +
	            ", email='" + email + '\'' +
	            ", calltime='" + calltime + '\'' +
	            ", region='" + region + '\'' +
	            ", maritalStatus=" + maritalStatus +
	            ", job='" + job + '\'' +
	            ", q1=" + q1 +
	            ", q1Memo='" + q1Memo + '\'' +
	            ", q2=" + q2 +
	            ", q3Adult=" + q3Adult +
	            ", q3Minor=" + q3Minor +
	            ", q4=" + q4 +
	            ", q5=" + q5 +
	            ", q6Memo='" + q6Memo + '\'' +
	            ", q7=" + q7 +
	            ", q8='" + q8 + '\'' +
	            ", q9='" + q9 + '\'' +
	            ", q10='" + q10 + '\'' +
	            ", q11=" + q11 +
	            ", q12=" + q12 +
	            ", q13='" + q13 + '\'' +
	            '}';
	}

}
