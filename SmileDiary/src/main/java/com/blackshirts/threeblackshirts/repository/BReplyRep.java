package com.blackshirts.threeblackshirts.repository;

import com.blackshirts.threeblackshirts.data.BReply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BReplyRep {
    int cntBReply(); // 댓글 개수

    List<BReply> listBReply(); // 댓글 목록

    List<BReply> listBReplyByBoardId(int board_id);

    int cntBReplyByBoardId(int board_id);

    void insertBReply(BReply BReply); // 댓글 작성

    void updateBReply(BReply BReply); // 댓글 수정

    void deleteBReply(int reply_id); // 댓글 삭제

    List<BReply> listCriteriaBReply(Map map);


}
