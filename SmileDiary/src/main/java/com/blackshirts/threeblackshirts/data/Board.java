package com.blackshirts.threeblackshirts.data;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;

@Data
public class Board {

    private int board_id;
    //    private int category_id;
    private String user_email;
    private String board_title;
    private String board_content;
    private LocalDateTime board_datetime;
    private LocalDateTime board_update_datetime;
    private String board_file_name;
    private MultipartFile filenameMF;

    public Board() {
    }

    @JsonCreator
    public Board(@JsonProperty("board_title") String board_title, @JsonProperty("board_content") String board_content) {
        this.board_title = board_title;
        this.board_content = board_content;
    }

    @Override
    public String toString() {
        return "Board{" +
                "board_id='" + board_id + '\'' +
                "user_email='" + user_email + '\'' +
                "board_title='" + board_title + '\'' +
                "board_content='" + board_content + '\'' +
                "board_datetime='" + board_datetime + '\'' +
                "board_update_datetime='" + board_update_datetime + '\'' +
                '}';
    }
}