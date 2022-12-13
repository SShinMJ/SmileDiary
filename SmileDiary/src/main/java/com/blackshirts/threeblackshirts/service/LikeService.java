package com.blackshirts.threeblackshirts.service;

import com.blackshirts.threeblackshirts.data.Like;

public interface LikeService {
    int cntBoardLike(int board_id);

    void updateBoardLike(Like like);

    void deleteBoardLike(Like like);

    int checkBoardLike(Like like);

}