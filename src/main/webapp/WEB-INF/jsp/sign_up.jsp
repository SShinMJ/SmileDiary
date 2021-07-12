<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.-1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <link href="/css/sign_up_style.css" rel="stylesheet" type="text/css">
    <title>Sign_up</title>
</head>
<script
        src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
<script>
    function checkemail(str)    {
        var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
        if(reg_email.test(str))
            //if(기존에 있는 이메일인지 확인)
            return true;
        else
            return false;
    }
    function checkpassword(str) {
        var reg_pwd = /^(?=.*?[a-z])(?=.*?[0-9]).{8,}$/;
        if(reg_pwd.test(str))
            return true;
        else
            return false;
    }

    function confirmpassword(str1, str2) {
        if(str1 ==str2)
            return true;
        else
            return false;
    }

    $(document).ready(function() {
        $('#sign_up').click(function() {
            var useremail = $('#useremail').val();
            var userpassword = $('#userpassword').val();
            var repassword = $('#repassword').val();
            if(checkemail(useremail)) {   //이메일 형식 체크
                if(checkpassword(userpassword)) { //비밀번호 형식 체크
                    if(confirmpassword(userpassword, repassword)) {
                        $.ajax({
                            url : "/insert",
                            type:"GET",
                            data : {useremail, userpassword},
                            success:function(){
                                alert("회원가입이 완료됐습니다.^^");
                                location.href = "/"
                            },
                            error: function (){
                                alert("err");
                            }
                        })
                    }
                    else
                        alert('비밀번호가 서로 다릅니다.');
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
            <img id="title" src="/css/img/sign_up.png" alt="" />
        </div>
        <div class="input">
            <input type="text" id="useremail" placeholder="Email"/> <br>
            <input type="password" id="userpassword" placeholder="Password" title="영문 소문자와 숫자를 포함하여 8자 이상이어야 합니다."/> <br>
            <input type="password" id="repassword" placeholder="Confirm Password"/>
        </div>
        <button id="sign_up">가입하기</button>
    </div>
</div>
</body>
</html>