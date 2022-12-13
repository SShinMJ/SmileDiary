<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.-1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <link rel="stylesheet" type="text/css" href="/css/change_pwd_style.css">
    <title>Authorization Complete</title>
</head>
<script
        src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous">

</script>
<body>
<div class="container">
    <div class="main">
        <h2>��й�ȣ�� �������ּ���</h2><br>
        <div class="input">
            <label for="change_password"></label>
            <input type="password" id="change_password" placeholder=" Password" minlength="8" title="���� �ҹ��ڿ� ���ڸ� �����Ͽ� 8�� �̻��̾�� �մϴ�."/> <br>
            <label for="re_password"></label>
            <input type="password" id="re_password" placeholder=" Confirm Password"/>
        </div>
        <button id="change_button">�����ϱ�</button>
    </div>
</div>
<script>
    function gofinduser(){
        location.href = "/user/finduser";
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
            url: "/user/cookiecheckpwd",
            type: "POST",
            contentType: "application/json; charset-utf-8",
            success: function (data) {
                if(data) {
                    alert("���� �ϷḦ ���ּ���.");
                    gofinduser();
                }
            },
            error: function () {
                alert("err");
            }
        })
        $('#change_button').click(function() {
            var change_password = $('#change_password').val();
            var re_password = $('#re_password').val();
            if (checkPassword(change_password)) { //��й�ȣ ���� üũ
                console.log("pwd check");
                if (confirmPassword(change_password, re_password)) {
                    $.ajax({
                        url: "/user/changepwd",
                        type: "POST",
                        contentType: "application/json; charset=EUC-KR",
                        data: JSON.stringify({"user_password": change_password}),
                        success: function () {
                            $.ajax({
                                url: "/user/cookiedeletepwd",
                                type: "POST",
                                contentType: "application/json; charset=EUC-KR",
                                success: function () {
                                },
                                error: function () {
                                    alert("err cookie delete");
                                }
                            })
                            alert("��й�ȣ�� ����Ǿ����ϴ�.");
                            window.close();
                        },
                        error: function () {
                            alert("err change pwd");
                        }
                    })
                } else {
                    alert('��й�ȣ�� ���� �ٸ��ϴ�.');
                }
            } else
                alert('��й�ȣ�� 8�� �̻��̾�� �ϸ�, ����/�ҹ��ڸ� �����ؾ� �մϴ�.');
        })
    })
</script>
</body>
</html>