package com.blackshirts.threeblackshirts.data;

import lombok.Data;

@Data
public class Like {
    private int like_id ;
    private String user_email;
    private int board_id;

    public Like(){

    }

    public Like(int like_id, String user_email, int board_id) {
        this.like_id = like_id;
        this.user_email = user_email;
        this.board_id = board_id;
    }

    @Override
    public String toString() {
        return "Like{" +
                "like_id=" + like_id +
                ", user_email='" + user_email + '\'' +
                ", board_id=" + board_id +
                '}';
    }
}
