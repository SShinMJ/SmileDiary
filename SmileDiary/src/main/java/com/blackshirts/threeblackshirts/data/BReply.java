package com.blackshirts.threeblackshirts.data;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class BReply {
    private int reply_id;
    private int board_id;
    private String user_email;
    private String reply_content;
    private int reply_secret;

    private int record_per_page;
    private int page;
    private int start_page;
    private int end_page;
    private int max_page;

    private LocalDateTime reply_datetime;

    public BReply() {
    }

    @JsonCreator
    public BReply(@JsonProperty("board_id") int board_id, @JsonProperty("reply_content") String reply_content, @JsonProperty("reply_secret") int reply_secret) {
        this.board_id = board_id;
        this.reply_content = reply_content;
        this.reply_secret = reply_secret;
    }

//    @JsonCreator
//    public Comment(@JsonProperty("board_id") int board_id, @JsonProperty("reply_content") String reply_content) {
//        this.board_id = board_id;
//        this.reply_content = reply_content;
//    }

    @Override
    public String toString() {
        return "BReply{" +
                "reply_id='" + reply_id + '\'' +
                ", board_id='" + board_id + '\'' +
                ", user_email='" + user_email + '\'' +
                ", reply_content='" + reply_content + '\'' +
                ", reply_secret='" + reply_secret + '\'' +
                ", reply_datetime='" + reply_datetime + '\'' +
                '}';
    }
}