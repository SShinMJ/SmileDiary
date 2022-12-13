package com.blackshirts.threeblackshirts.service;

import com.blackshirts.threeblackshirts.data.Board;
import com.blackshirts.threeblackshirts.data.Criteria;
import com.blackshirts.threeblackshirts.repository.BoardRep;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);

    private BoardRep b_rep;

    public BoardServiceImpl(BoardRep b_rep) {
        this.b_rep = b_rep;
    }

    @Override
    public List<Board> selectBoard() {
        List<Board> list = b_rep.selectBoard();
        return list;
    }

    @Override
    public void insertBoard(Board board) {
        log.info("insertBoard_BoardService");
        b_rep.insertBoard(board);
    }

    @Override
    public void updateBoard(Board board) {
        log.info("updateBoard_BoardService");
        b_rep.updateBoard(board);
    }

    @Override
    public Board getBoardByBoardId(int board_id) {
        return b_rep.selectBoardByBoardId(board_id);
    }

    @Override
    public void deleteBoard(int board_id) {
        log.info("DeleteBoard_idEqual");
        b_rep.deleteBoard(board_id);
    }

    @Override
    public List<Board> getBoardByUserEmail(String user_email) {
        List<Board> list = b_rep.selectBoardByUserEmail(user_email);
        return list;
    }

    public List<Board> listCriteria(Criteria cri) throws Exception {
        return b_rep.listCriteria(cri);
    }

    // 게시물 총 갯수
    public int countBoard() {
        return b_rep.countBoard();
    }
}