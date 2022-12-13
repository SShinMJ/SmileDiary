package com.blackshirts.threeblackshirts.service;

import com.blackshirts.threeblackshirts.data.BReply;

import java.util.List;
import java.util.Map;

public interface BReplyService {
    int cntBReply() throws Exception; // 댓글 개수

    List<BReply> listBReply() throws Exception; // 댓글 목록

    List<BReply> listBReplyByBoardId(int board_id) throws Exception;

    int cntBReplyByBoardId(int board_id);

    void insertBReply(BReply BReply) throws Exception; // 댓글 작성

    void updateBReply(BReply BReply) throws Exception; // 댓글 수정

    void deleteBReply(int reply_id) throws Exception; // 댓글 삭제

    List<BReply> listCriteriaBReply(Map map) throws Exception;
}
