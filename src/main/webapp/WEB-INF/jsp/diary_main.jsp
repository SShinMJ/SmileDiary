<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.-1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <link rel="stylesheet" type="text/css" href="/css/diary_main_style.css">
    <title>My Diary</title>
</head>
<script
        src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous">

</script>
<body>
<div class="container">
    <div class="main">
        다이어리 페이지
        <div>
            <button id="logout">로그아웃</button>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $.ajax({
            url: "/cookieCheck",
            type: "POST",
            contentType: "application/json; charset-utf-8",
            success: function (data) {
                console.log(data);
                if(data) {
                    alert("로그인을 해주세요");
                    location.href = "/sign_in";
                }
            },
            error: function () {
                alert("err");
            }
        })
        $('#logout').click(function() {
            $.ajax({
                url: "/cookieDelete",
                type: "POST",
                success: function () {
                    alert("로그아웃 되었습니다.");
                    location.href = "/sign_in";
                },
                error: function () {
                    alert("err");
                }
            })
        })
    })
</script>
</body>
</html>