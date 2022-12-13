package com.blackshirts.threeblackshirts.controller;

import com.blackshirts.threeblackshirts.data.*;
import com.blackshirts.threeblackshirts.service.BoardServiceImpl;
import com.blackshirts.threeblackshirts.service.BReplyServiceImpl;
import com.blackshirts.threeblackshirts.service.FirebaseFileServiceImpl;
import com.blackshirts.threeblackshirts.service.LikeServiceImpl;
import com.blackshirts.threeblackshirts.utility.Utility;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class BoardController {
    private static final Logger log = LoggerFactory.getLogger(BoardController.class);

    @Autowired
    private BoardServiceImpl boardService;

//    @Autowired
//    private BReplyServiceImpl commentService;

    @Autowired
    private LikeServiceImpl likeService;

    @Autowired
    private FirebaseFileServiceImpl firebaseFileService;

    @GetMapping("/board")
    public String listBoard(Model model) { //HttpServletRequest request,
        List<Board> board_list = boardService.selectBoard();
        //List<Board> board_list = boardService.getBoardInfoByUseremail(user.getUseremail());
        //이거는 비밀글 일 때 이용
        int board_cnt = boardService.countBoard();
        if (!board_list.isEmpty()) {
            model.addAttribute("bd_list", board_list);
        }
        return "board";
    }

    @GetMapping("/board/listpage")
    public String listBoard(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
        log.info("Board_ListPage");
        List<Board> board_list = boardService.listCriteria(cri);
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        int total_num = boardService.countBoard();
        pageMaker.setTotal_count(total_num);
        List time_list = Utility.simpleDateFormat(board_list);
        model.addAttribute("pageMaker", pageMaker);
        model.addAttribute("bd_list", board_list);
        model.addAttribute("time_list", time_list);
        return "listpage";
    }

    // localhost:8080/postcreate
    @GetMapping("/postcreate")
    public String createBoard() {
        log.info("CreateBoard");
        return "postcreate";
    }

    //@ResponseBody
    @PostMapping("/postcreate")
    public String createBoard(Board board, HttpServletRequest request) throws IOException {
        log.info("CreateBoard_Post");
        // String upload_dir = Utility.getUploadDir();
        // String file_name = Utility.saveFile(board.getFilenameMF(), upload_dir);
        User user = Utility.getUserFromCookie(request);

        int size = (int) board.getFilenameMF().getSize();

        if (size > 0) {
            board.setBoard_file_name(board.getFilenameMF().getOriginalFilename());
        } else {
            board.setBoard_file_name("");
        }

        board.setUser_email(user.getUseremail());
        board.setBoard_datetime(Utility.getLocalTime());

        boardService.insertBoard(board);

        String[] file_name = firebaseFileService.uploadFile(board.getFilenameMF(), board);
        return "redirect:/board/listpage";
    }

//    @GetMapping("/postupdate")
//    public String postUpdate() {
//        log.info("postupdate");
//        return "postupdate";
//    }

    @GetMapping("/board/post/{board_id}")
    public String readBoard(@PathVariable("board_id") int board_id, Model model, HttpServletRequest request, HttpServletResponse resp) throws Exception {
        log.info("ReadBoard");
        Board board = boardService.getBoardByBoardId(board_id);
        String user_email = Utility.getUserFromCookie(request).getUseremail();

        Like like = new Like();
        like.setBoard_id(board_id);
        int cnt_like = likeService.cntBoardLike(board_id);

        like.setUser_email(user_email);

        int check_like = likeService.checkBoardLike(like);

        model.addAttribute("cnt_like", cnt_like);
        model.addAttribute("check_like", check_like);
        model.addAttribute("board", board);
        model.addAttribute("user_email", user_email);

        String fileName = "";
        String fileUrl = "";

        if(board.getBoard_file_name() != null){
            fileName = firebaseFileService.getDownloadFileName(board);
            fileUrl = firebaseFileService.showImage(board, request, resp);
        }
        model.addAttribute("fileName", fileName);
        model.addAttribute("fileUrl",fileUrl);

        return "postdetail";
    }

    @GetMapping("/board/post/edit/{board_id}")
    public String updateBoard(@PathVariable("board_id") int board_id, Model model) {
        log.info("UpdateBoard_Get");
        Board board = boardService.getBoardByBoardId(board_id);
        model.addAttribute("board", board);
        return "postupdate";
    }

    @ResponseBody
    @PostMapping("/board/post/edit/{board_id}")
    public String updateBoard(@PathVariable("board_id") int board_id, @RequestBody Board board, HttpServletRequest request) {
        log.info("UpdateBoard_Post");

        User user = Utility.getUserFromCookie(request);
        if (boardService.getBoardByBoardId(board.getBoard_id()).getUser_email().equals(user.getUseremail())) {
            log.info("UpdateBoard_idEqual");
            board.setUser_email(user.getUseremail());
            board.setBoard_update_datetime(Utility.getLocalTime());
            log.info(board.toString());
            boardService.updateBoard(board);
        } else {
            log.info("UpdateBoard_id_fail");
        }

        return "redirect:/post/{board_id}";
    }

    @ResponseBody
    @PostMapping("/postdelete")
    public String deleteBoard(@RequestBody Board board, HttpServletRequest request) {
        log.info("DeleteBoard");

        User user = Utility.getUserFromCookie(request);
        if (boardService.getBoardByBoardId(board.getBoard_id()).getUser_email().equals(user.getUseremail())) {
            log.info("DeletePost_idEqual");

            boardService.deleteBoard(board.getBoard_id());
        } else {
            log.info("DeletePost_id_fail");
        }
        return "redirect:/board/listpage"; // RedirectView
    }

    // localhost:8080/postcreate
    @GetMapping("/uploadfile")
    public String uploadFile() {
        log.info("uploadFile");
        return "uploadfile";
    }
}