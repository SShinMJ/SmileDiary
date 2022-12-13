package com.blackshirts.threeblackshirts.repository;

import com.blackshirts.threeblackshirts.data.Like;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LikeRep {
    int cntBoardLike(int board_id);
    void updateBoardLike(Like like);
    void deleteBoardLike(Like like);
    int checkBoardLike(Like like);
}

