<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.-1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <link rel="stylesheet" type="text/css" href="/css/sign_in_style.css">
    <title>Login</title>
</head>
<script
        src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
<body>
<div class="container">
    <div class="main">
        <div class="background">
            <div class="contents">
                <div class="login_content" id="site_login">
                    <div class="title">
                        <img id="title" src="/css/img/login.png" alt="" />
                    </div>
                    <div class="login">
                        <div class="input">
                            <label for="user_email"></label>
                            <input id="user_email" placeholder=" Email" type="email"/> <br>
                            <label for="user_password"></label>
                            <input id="user_password" placeholder=" Password" type="password" maxlength="8"/>
                        </div>
                        <button id="login">로그인</button> <br>
                    </div>
                </div>
                <div class="login_content" id="social_login" style="display: none">
                    <div id="cover_box_social">
                        <div>
                            <p id="social_login_text">소셜 로그인</p>
                            <hr id="underline">
                            <button id="google_login" onclick=location.href="http://localhost:8080/auth/google"></button>
                            <button id="naver_login" onclick=location.href=""></button>
                            <button id="kakao_login" onclick=location.href=""></button>
                        </div>
                        <button id="goto_signin">일반 로그인 하기</button>
                    </div>
                </div>
            </div>
            <div class="category">
                <label><div class="category_item">
                    <button id="sign_in_category" onclick=location.href="signup">회원가입</button>
                </div></label>
                <label><div class="category_item">
                    <button id="find_user_category" onclick=location.href="finduser">아이디/비밀번호 찾기</button>
                </div></label>
                <label><div class="category_item">
                    <button id="social_login_category">소셜 로그인</button>
                </div></label>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function checkEmail(str)    {  //이메일 체크
        var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
        if(reg_email.test(str))
            return true;
        else
            return false;
    }
    function checkPassword(str) {  //비밀번호 체크
        var reg_pwd = /^(?=.*?[a-z])(?=.*?[0-9]).{8,}$/;
        if(reg_pwd.test(str))
            return true;
        else
            return false;
    }
    function checkAuthentication(str) { //이메일 인증 체크
        var success = false;
        $.ajax({
            url: "/user/checkauthentication",
            type: "POST",
            contentType: "application/json; charset=EUC-KR",
            async: false,
            data : JSON.stringify({"user_email": str}),
            success:function(data){
                if(data == 1) {
                    success = true;
                }
                else {
                    alert("이메일 인증을 완료해주세요.");
                }
            },
            error: function (){
                alert("err check Authentication");
            }
        })
        return success;
    }
    function goDiaryMain(){
        location.href = "/diarymain";
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
        $('#goto_signin').click(function() {
            document.getElementById("social_login").style.display = "none";
            document.getElementById("site_login").style.display = "";
            document.getElementById("print_id").innerHTML = "여기에 입력 정보에 맞는 아이디가 표시됩니다.";
        })
        $('#social_login_category').click(function() {
            document.getElementById("site_login").style.display = "none";
            document.getElementById("social_login").style.display = "";
            document.getElementById("print_pwd").innerHTML = "입력 정보가 올바르면 잠시 후 해당 이메일로 인증번호가 전송됩니다.";
        })
        $('#login').click(function() {
            var user_email = $('#user_email').val();
            var user_password = $('#user_password').val();
            if(checkEmail(user_email)) {   //이메일 형식 체크
                if(checkPassword(user_password)) { //비밀번호 형식 체크
                    if(checkAuthentication(user_email)) {
                        $.ajax({
                            url: "/user/logincheck",
                            type: "POST",
                            contentType: "application/json; charset=EUC-KR",
                            data: JSON.stringify({"user_email": user_email, "user_password": user_password}),
                            success: function (data) {
                                if (data) {
                                    alert('로그인 성공!');
                                    $.ajax({
                                        url: "/user/cookieinsert",
                                        type: "POST",
                                        contentType: "application/json; charset=EUC-KR",
                                        data: JSON.stringify({"user_email": user_email}),
                                    })
                                    // $.ajax({
                                    //     url: "/user/creatjwt",
                                    //     type: "POST",
                                    //     contentType: "application/json; charset=EUC-KR",
                                    //     data: JSON.stringify({"user_nickname": user_nickname, "user_email": user_email}),
                                    // })
                                    goDiaryMain();
                                } else
                                    alert('비밀번호가 일치하지 않습니다.')
                            },
                            error: function () {
                                alert("존재하지 않는 이메일입니다.");
                            },
                            beforeSend: function (){
                                var width=50;
                                var height=50;
                                var left=0;
                                var top=0;

                                top = ( $(window).height() - height ) / 2 + $(window).scrollTop();
                                left = ( $(window).width() - width ) / 2 + $(window).scrollLeft();

                                if($("#loading_img").length != 0) {
                                    $("#loading_img").css({
                                        "top": top+"px",
                                        "left": left+"px"
                                    });
                                    $("#loading_img").show();
                                }
                                else {
                                    $('body').append('<div id="loading_img" style="position:absolute;' +
                                        ' top:' + top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height + 'px;' +
                                        ' z-index:9999; background:#f0f0f0; filter:alpha(opacity=50);' +
                                        ' opacity:alpha*0.5; margin:auto; padding:0; ">' +
                                        '<img src="/css/img/loadingimg.gif" style="width:150px; height:150px;"></div>');
                                }
                            }
                        })
                    }
                }
                else
                    alert('비밀번호는 8자 이상이어야 하며, 숫자/소문자를 포함해야 합니다.');
            }
            else
                alert('잘못된 이메일 형식입니다.');
        })
    })
</script>
</html>