<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.-1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/css/info_page_style.css">
    <title>Info Page</title>
</head>
<script
        src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous">
</script>
<body>
<div id="div_load_img">
    <img src="/css/img/loadingimg.gif" style="width: 150px; height: 150px;">
</div>


<div id="container">
    <div id="main_header">
        <div id="main_header_title">
            <h1 style="width: 300px" onclick="toMain()">Smile Diary :)</h1>
        </div>

        <div class="wrap_btn" id="notification">
            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 16 16">
                <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
            </svg>
        </div>

        <div class="wrap_btn" id="infobtn" onclick="toInfo()">
            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-gear-fill" viewBox="0 0 16 16">
                <path d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z"/>
            </svg>
        </div>

        <div class="wrap_btn" id="logout">
            <svg xmlns="http://www.w3.org/2000/svg" width="27" height="25" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
                <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
            </svg>
        </div>
    </div>

    <div id="main">
        <div id="diary">
            <div id="blank"></div>
            <div id="left_page" class="page">
                <div id="info_menu">
                    <div class="menu_box" id="menu_img">
                        <h4>대표 이미지 변경</h4>
                        <hr>
                    </div>
                    <div class="menu_box" id="menu_user">
                        <h4>사용자 정보</h4>
                        <hr>
                    </div>
                    <div class="menu_box" id="menu_password">
                        <h4>비밀번호 변경</h4>
                        <hr>
                    </div>
                    <div class="menu_box" id="menu_friend">
                        <h4>친구 관리</h4>
                        <hr>
                    </div>
                </div>

            </div>

            <div id="right_page" class="page">
                <div id="info_specific">
                    <div id="info_specific_title">
                        <h4>대표 이미지 변경</h4>
                    </div>
                    <hr>
                    <div id="info_specific_details">
                        <div class='img_change_box'>
                            <h5>프로필 사진 변경</h5><br>
                            <div class="img_change_box_content">
                                <div class="img_change_box_content_img">
                                    <img src="/css/img/cat.png" width="100px" height="100px">
                                </div>
                                <div class="img_change_box_content_btn">
                                    <div class="img_change_box_content_btn_src">이미지 파일 불러오기</div>
                                    <div class="img_change_box_content_btn_btn"><button class='btn btn-info' type='button'>불러오기</button></div>
                                </div>
                            </div>
                        </div>
                        <div class='img_change_box'>
                            <h5>배경(대표)사진 변경</h5><br>
                            <div class="img_change_box_content">
                                <div class="img_change_box_content_img">
                                    <img src="/css/img/cat.png" width="100px" height="100px">
                                </div>
                                <div class="img_change_box_content_btn">
                                    <div class="img_change_box_content_btn_src">이미지 파일 불러오기</div>
                                    <div class="img_change_box_content_btn_btn"><button class='btn btn-info' type='button'>불러오기</button></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>

            <div id="category">
                <div id="category_title">

                </div>
                <div id="category_item_container">
                    <div class="category_item" id="toBoard" onclick="toBoard()">
                        <label>일기장</label>
                    </div>
                    <div class="category_item" id="toAlbum" onclick="toAlbum()">
                        <label>사진첩</label>
                    </div>
                    <div class="category_item" id="toCalendar" onclick="toCalendar()">
                        <label>달력</label>
                    </div>
                    <div class="category_item" id="toTodo" onclick="toTodo()">
                        <label>할 일</label>
                    </div>
                    <div class="category_item" id="toGuest" onclick="toGuest()">
                        <label>방명록</label>
                    </div>
                    <div class="category_item" id="toSetting" onclick="toSetting()">
                        <label>설정</label>
                    </div>
                </div>
            </div>
        </div>


    </div>
