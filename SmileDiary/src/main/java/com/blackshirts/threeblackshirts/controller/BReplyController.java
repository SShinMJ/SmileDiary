package com.blackshirts.threeblackshirts.controller;

import com.blackshirts.threeblackshirts.data.BReply;
import com.blackshirts.threeblackshirts.data.User;
import com.blackshirts.threeblackshirts.service.BReplyServiceImpl;
import com.blackshirts.threeblackshirts.utility.Utility;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/reply")
public class BReplyController {
    private static final Logger log = LoggerFactory.getLogger(BoardController.class);

    @Autowired
    private BReplyServiceImpl replyService;

    @RequestMapping("/list") //댓글 리스트
    private Map<String, Object> listBReply(Model model, HttpServletRequest request, BReply BReply, @RequestParam int board_id, @RequestParam(value = "page", defaultValue = "1", required = false) int page) throws Exception {
        log.info("ListBReply");

        int now_page = page;// 현재 보고있는 페이지
        int record_per_page = 3; // 한페이지당 보여줄 레코드갯수
        int cnt_list = replyService.cntBReplyByBoardId(board_id);
        // 총 페이지수
        int max_page = (cnt_list + record_per_page - 1) / record_per_page; // (13 + 9) / 10

        // 시작 페이지수
        int start_page = ((page - 1) / 10) * 10 + 1;

        // 마지막 페이지수
        int end_page = start_page + 10 - 1;

        if (end_page > max_page)
            end_page = max_page;

        BReply.setRecord_per_page(record_per_page);
        BReply.setPage(page);
        BReply.setStart_page(start_page);
        BReply.setEnd_page(end_page);
        BReply.setMax_page(max_page);
//        System.out.println("Page :" + page);
//        System.out.println("startPage :" + start_page);
//        System.out.println("endPage : " + end_page);

        // DB에서 가져올 순번-----------------
        int start_num = ((now_page - 1) * record_per_page);

        String now_user_email = Utility.getUserFromCookie(request).getUseremail();
        model.addAttribute("now_user_email", now_user_email);
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("board_id", board_id);
        map.put("start_num", start_num);
        map.put("record_per_page", record_per_page);
        map.put("list", replyService.listCriteriaBReply(map));
        map.put("page", page);
        map.put("start_page", start_page);
        map.put("end_page", end_page);

        map.put("now_user_email", now_user_email);

        return map;
    }

    @RequestMapping("/insert") //댓글 작성
    private String insertBReply(BReply BReply, HttpServletRequest request) throws Exception {
        log.info("InsertBReply");

        User user = Utility.getUserFromCookie(request);
        BReply.setUser_email(user.getUseremail());
        BReply.setReply_datetime(LocalDateTime.now());

        replyService.insertBReply(BReply);

        return "postdetail";
    }

    @RequestMapping("/update") //댓글 수정
    private String updateBReply(@RequestParam int reply_id, BReply reply) throws Exception {
        log.info("UpdateBReply");

        replyService.updateBReply(reply);
        return "postdetail";
    }

    @RequestMapping("/delete") //댓글 삭제
    private String deleteBReply(int reply_id) throws Exception {
        log.info("DeleteBReply");
        replyService.deleteBReply(reply_id);
        return "postdetail";
    }

}