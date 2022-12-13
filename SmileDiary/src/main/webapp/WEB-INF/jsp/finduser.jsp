<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.-1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <link rel="stylesheet" type="text/css" href="/css/find_user_style.css">
    <title>Find User</title>
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
                <div class="find" id="find_id">
                    <h3>아이디 찾기</h3>
                    <div class="search_box">
                        <div class="input">
                            <label for="user_nickname_id"></label>
                            <input class="user_nickname" id="user_nickname_id" placeholder=" Nick Name"/> <br>
                            <label for="user_password_id"></label>
                            <input class="user_password" id="user_password_id" placeholder=" Password" type="password" maxlength="8"/>
                        </div>
                        <button class="search" id="search_id">검색</button> <br>
                    </div>
                    <div class="print" id="print_id">
                        여기에 입력 정보에 맞는 아이디가 표시됩니다.
                    </div>
                </div>
                <div class="find" id="find_pwd" style="display: none">
                    <h3>비밀번호 찾기</h3>
                    <div class="search_box">
                        <div class="input">
                            <label for="user_nickname_pwd"></label>
                            <input class="user_nickname" id="user_nickname_pwd" placeholder=" Nick Name"/> <br>
                            <label for="user_email_pwd"></label>
                            <input class="user_email" id="user_email_pwd" placeholder=" Email" type="Email"/>
                        </div>
                        <button class="search" id="search_pwd">검색</button> <br>
                    </div>
                    <div class="print" id="print_pwd">
                        입력 정보가 올바르면 잠시 후 해당 이메일로 인증번호가 전송됩니다.
                    </div>
                </div>
            </div>
            <div class="category">
                <div class="category_item">
                    <button id="find_id_category">아이디 찾기</button>
                </div>
                <div class="category_item">
                    <button id="find_pwd_category">비밀번호 찾기</button>
                </div>
                <div class="category_item">
                    <button id="go_to_signin" onclick="goSignIn()">로그인하러 가기</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function goSignIn(){
        location.href = "/user/signin";
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
        $('#find_id_category').click(function() {
            document.getElementById("find_pwd").style.display = "none";
            document.getElementById("find_id").style.display = "";
            document.getElementById("print_id").innerHTML = "여기에 입력 정보에 맞는 아이디가 표시됩니다.";
        })
        $('#find_pwd_category').click(function() {
            document.getElementById("find_id").style.display = "none";
            document.getElementById("find_pwd").style.display = "";
            document.getElementById("print_pwd").innerHTML = "입력 정보가 올바르면 잠시 후 해당 이메일로 인증번호가 전송됩니다.";
        })
        $('#search_id').click(function() {
            var user_nickname = $('#user_nickname_id').val();
            var user_password = $('#user_password_id').val();
            $.ajax({
                url: "/user/findid",
                type: "POST",
                contentType: "application/json; charset=EUC-KR",
                data: JSON.stringify({"user_nickname": user_nickname, "user_password": user_password}),
                success: function (data) {
                    var result = data;
                    if(result == 0)
                        document.getElementById("print_pwd").innerText = "입력 정보에 맞는 회원 정보가 없습니다.";
                    else {
                        var str = "회원님의 아이디는 \"" + data + "\"입니다.";
                        document.getElementById("print_id").innerHTML = str;
                    }
                },
                error: function () {
                    document.getElementById("print_id").innerHTML = "올바른 형식으로 입력해 주세요";
                }
            })
        })
        $('#search_pwd').click(function() {
            document.getElementById("print_pwd").innerText = "이메일 전송을 준비중입니다.";
            var user_nickname = $('#user_nickname_pwd').val();
            var user_email = $('#user_email_pwd').val();
            $.ajax({
                url: "/user/findpwd",
                type: "POST",
                contentType: "application/json; charset=EUC-KR",
                data: JSON.stringify({"user_nickname": user_nickname, "user_email": user_email}),
                success: function (data) {
                    if(!data)
                        document.getElementById("print_pwd").innerText = "입력 정보에 맞는 회원 정보가 없습니다.";
                    else {
                        var str = "<input id=\"insert_code\" placeholder=\" 메일로 전송된 인증번호를 입력하세요\"/>" +
                            "<button id=\"comfirm\">확인</button>";
                        document.getElementById("print_pwd").innerHTML = str;
                        $('#comfirm').click(function() {
                            var insert_code = $('#insert_code').val();
                            $.ajax({
                                url: "/user/comfirmmailcode",
                                type: "POST",
                                contentType: "application/json; charset=EUC-KR",
                                data: JSON.stringify({"user_email": user_email, "auth_key": insert_code}),
                                success: function (data) {
                                    if(data) {
                                        var popupX = (window.screen.width / 2) - (360 / 2);
                                        var popupY = (window.screen.height / 2) - (360 / 2);
                                        window.open("/user/changepwd", "Change Password", "width=360, height=360, " +
                                            "left=" + popupX + ", top=" + popupY + ", toolbar=0, menubar=no, scrollbars= 0");
                                    }
                                    else{
                                        alert("인증번호가 다릅니다.")
                                    }
                                },
                                error: function () {
                                    alert("mail_comfirm err");
                                }
                            })
                        })
                    }
                },
                error: function () {
                    document.getElementById("print_pwd").innerText = "올바른 형식으로 입력해 주세요";
                }
            })
        })
    })
</script>
</html>