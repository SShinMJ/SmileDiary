package com.blackshirts.threeblackshirts.service;

import com.blackshirts.threeblackshirts.data.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Random;

@Service("mss")
public class AuthService {
    @Autowired
    private JavaMailSenderImpl mailSender;

    //인증키 생성
    private String getKey(int size) {
        return getAuthCode(size);
    }

    //인증코드 난수 발생
    private String getAuthCode(int size) {
        Random random = new Random();
        StringBuffer buffer = new StringBuffer();
        int num = 0;

        while(buffer.length() < size) {
            num = random.nextInt(10);
            buffer.append(num);
        }

        return buffer.toString();
    }

    //인증메일 보내기
    public String sendAuthMail(String email) {
        //6자리 난수 인증번호 생성
        String auth_key = getKey(6);
        System.out.println(auth_key);

        //인증메일 보내기
        MimeMessage mail = mailSender.createMimeMessage();
        String mailContent = "<h1>[이메일 인증]</h1><br><p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>"
                + "<a href='http://localhost:8080/user/emailAuthentication?email="
                + email + "&authKey=" + auth_key + "' target='_blank'>이메일 인증 확인</a>";

        try {
            mail.setSubject("회원가입 이메일 인증 ", "utf-8");
            mail.setText(mailContent, "utf-8", "html");
            mail.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            mailSender.send(mail);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        System.out.println(auth_key);
        return auth_key;
    }

    //비밀번호 찾기
    public String sendPwdMail(User user) {
        //6자리 난수 인증번호 생성
        String auth_key = getKey(6);
        System.out.println(auth_key);

        //비밀번호 메일 보내기
        MimeMessage mail = mailSender.createMimeMessage();
        String mailContent = "<h1>[SmileDiary 비밀번호 찾기를 위한 인증코드 전송]</h1><br><p>"
                + "<h3>비밀번호 찾기 페이지로 돌아가 다음 인증 번호를 입력해주세요</h3></p><br>"
                + "<p><h2 style=\"font-width: bold;\">"
                + auth_key + "</h2></p>";

        try {
            mail.setSubject("[SmileDiary] 인증 코드를 확인해주세요", "utf-8");
            mail.setText(mailContent, "utf-8", "html");
            mail.addRecipient(Message.RecipientType.TO, new InternetAddress(user.getUseremail()));
            mailSender.send(mail);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return auth_key;
    }
}