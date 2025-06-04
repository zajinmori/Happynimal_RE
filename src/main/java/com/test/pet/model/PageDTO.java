package com.test.pet.model;

import lombok.Data;

@Data
public class PageDTO {

    private int currentPage;
    private int pageSize;
    private int totalCount;
    private int totalPage;
    private int startPage;
    private int endPage;

    public PageDTO(int currentPage, int pageSize, int totalCount) {
        this.currentPage = currentPage; //현재 페이지 번호
        this.pageSize = pageSize;       //한 페이지에 보여줄 항목 수
        this.totalCount = totalCount;   //전체 항목 수

        //전체 페이수 계산하는거(53개 항목 / 10개씩 = 5.3 올림해서 6페이지
        this.totalPage = (int)Math.ceil((double)totalCount/pageSize);

        //페이지 번호를 5개씩 묶어서 보여주는 블록 단위임([1][2][3][4][5] 요런식)
        int blockSize = 5;

        //현재 페이지가 7이면 (7-1)/5 = 1 >> 1*5 + 1 =6 >> 시작 페이지가 6이됨
        this.startPage = ((currentPage -1) / blockSize) * blockSize + 1;

        //끝 페이지는 시작 페이지 + 블록 크기 -1, 전체 페이지를 넘지 않도록 제한함
        this.endPage = Math.min(startPage + blockSize-1, totalPage);
    }
}