</div>
<script>

    window.onload = function (){
        $("#div_load_img").hide();
    }
    $(document).ready(function() {
        $.ajax({
            url: "/user/cookiecheck",
            type: "POST",
            contentType: "application/json; charset-utf-8",
            success: function (data) {
                if(data) {
                    alert("로그인을 해주세요");
                    goSignIn();
                }
            },
            error: function () {
                alert("err");
            }
        })
        $('#logout').click(function() {
            $.ajax({
                url: "/user/cookiedelete",
                type: "POST",
                success: function () {
                    alert("로그아웃 되었습니다.");
                    goSignIn();
                },
                error: function () {
                    alert("err");
                }
            })
        })
    })
    function goSignIn(){
        location.href = "/user/signin";
    }

    function toBoard(){
        location.href = "/board/listpage";
    }

    function toMain(){
        location.href = "/diarymain";
    }

    function toInfo(){
        location.href = "/infopage";
    }

    function toAlbum(){
        location.href = "/extrapage";
    }

    function toCalendar(){
        location.href = "/extrapage";
    }

    function toTodo(){
        location.href = "/extrapage";
    }

    function toGuest(){
        location.href = "/extrapage";
    }

    function toSetting(){
        location.href = "/diarysetting";
    }

    //모든 페이지에 추가---------------------------------------------
    var user_nickname = getCookie();
    var ctg_diary_color = '0';
    var ctg_photo_color = '0';
    var ctg_calendar_color = '0';
    var ctg_todo_color = '0';
    var ctg_guest_color = '0';
    $.ajax({
        url: "/diarysetting/catagorycolorcheck",
        type: "POST",
        contentType: "application/json; charset-utf-8",
        data: JSON.stringify({user_nickname: user_nickname}),
        success: function (data) {
            if(data) {
                console.log(data);
                var ctg_diary_color = data[0];
                ctgUserSet("toBoard", ctg_diary_color);
                var ctg_photo_color = data[1];
                ctgUserSet("toAlbum", ctg_photo_color);
                var ctg_calendar_color = data[2];
                ctgUserSet("toCalendar", ctg_calendar_color);
                var ctg_todo_color = data[3];
                ctgUserSet("toTodo", ctg_todo_color);
                var ctg_guest_color = data[4];
                ctgUserSet("toGuest", ctg_guest_color);
            }
        },
        error: function () {
            alert("catagory color check err");
        }
    })

    function ctgUserSet(target_name, target_status){
        if(target_status == '0'){
            document.getElementById(target_name).style.display = "none";
        }
        else if(target_status == '1') {
            document.getElementById(target_name).style.display = "";
        }
        else
            alert("ctg User Color err");
    }

    $.ajax({
        url: "/diarysetting/themecolorcheck",
        type: "POST",
        contentType: "application/json; charset-utf-8",
        data: JSON.stringify({user_nickname: user_nickname}),
        success: function (data) {
            if(data) {
                var back_color = data[1];
                document.body.style.backgroundColor = back_color;
                document.getElementById("main").style.backgroundColor = back_color;
                var cover_color = data[2];
                document.getElementById("diary").style.backgroundColor = cover_color;
                var page_color = data[3];
                document.getElementsByClassName("page")[0].style.backgroundColor = page_color;
                document.getElementsByClassName("page")[1].style.backgroundColor = page_color;
                var bookmark_color = data[4];
                document.getElementsByClassName("category_item")[0].style.backgroundColor = bookmark_color;
                document.getElementsByClassName("category_item")[1].style.backgroundColor = bookmark_color;
                document.getElementsByClassName("category_item")[2].style.backgroundColor = bookmark_color;
                document.getElementsByClassName("category_item")[3].style.backgroundColor = bookmark_color;
                document.getElementsByClassName("category_item")[4].style.backgroundColor = bookmark_color;
                document.getElementsByClassName("category_item")[5].style.backgroundColor = bookmark_color;
            }
        },
        error: function () {
            alert("theme color check err");
        }
    })

    //글꼴 불러오기
    $.ajax({
        url: "/diarysetting/fontcolorcheck",
        type: "POST",
        contentType: "application/json; charset-utf-8",
        data: JSON.stringify({user_nickname: user_nickname}),
        success: function (data) {
            if(data) {
                console.log(data);
                document.getElementById('diary').style.fontFamily = data;
            }
        },
        error: function () {
            alert("Font color check err");
        }
    })

    // 쿠키 가져오기 함수
    function getCookie() {
        cName = 'userCookie' + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cName);
        var cValue = '';
        if(start != -1){
            start += cName.length;
            var end = cookieData.indexOf(';', start);
            if(end == -1)end = cookieData.length;
            cValue = cookieData.substring(start, end);
        }
        return unescape(cValue);
    }
    //---------------------------------------------------------------

    $("#menu_img").on("click",function() {
        $("#info_specific_title").html("<h4>대표 이미지 변경</h4>");
        $("#info_specific_details").html(
            "<div class='img_change_box'><h5>프로필 사진 변경</h5><br><div class='img_change_box_content'>" +
                "<div class='img_change_box_content_img'><img src='/css/img/cat.png' width='100px' height='100px'></div>" +
                "<div class='img_change_box_content_btn'>" + "<div class='img_change_box_content_btn_src'>이미지 파일 불러오기</div>" + "<div class='img_change_box_content_btn_btn'>" +
                "<button class='btn btn-info' type='button'>불러오기</button></div>" + "</div></div></div>" +
            "<div class='img_change_box'><h5>배경(대표)사진 변경</h5><br><div class='img_change_box_content'>" +
                "<div class='img_change_box_content_img'><img src='/css/img/cat.png' width='100px' height='100px'></div>" +
                "<div class='img_change_box_content_btn'>" +"<div class='img_change_box_content_btn_src'>이미지 파일 불러오기</div>" + "<div class='img_change_box_content_btn_btn'>" +
                "<button class='btn btn-info' type='button'>불러오기</button></div>" + "</div></div></div>"            );
    })

    $("#menu_user").on("click",function() {
        $("#info_specific_title").html("<h4>사용자 정보</h4>");
        $("#info_specific_details").html("<div id='info_specific_userinfo_box'>" +
            "<div class='info_specific_userinfo_content'><div>MBTI</div><input id='info_specific_userinfo_content_mbti' type='text' placeholder='영어 대문자 4자로 입력해주세요.'></div>" +
            "<div class='info_specific_userinfo_content'><div>별자리</div><input id='info_specific_userinfo_content_astro' type='text' placeholder='00자리'></div>" +
            "<div class='info_specific_userinfo_content'><div>혈액형</div><input id='info_specific_userinfo_content_btype' type='text' placeholder='0형'></div>" +
            "<div class='info_specific_userinfo_content'><div>좋아하는 색</div><input id='info_specific_userinfo_content_favclr' type='text' placeholder='20자 이내로 자유롭게 입력해주세요.'></div>" +
            "<div class='info_specific_userinfo_content'><div>생일</div><input id='info_specific_userinfo_content_bday' type='text' placeholder='년월일 순으로 8자로 입력해주세요(ex.19990101)'></div>" +
            "<div class='info_specific_userinfo_content'><div>성별</div><input id='info_specific_userinfo_content_gender' type='text' placeholder='8자 이내로 입력해주세요.'></div>" + "</div>" +
            "<div id='info_specific_userinfo_button_box'><button id='info_submit' onclick='infoSubmit()'>바꾸기</button></div>");

        //이미 입력된 info가 있으면 불러오기
        $.ajax({
            url: "/user/userinfocheck",
            type: "POST",
            contentType: "application/json; charset-utf-8",
            data: JSON.stringify({user_nickname: user_nickname}),
            success: function (data) {
                if(data != null) {
                    if(data[0] != ""){
                        console.info(data[0]);
                        document.getElementById('info_specific_userinfo_content_mbti').value = data[0];
                    }
                    if(data[1] != ""){
                        console.info(data[1]);
                        document.getElementById('info_specific_userinfo_content_astro').value = data[1];
                    }
                    if(data[2] != ""){
                        console.info(data[2]);
                        document.getElementById('info_specific_userinfo_content_btype').value = data[2];
                    }
                    if(data[3] != ""){
                        console.info(data[3]);
                        document.getElementById('info_specific_userinfo_content_favclr').value = data[3];
                    }
                    if(data[4] != ""){
                        console.info(data[4]);
                        document.getElementById('info_specific_userinfo_content_bday').value = data[4];
                    }
                    if(data[5] != ""){
                        console.info(data[5]);
                        document.getElementById('info_specific_userinfo_content_gender').value = data[5];
                    }
                }
            },
            error: function () {
                alert("user info check err");
            }
        })
    })

    //사용자 정보 처리------------------------------------------------------
    function infoSubmit() {
        const userinfo_mbti = document.getElementById('info_specific_userinfo_content_mbti').value;
        const userinfo_astro = document.getElementById('info_specific_userinfo_content_astro').value;
        const userinfo_btype = document.getElementById('info_specific_userinfo_content_btype').value;
        const userinfo_favclr = document.getElementById('info_specific_userinfo_content_favclr').value;
        const userinfo_bday = document.getElementById('info_specific_userinfo_content_bday').value;
        const userinfo_gender = document.getElementById('info_specific_userinfo_content_gender').value;
        $.ajax({
            url: "/user/infoinsert",
            type: "POST",
            contentType: "application/json; charset=EUC-KR",
            data: JSON.stringify({
                "user_nickname": user_nickname,
                "userinfo_mbti": userinfo_mbti,
                "userinfo_astro": userinfo_astro,
                "userinfo_btype": userinfo_btype,
                "userinfo_favclr": userinfo_favclr,
                "userinfo_bday": userinfo_bday,
                "userinfo_gender": userinfo_gender
            }),
            success: function () {
                alert("사용자 정보가 수정되었습니다.");
                window.location.reload()
            },
            error: function () {
                alert("Info Insert err");
            }
        })
    }


    $("#menu_password").on("click",function() {
        $("#info_specific_title").html("<h4>비밀번호 변경</h4>");
        $("#info_specific_details").html("<div class='info_specific_pwalter_content' ><div>기존 비밀번호</div><input id='info_specific_pwalter_before' type='password'></div>" +
            "<div class='info_specific_pwalter_content'><div>새 비밀번호</div><input id='info_specific_pwalter_new' type='password'></div>" +
            "<div class='info_specific_pwalter_content'><div>비밀번호 확인</div><input id='info_specific_pwalter_check' type='password'></div>" +
            "<div id='info_specific_pwalter_button_box'><button id='pwchangebtn' class='btn btn-info' type='button'>바꾸기</button></div>");
    })

    $("#menu_friend").on("click",function() {
        $("#info_specific_title").html("<h4>친구 관리</h4>");
        $("#info_specific_details").html("<div id='info_specific_friendmanage_list'><h5>친구 목록</h5>" +
            "<div id='friendlist_box'>" +
            "<ul>" +
                "<li><div class='friend_name'>친구1</div></li>" +
                "<li><div class='friend_name'>친구2</div></li>" +
                "<li><div class='friend_name'>친구3</div></li>" + "</ul>" +
            "</div></div>" +
            "<div id='info_specific_friendmanage_new'><h5>친구 신청</h5>" +
            "<div id='new_friendlist_box'>" +
            "<div class='new_friend_obj'><div>신청 친구1</div><button class='new_friend_accept_btn'>수락</button><button class='new_friend_refuse_btn'>거절</button></div>" +
            "<div class='new_friend_obj'><div>신청 친구2</div><button class='new_friend_accept_btn'>수락</button><button class='new_friend_refuse_btn'>거절</button></div>" +
            "<div class='new_friend_obj'><div>신청 친구3</div><button class='new_friend_accept_btn'>수락</button><button class='new_friend_refuse_btn'>거절</button></div>" +
            "<div class='new_friend_obj'><div>신청 친구3</div><button class='new_friend_accept_btn'>수락</button><button class='new_friend_refuse_btn'>거절</button></div>" +
            "<div class='new_friend_obj'><div>신청 친구3</div><button class='new_friend_accept_btn'>수락</button><button class='new_friend_refuse_btn'>거절</button></div>" +
            "<div class='new_friend_obj'><div>신청 친구3</div><button class='new_friend_accept_btn'>수락</button><button class='new_friend_refuse_btn'>거절</button></div>" +
            "<div class='new_friend_obj'><div>신청 친구3</div><button class='new_friend_accept_btn'>수락</button><button class='new_friend_refuse_btn'>거절</button></div>" +
            "</div></div>");
    })

</script>

<script type="text/javascript" src="/bootstrapjs/bootstrap.js"></script>
</body>
</html>