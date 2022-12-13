package com.blackshirts.threeblackshirts.data;

public class Criteria {
    private int page; // 보여줄 페이지
    private int per_page_num; // 페이지당 보여줄 페이지수
    private int page_size; // 화면 하단에 출력할 페이지 사이즈
    private String search_keyword; // 검색 키워드
    private String search_type; // 검색 유형

    public int getStartPage() {
        return (this.page - 1) * this.per_page_num;
    }

    public Criteria() {
        this.page = 1; // 사용자가 세팅하지 않은 경우 : default 1
        this.per_page_num = 10; // 페이지당 기본 10개씩 출력하도록
        this.page_size = 10;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        if (page <= 0) {
            // 페이지는 1페이지부터니까, 0보다 작거나 같은값일 경우
            // 무조건 첫번째 페이지로 설정
            this.page = 1;
        } else {
            this.page = page;
        }
    }

    public int getPer_page_num() {
        return per_page_num;
    }

    public void setPer_page_num(int per_page_num) {
        if (per_page_num <= 0 || per_page_num > 100) {
            this.per_page_num = 10;
        } else {
            this.per_page_num = per_page_num;
        }
    }

    @Override
    public String toString() {
        return "Criteria [page=" + page + ", per_page_num=" + per_page_num + "]";
    }

    public int getPage_size() {
        return page_size;
    }

    public void setPage_size(int page_size) {
        this.page_size = page_size;
    }
}
