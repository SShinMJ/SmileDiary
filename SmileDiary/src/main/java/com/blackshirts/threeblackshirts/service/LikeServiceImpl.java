package com.blackshirts.threeblackshirts.service;

import com.blackshirts.threeblackshirts.data.Like;
import com.blackshirts.threeblackshirts.repository.LikeRep;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class LikeServiceImpl implements LikeService {

    private LikeRep likeRep;

    public LikeServiceImpl(LikeRep likeRep) {
        this.likeRep = likeRep;
    }

    @Override
    public int cntBoardLike(int post_id) {
        return likeRep.cntBoardLike(post_id);
    }

    @Override
    public void updateBoardLike(Like like) {
        likeRep.updateBoardLike(like);
    }

    @Override
    public void deleteBoardLike(Like like) {
        likeRep.deleteBoardLike(like);
    }

    @Override
    public int checkBoardLike(Like like) {
        return likeRep.checkBoardLike(like);
    }


}
