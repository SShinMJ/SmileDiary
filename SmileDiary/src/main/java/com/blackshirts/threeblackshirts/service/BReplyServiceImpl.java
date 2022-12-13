package com.blackshirts.threeblackshirts.service;

import com.blackshirts.threeblackshirts.data.BReply;
import com.blackshirts.threeblackshirts.repository.BReplyRep;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BReplyServiceImpl implements BReplyService {

    private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);

    private BReplyRep commentRep;

    public BReplyServiceImpl(BReplyRep commentRep) {
        this.commentRep = commentRep;
    }

    @Override
    public int cntBReply() throws Exception {
        return commentRep.cntBReply();
    }

    @Override
    public List<BReply> listBReply() throws Exception {
        return commentRep.listBReply();
    }

    @Override
    public List<BReply> listBReplyByBoardId(int post_id) throws Exception {
        return commentRep.listBReplyByBoardId(post_id);
    }

    @Override
    public void insertBReply(BReply BReply) throws Exception {
        log.info("BReplyServiceImpl_Insert");
        commentRep.insertBReply(BReply);
    }

    @Override
    public void updateBReply(BReply BReply) throws Exception {
        commentRep.updateBReply(BReply);
    }

    @Override
    public void deleteBReply(int cmt_id) throws Exception {
        commentRep.deleteBReply(cmt_id);
    }

    @Override
    public List<BReply> listCriteriaBReply(Map map) throws Exception {
        return commentRep.listCriteriaBReply(map);
    }

    @Override
    public int cntBReplyByBoardId(int board_id) {
        return commentRep.cntBReplyByBoardId(board_id);
    }
}
