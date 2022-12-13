package com.blackshirts.threeblackshirts.data;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class DiarySetting {
    private String user_nickname;
    private int ctg_count;
    private int ctg_diary;
    private int ctg_photo;
    private int ctg_calendar;
    private int ctg_todo;
    private int ctg_guest;
    private int theme_type;
    private String back_color;
    private String cover_color;
    private String page_color;
    private String bookmark_color;
    private String font_type;

    @JsonCreator
    public DiarySetting(@JsonProperty("user_nickname") String user_nickname,
                        @JsonProperty("ctg_count") int ctg_count,
                        @JsonProperty("ctg_diary") int ctg_diary,
                        @JsonProperty("ctg_photo") int ctg_photo,
                        @JsonProperty("ctg_calendar") int ctg_calendar,
                        @JsonProperty("ctg_todo") int ctg_todo,
                        @JsonProperty("ctg_guest") int ctg_guest) {
        this.user_nickname = user_nickname;
        this.ctg_count = ctg_count;
        this.ctg_diary = ctg_diary;
        this.ctg_photo = ctg_photo;
        this.ctg_calendar = ctg_calendar;
        this.ctg_todo = ctg_todo;
        this.ctg_guest = ctg_guest;

    }

    @Override
    public String toString() {
        return "DiarySetting{" +
                "user_nickname='" + user_nickname + '\'' +
                "ctg_count='" + ctg_count + '\'' +
                "ctg_diary='" + ctg_diary + '\'' +
                "ctg_photo='" + ctg_photo + '\'' +
                "ctg_calendar='" + ctg_calendar + '\'' +
                "ctg_todo='" + ctg_todo + '\'' +
                "ctg_guest='" + ctg_guest + '\'' +
                "back_color='" + back_color + '\'' +
                "cover_color='" + cover_color + '\'' +
                "page_color='" + page_color + '\'' +
                "bookmark_color='" + bookmark_color + '\'' +
                '}';
    }

    public int getCtg_count() {
        return ctg_count;
    }
    public void setCtg_diary(int num) {
        this.ctg_diary = num;
    }
    public int getCtg_diary() {
        return ctg_diary;
    }
    public void setCtg_photo(int num) {
        this.ctg_photo = num;
    }
    public int getCtg_photo() {
        return ctg_photo;
    }
    public void setCtg_calendar(int num) {
        this.ctg_calendar = num;
    }
    public int getCtg_calendar() {
        return ctg_calendar;
    }
    public void setCtg_todo(int num) {
        this.ctg_todo = num;
    }
    public int getCtg_todo() {
        return ctg_todo;
    }
    public void setCtg_guest(int num) {
        this.ctg_guest = num;
    }
    public int getCtg_guest() {
        return ctg_guest;
    }
    public int gettheme_type() {
        return theme_type;
    }
    public String getBack_color() {
        return back_color;
    }
    public String getCover_color() {
        return cover_color;
    }
    public String getPage_color() {
        return page_color;
    }
    public String getBookmark_color() {
        return bookmark_color;
    }

}
