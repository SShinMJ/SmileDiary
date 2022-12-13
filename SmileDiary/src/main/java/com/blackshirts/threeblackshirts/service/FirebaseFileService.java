package com.blackshirts.threeblackshirts.service;

import com.blackshirts.threeblackshirts.data.Board;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public interface FirebaseFileService {
    String[] uploadFile(MultipartFile multipartFile, Board board)throws IOException;
    ResponseEntity<Object> downloadFile(Board board, HttpServletRequest request) throws Exception;
}
