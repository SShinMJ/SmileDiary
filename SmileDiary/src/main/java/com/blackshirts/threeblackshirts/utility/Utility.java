package com.blackshirts.threeblackshirts.utility;

import com.blackshirts.threeblackshirts.data.Board;
import com.blackshirts.threeblackshirts.data.User;
import com.blackshirts.threeblackshirts.service.FirebaseFileService;
import com.blackshirts.threeblackshirts.service.FirebaseFileServiceImpl;
import com.blackshirts.threeblackshirts.service.UserServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Component
public class Utility {
    private static final Logger log = LoggerFactory.getLogger(Utility.class);

    private static UserServiceImpl userService;

    public Utility(UserServiceImpl userService) {
        this.userService = userService;
    }

    // Windows, VMWare, AWS cloud 절대 경로 설정
    public static synchronized String getUploadDir() {
        String path = "";
        if (File.separator.equals("\\")) {
            path = "c:/Study/deploy/TBS/board/storage/";
            System.out.println("Windows 10: " + path);
        } else {
            // System.out.println("Linux");
//            path = "/home/ubuntu/deploy/jumin/office/storage/";
            // mac 경로 (Jin; 사용 경로)
            path = "/Users/jules/deploy/TBS/board/storage/";
        }
        return path;
    }

//    // 파일 저장을 위한 함수
//    public static String saveFile(MultipartFile mf, String base_path) throws IOException {
//        InputStream input_stream = null;
//        OutputStream output_stream = null;
//        String file_name = "";
//        long file_size = mf.getSize();
//        String originalFilename = mf.getOriginalFilename();
//        try {
//            if (file_size > 0) { // 파일이 존재한다면
//                // 인풋 스트림을 얻는다.
//                input_stream = mf.getInputStream();
//
//                File old_file = new File(base_path, originalFilename);
//
//                if (old_file.exists()) {
//                    for (int k = 0; true; k++) {
//                        // 파일명 중복을 피하기 위한 일련 번호를 생성하여
//                        // 파일명으로 조합
//                        old_file = new File(base_path, "(" + k + ")" + originalFilename);
//
//                        // 조합된 파일명이 존재하지 않는다면
//                        // 일련번호 붙은 파일명 다시 생성
//                        if (!old_file.exists()) { // 존재하지 않는 경우
//                            file_name = "(" + k + ")" + originalFilename;
//                            break;
//                        }
//                    }
//                } else {
//                    file_name = originalFilename;
//                }
//                String os = System.getProperty("os.name").toLowerCase();
//
//                System.out.println("os: " + os); // windows 10, linux, mac os x
//                String serverFullPath = null;
//                if (os.equals("mac os x")) { // Mac
//                    System.out.println("맥");
//                    serverFullPath = base_path + "/" + file_name;
//                } else if (os.equals("windows 10")) {
//                    System.out.println("os: " + os);
//                    serverFullPath = base_path + "\\" + file_name;
//                } else if (os.equals("linux")) {
//                    System.out.println("리눅스");
//                    serverFullPath = base_path + "/" + file_name;
//                }
//
//                System.out.println("fileName: " + file_name);
//                System.out.println("serverFullPath: " + serverFullPath);
//
//                output_stream = new FileOutputStream(serverFullPath);
//
//                // 버퍼를 만든다.
//                int readBytes = 0;
//                byte[] buffer = new byte[8192];
//
//                while ((readBytes = input_stream.read(buffer, 0, 8192)) != -1) {
//                    output_stream.write(buffer, 0, readBytes);
//                }
//                output_stream.close();
//                input_stream.close();
//
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//
//        }
//
//        return file_name;
//    }

    public static String checkNullStr(String str) {
        if (str == null) {
            str = "";
        }

        return str;
    }

    // cookie에서 user를 얻는 함수
    public static User getUserFromCookie(HttpServletRequest request) {
//        log.info("GetUserFromCookie");
        String user_name = null;
        Cookie[] cookie = request.getCookies();

        for (Cookie c : cookie) {
            if (c.getName().equals("userCookie")) { //로그인시 저장된 쿠키 이름 = userCookie
                user_name = c.getValue();               //따라서 userCookie라는 쿠키가 있는지 확인
            }
        }
        User user = userService.getUserInfoByUserNickname(user_name);
        log.info("GetUserFromCookie : User_email / " + user.getUseremail().toString());
        return user;
    }

    public static LocalDateTime getLocalTime() {
        LocalDateTime now = LocalDateTime.now().withNano(0);

        return now;
    }

    public static List simpleDateFormat(List<Board> board_list) {
        log.info("simpleDateFormat");
        List time_set = new ArrayList();
        for (Board b : board_list) {
            String strNowDate = b.getBoard_datetime().format((DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
            time_set.add(strNowDate);
//            log.info(strNowDate);
        }
        return time_set;
    }
}