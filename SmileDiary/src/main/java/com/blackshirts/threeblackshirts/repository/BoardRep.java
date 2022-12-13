package com.blackshirts.threeblackshirts.repository;

import com.blackshirts.threeblackshirts.data.Board;
import com.blackshirts.threeblackshirts.data.Criteria;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardRep {
    List<Board> selectBoard();

    Board selectBoardByBoardId(int board_id);

    List<Board> selectBoardByUserEmail(String user_email);

    void insertBoard(Board board);

    void updateBoard(Board board);

    void deleteBoard(int board_id);

    List<Board> listCriteria(Criteria cri);  // 조건부로 board 가져오기 (paging 처리 시 이용)

    int countBoard(); // 게시물 총 갯수
}