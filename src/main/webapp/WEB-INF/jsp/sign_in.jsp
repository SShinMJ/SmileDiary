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
<script>
    function checkemail(str)    {  //이메일 체크
        var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
        if(reg_email.test(str))
            return true;
        else
            return false;
    }
    function checkpassword(str) {  //비밀번호 체크
        var reg_pwd = /^(?=.*?[a-z])(?=.*?[0-9]).{8,}$/;
        if(reg_pwd.test(str))
            return true;
        else
            return false;
    }

    $(document).ready(function() {
        $.ajax({
            url: "/cookieCheck",
            type: "POST",
            contentType: "application/json; charset-utf-8",
            success: function (data) {
                if(!data) {
                    alert("로그인이 되어있습니다.");
                    location.href = "/diary_main";
                }
            },
            error: function () {
                alert("err");
            }
        })
        $('#login').click(function() {
            var useremail = $('#useremail').val();
            var userpassword = $('#userpassword').val();
            if(checkemail(useremail)) {   //이메일 형식 체크
                if(checkpassword(userpassword)) { //비밀번호 형식 체크
                    $.ajax({
                        url : "/logincheck",
                        type:"POST",
                        contentType: "application/json; charset-utf-8",
                        data : JSON.stringify({ "useremail": useremail, "userpassword": userpassword}),
                        success:function(data){
                            if(data) {
                                alert('로그인 성공!');
<%--                                <%String useremail = request.getParameter("useremail");--%>
<%--                                Cookie user = new Cookie("useremail", useremail);--%>
<%--                                response.addCookie(user);%>--%>
                                $.ajax({
                                    url : "/cookieinsert",
                                    type:"POST",
                                    contentType: "application/json; charset-utf-8",
                                })
                                location.href="/diary_main";
                            }
                            else
                                alert('없는 이메일이거나 비밀번호가 일치하지 않습니다.')
                        },
                        error: function (){
                            alert("err");
                        }
                    })
                }
                else
                    alert('비밀번호는 8자 이상이어야 하며, 숫자/소문자를 포함해야 합니다.');
            }
            else
                alert('잘못된 이메일 형식입니다.');
        })
    })
</script>
<body>
<div class="container">
    <div class="main">
        <div class="title">
            <img id="title" src="/css/img/login.png" alt="" />
        </div>
        <div class="login">
            <div class="input">
                <input type="text" id="useremail" placeholder="Email"/> <br>
                <input type="password" id="userpassword" placeholder="Password"/>
            </div>
            <button id="login">로그인</button> <br>
        </div>
        <div class="hyperLink">
            <button id="sign_up" onclick=location.href="sign_up">회원가입</button>
            <button id="find_user" onclick=location.href="find_user">아이디/비밀번호 찾기</button>
        </div>
    </div>
</div>
</body>
</html>