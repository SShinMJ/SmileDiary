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
            <input type="password" id="user_password" placeholder=" Password" minlength="8" title="���� �ҹ��ڿ� ���ڸ� �����Ͽ� 8�� �̻��̾�� �մϴ�."/> <br>
            <label for="re_password"></label>
            <input type="password" id="re_password" placeholder=" Confirm Password"/>
        </div>
        <button id="sign_up">�����ϱ�</button>
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
                    alert("�ߺ��� �г����Դϴ�.");
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
                async: false,  //ajax�� �⺻������ �񵿱��. ������ ���� ��������� �ٲ��
                               //ajax�� ó���� �� success�� �����ϰԵȴ�.
                data : JSON.stringify({"user_email": str}),
                success:function(data){
                    if(data) {
                        success = true;
                    }
                    else {
                        alert("�ߺ��� �̸����Դϴ�.");
                    }
                },
                error: function (){
                    alert("err");
                }
            })
            return success;
        }
        else {
            alert('�߸��� �̸��� �����Դϴ�.');
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
                    alert("�α����� �Ǿ��ֽ��ϴ�.");
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
            if(checkNickname(user_nickname)) {   //�г��� ���� üũ
                console.log(user_nickname);
                if (checkEmail(user_email)) {   //�̸��� ���� üũ
                    console.log("email check");
                    if (checkPassword(user_password)) { //��й�ȣ ���� üũ
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
                                }),   //json���� ������ > db�̸��� ��ġ��Ű�� ��
                                success: function () {
                                    alert("ȸ�������� �Ϸ�ƽ��ϴ�.^^\n�̸��� ������ �Ϸ��Ͻø� �α��� �� �� �ֽ��ϴ�.");
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
                            alert('��й�ȣ�� ���� �ٸ��ϴ�.');
                        }
                    } else
                        alert('��й�ȣ�� 8�� �̻��̾�� �ϸ�, ����/�ҹ��ڸ� �����ؾ� �մϴ�.');
                }
            }
        })
    })

    function goSignIn(){
        location.href = "/user/signin";
    }
</script>
</html>