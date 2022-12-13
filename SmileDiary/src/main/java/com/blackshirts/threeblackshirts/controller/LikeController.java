package com.blackshirts.threeblackshirts.controller;

import com.blackshirts.threeblackshirts.data.Like;
import com.blackshirts.threeblackshirts.data.User;
import com.blackshirts.threeblackshirts.service.BoardServiceImpl;
import com.blackshirts.threeblackshirts.service.LikeServiceImpl;
import com.blackshirts.threeblackshirts.utility.Utility;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@RestController
public class LikeController {
    private static final Logger log = LoggerFactory.getLogger(BoardController.class);

    @Autowired
    private BoardServiceImpl boardService;

    @Autowired
    private LikeServiceImpl likeService;

    @PostMapping("/cntlike")
    private String likeCnt(Like like, Model model) throws Exception {

        log.info("like cnt");
        log.info(String.valueOf(like.getBoard_id()));
        log.info(String.valueOf(like.getUser_email()));

        int cnt_like = likeService.cntBoardLike(like.getBoard_id());
        model.addAttribute("b_like", cnt_like);

        return "postdetail";
    }

    @RequestMapping("/likeview")
    private Map<String, Object> likeView(int board_id, HttpServletRequest request) throws Exception {

        User user = Utility.getUserFromCookie(request);
        Like like = new Like();
        like.setBoard_id(board_id);
        like.setUser_email(user.getUseremail());

        // 현재 로그인 유저가 좋아요를 눌렀는지 1 = 누름, 0 = 안누름
        int cnt = likeService.checkBoardLike(like);

        // 이 게시물 자체의 좋아요 개수
        int total_cnt = likeService.cntBoardLike(board_id);

        // Map으로 만들어준다음 return
        Map<String, Object> m = new HashMap<String, Object>();
        m.put("cnt", cnt); // 헷갈리지 않게 이름은 똑같이 설정
        m.put("total_cnt", total_cnt);

        return m;
    }

    @RequestMapping("/updatelike")
    public int update(Like like, HttpServletRequest request) {
        log.info("UPDATE LIKE");
        User user = Utility.getUserFromCookie(request);
        like.setUser_email(user.getUseremail());
        log.info(like.toString());

        likeService.updateBoardLike(like);

        return 1;
//        "redirect:/board/{board_id}";
    }

    @RequestMapping("/deletelike")
    private int likeDelete(int board_id, HttpServletRequest request) throws Exception {
        User user = Utility.getUserFromCookie(request);
        Like like = new Like();
        like.setBoard_id(board_id);
        like.setUser_email(user.getUseremail());

        likeService.deleteBoardLike(like);
        return 1;
    }
}