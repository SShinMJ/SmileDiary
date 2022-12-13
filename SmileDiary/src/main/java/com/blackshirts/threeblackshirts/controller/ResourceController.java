package com.blackshirts.threeblackshirts.controller;

import com.blackshirts.threeblackshirts.data.Board;
import com.blackshirts.threeblackshirts.service.FirebaseFileServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.time.LocalDateTime;

@RestController
@RequestMapping("/api")
public class ResourceController {

    private static final Logger log = LoggerFactory.getLogger(ResourceController.class);

    @Autowired
    private FirebaseFileServiceImpl firebaseFileService;

//    @PostMapping("/uploadfile")
//    public Object upload(@RequestParam("file") MultipartFile multipartFile) throws IOException {
//        log.info("HIT -/upload | File Name : {}", multipartFile.getOriginalFilename());
//        return firebaseFileService.uploadFile(multipartFile);
//    }

    //    @PostMapping("/post/file/{fileName}")
//    public Object download(@PathVariable String fileName) throws IOException {
//        log.info("HIT -/download | File Name : {}", fileName);
//        return firebaseFileService.download(fileName);
//    }

//    // 파일 형식까지 가져올 수 있도록 정규식 .+ 이용
//    @PostMapping("/download/{fileName:.+}")
//    public ResponseEntity<Object> downloadFile(@PathVariable String fileName, Board board, HttpServletRequest request) throws Exception {
//
//        board.setBoard_file_name(fileName);
//        log.info("downloadFile board : " + board.toString());
//
//        return firebaseFileService.downloadFile(board, request);
//    }

    // 파일 형식까지 가져올 수 있도록 정규식 .+ 이용
    @RequestMapping("/download/{fileName:.+}")
    public ResponseEntity<Object> downloadFile(@PathVariable String fileName, String user_email, String board_datetime, HttpServletRequest request) throws Exception {

        Board board = new Board();

        board.setBoard_file_name(fileName);
        board.setUser_email(user_email);
        LocalDateTime datetime = LocalDateTime.parse(board_datetime);
        board.setBoard_datetime(datetime);
        log.info("downloadFile board : " + board.toString());

        return firebaseFileService.downloadFile(board, request);
    }
}