//package com.test.pet.mapper;
//
//import com.test.pet.model.VolunteerBoardDTO;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.annotation.Rollback;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import org.springframework.transaction.annotation.Transactional;
//import static org.junit.Assert.assertEquals;
//
//
//import java.sql.Date;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {
//        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
//        "classpath:config/mybatis-config.xml"
//})
//@Transactional
//@Rollback(true)
//public class VolunteerBoardMapperTest {
//
//    @Autowired
//    VolunteerMapper volunteerMapper;
//
//    @Test
//    public void testInsertVolunteerBoard() {
//        int before = volunteerMapper.countAllVolunteer();
//
//        VolunteerBoardDTO dto = new VolunteerBoardDTO();
//        dto.setShelterSeq(1);
//        dto.setTitle("테스트 봉사 제목");
//        dto.setContent("테스트 봉사 내용입니다.");
//        dto.setDateVolunteerStart(Date.valueOf("2025-07-01"));
//        dto.setDateVolunteerEnd(Date.valueOf("2025-07-05"));
//        dto.setDateRecruitStart(Date.valueOf("2025-06-10"));
//        dto.setDateRecruitEnd(Date.valueOf("2025-06-30"));
//        dto.setPersonnel(5);
//
//        volunteerMapper.add(dto);
//
//        System.out.println("봉사활동 모집 등록 성공 !!!");
//
//        int after = volunteerMapper.countAllVolunteer();
//
//        assertEquals(before + 1, after);
//    }
//}
