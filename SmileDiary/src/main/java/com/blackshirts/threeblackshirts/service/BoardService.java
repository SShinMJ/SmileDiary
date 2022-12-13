package com.blackshirts.threeblackshirts.service;

import com.blackshirts.threeblackshirts.data.Board;
import com.blackshirts.threeblackshirts.data.Criteria;
import com.blackshirts.threeblackshirts.data.User;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface BoardService {
    List<Board> selectBoard();

    Board getBoardByBoardId(int board_id);

    List<Board> getBoardByUserEmail(String user_email);

    void insertBoard(Board board);

    void updateBoard(Board board);

    void deleteBoard(int board_id);

    List<Board> listCriteria(Criteria cri) throws Exception;  // 조건부로 board 가져오기 (paging 처리 시 이용)

    int countBoard(); // 게시물 총 갯수
}