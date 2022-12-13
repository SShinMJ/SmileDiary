<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.-1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <link rel="stylesheet" type="text/css" href="/css/sign_up_style.css" >
    <title>Sign_up</title>
</head>
<script
        src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
<body>
<div class="container">
    <div class="main">
        <div class="title">
            <img id="title" src="/css/img/sign_up.png" alt="" />
        </div>
        <div class="input">
            <label for="user_nickname"></label>
            <input type="text" id="user_nickname" placeholder=" Nickname"/> <br>
            <label for="user_email"></label>
            <input type="text" id="user_email" placeholder=" Email"/> <br>
            <label for="user_password"></label>
            <input type="password" id="user_password" placeholder=" Password" minlength="8" title="영문 소문자와 숫자를 포함하여 8자 이상이어야 합니다."/> <br>
            <label for="re_password"></label>
            <input type="password" id="re_password" placeholder=" Confirm Password"/>
        </div>
        <button id="sign_up">가입하기</button>
    </div>
</div>
</body>
<script>
    function checkNickname(str){
        var success = false;
        $.ajax({
            url : "/user/usernickname",
            type:"POST",
            contentType: "application/json; charset-utf-8",
            async: false,
            data : JSON.stringify({"user_nickname": str}),
            success:function(data){
                if(data) {
                    success = true;
                }
                else {
                    alert("중복된 닉네임입니다.");
                }
            },
            error: function (){
                alert("err");
            }
        })
        return success;
    }

    function checkEmail(str)    {
        var success = false;
        var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
        if(reg_email.test(str)) {
            $.ajax({
                url : "/user/useremail",
                type:"POST",
                contentType: "application/json; charset-utf-8",
                async: false,  //ajax는 기본적으로 비동기식. 다음과 같이 동기식으로 바꿔야
                               //ajax가 처리된 후 success를 리턴하게된다.
                data : JSON.stringify({"user_email": str}),
                success:function(data){
                    if(data) {
                        success = true;
                    }
                    else {
                        alert("중복된 이메일입니다.");
                    }
                },
                error: function (){
                    alert("err");
                }
            })
            return success;
        }
        else {
            alert('잘못된 이메일 형식입니다.');
            return false;
        }
    }
    function checkPassword(str) {
        var reg_pwd = /^(?=.*?[a-z])(?=.*?[0-9]).{8,}$/;
        if(reg_pwd.test(str))
            return true;
        else
            return false;
    }

    function confirmPassword(str1, str2) {
        if(str1 == str2)
            return true;
        else
            return false;
    }

    $(document).ready(function() {
        $.ajax({
            url: "/user/cookiecheck",
            type: "POST",
            contentType: "application/json; charset=EUC-KR",
            success: function (data) {
                if(!data) {
                    alert("로그인이 되어있습니다.");
                    goDiaryMain();
                }
            },
            error: function () {
                alert("err cookie check");
            }
        })
        $('#sign_up').click(function() {
            var user_nickname = $('#user_nickname').val();
            var user_email = $('#user_email').val();
            var user_password = $('#user_password').val();
            var re_password = $('#re_password').val();
            if(checkNickname(user_nickname)) {   //닉네임 형식 체크
                console.log(user_nickname);
                if (checkEmail(user_email)) {   //이메일 형식 체크
                    console.log("email check");
                    if (checkPassword(user_password)) { //비밀번호 형식 체크
                        console.log("pwd check");
                        if (confirmPassword(user_password, re_password)) {
                            $.ajax({
                                url: "/user/insert",
                                type: "POST",
                                contentType: "application/json; charset=EUC-KR",
                                data: JSON.stringify({
                                    "user_nickname": user_nickname,
                                    "user_email": user_email,
                                    "user_password": user_password,
                                }),   //json으로 보내기 > db이름과 일치시키는 것
                                success: function () {
                                    alert("회원가입이 완료됐습니다.^^\n이메일 인증을 완료하시면 로그인 할 수 있습니다.");
                                    goSignIn();
                                    $.ajax({
                                        url: "/user/sendemailauth",
                                        type: "POST",
                                        contentType: "application/json; charset=EUC-KR",
                                        data: JSON.stringify({
                                            "user_email": user_email,
                                        }),
                                        success: function () {
                                        },
                                        error: function () {
                                            alert("err send email");
                                        }
                                    })

                                },
                                error: function () {
                                    alert("err insert");
                                }
                            })
                        } else {
                            alert('비밀번호가 서로 다릅니다.');
                        }
                    } else
                        alert('비밀번호는 8자 이상이어야 하며, 숫자/소문자를 포함해야 합니다.');
                }
            }
        })
    })

    function goSignIn(){
        location.href = "/user/signin";
    }
</script>
</html>