package com.blackshirts.threeblackshirts.data;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

    private Criteria cri; // page, per_page_num 을 가지고 있음

    private int total_count; // 전체 게시글 수
    private int start_page; // 게시글 번호에 따른 (보여지는)페이지의 시작 번호
    private int end_page; // 게시글 번호에 따른 (보여지는)페이지의 마지막 번호

    private boolean prev; // 이전 버튼을 누를 수 있는 경우/없는 경우 분류를 위함
    private boolean next;

    private int display_page_num = 10; // 화면 하단에 보여지는 페이지의 개수
    private int temp_end_page;

    private void calcData() { // 전체 필드 변수 값들을 계산

        end_page = (int) (Math.ceil(cri.getPage() / (double) display_page_num) * display_page_num);

        start_page = (end_page - display_page_num) + 1;

        int temp_end_page = (int) (Math.ceil(total_count / (double) cri.getPer_page_num()));
        this.temp_end_page = temp_end_page;

        if (end_page > temp_end_page) {
            end_page = temp_end_page;
        }

        prev = start_page != 1;// 1페이지면 이전 누를 수 없게 false
        next = end_page * cri.getPer_page_num() < total_count;

    }

    public String makeQuery(int page) {

        UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
                .queryParam("per_page_num", cri.getPer_page_num()).build();

        return uriComponents.toUriString();
    }

    public Criteria getCri() {
        return cri;
    }

    public void setCri(Criteria cri) {
        this.cri = cri;
    }

    public int getTotal_count() {
        return total_count;
    }

    public void setTotal_count(int total_count) {
        this.total_count = total_count;
        calcData();
    }

    public int getStart_page() {
        return start_page;
    }

    public void setStart_page(int start_page) {
        this.start_page = start_page;
    }

    public int getEnd_page() {
        return end_page;
    }

    public void setEnd_page(int end_page) {
        this.end_page = end_page;
    }

    public boolean isPrev() {
        return prev;
    }

    public void setPrev(boolean prev) {
        this.prev = prev;
    }

    public boolean isNext() {
        return next;
    }

    public void setNext(boolean next) {
        this.next = next;
    }

    public int getDisplay_page_num() {
        return display_page_num;
    }

    public void setDisplay_page_num(int display_page_num) {
        this.display_page_num = display_page_num;
    }

    public int getTemp_end_page() {
        return temp_end_page;
    }

    public void setTemp_end_page(int temp_end_page) {
        this.temp_end_page = temp_end_page;
    }
}
