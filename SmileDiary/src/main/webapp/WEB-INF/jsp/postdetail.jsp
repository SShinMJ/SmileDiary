<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.-1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/post_detail_style.css">
    <title>${board.board_title}</title>
    <style type="text/css">
        body {
            margin: 10px;
        }

        .likebtn {
            background-color: transparent;
            border: none;

        }

        .likebtn :hover {
            transform: scale(1.1);
        }
    </style>
</head>
<script
        src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous">
</script>
<script type="text/javascript">
    function viewLike() {
        $.ajax({
            url: '/likeview',
            type: 'post',
            async: true,
            data: {'board_id': ${board.board_id}}, // board_id 보냄
            dataType: 'json', // data가 json타입
            success: function (data) {
                var a = '';
                if (data.cnt == 1) {   // 현재 로그인 유저가 포스팅 좋아요를 눌렀음
                    a += '<button type="button" id="like" class="likebtn" onclick="deleteLike();">' // deleteLike는 밑에서
                    a += '<img class="likeimg" src="/css/img/heart1.png" alt="" style="width: 20px; height: auto;"></button> <br />'
                } else if (data.cnt == 0) { // 안눌렀음
                    a += '<button type="button" id="like" class="likebtn" onclick="insertLike();">' // insertLike는 위에서
                    a += '<img class="likeimg" src="/css/img/heart2.png" alt="" style="width: 20px; height: auto;"></button> <br />'
                }
                a += '<span class="glyphicon glyphicon-BReply" aria-hidden="true"></span> <br />'
                a += '<span><b>' + data.total_cnt + '</b></span>' // 총 좋아요 개수
                $('.like').html(a); // <div class="like></div> 이부분에 나타남
            }
        });
    }

    function insertLike() {
        $.ajax({
            // onclick="insertLike('+ id +');
            url: '/updatelike',
            type: 'post',
            data: {'board_id': ${board.board_id}}, // board_id 보냄
            dataType: 'json', // data가 json타입
            success: function (data) {
                if (data == 1)
                    viewLike();
            }
        });
    }

    function deleteLike() {
        $.ajax({
            url: '/deletelike',
            type: 'post',
            data: {'board_id': ${board.board_id}}, // board_id 보냄
            dataType: 'json', // data가 json타입
            success: function (data) {
                if (data == 1)
                    viewLike();
            }
        });
    }

    $(document).ready(function () {
        viewLike();

        $.ajax({
            url: '/user/cookiecheck',
            type: 'POST',
            contentType: 'application/json; charset=EUC-KR',
            success: function (data) {
                if (!data) {
                    console.log('로그인이 되어있습니다.');
                }
            },
            error: function () {
                alert('err');
            }
        })
        $('#updateBtn').click(function () {
            var to_edit = '/board/post/edit/' + ${board.board_id};
            location.href = to_edit;
        })
        $("#deleteBoard").click(function () {
            alert('deleteBoard');
            console.log(${board.board_id});
            $.ajax({
                url: '/postdelete',
                type: 'POST',
                contentType: 'application/json; charset=EUC-KR',
                data: JSON.stringify({'board_id':  ${board.board_id}}),
                success: function () {
                    goBoardPage();
                }
            })
        })

    });

    function goBoardPage() {
        location.href = "/board/listpage";
    }

    function fileDownload(fileName, user_email, board_datetime) {

        $.ajax({
            url: '/api/download/' + fileName,
            type: 'post',
            data: {'user_email': user_email, 'board_datetime': board_datetime},
            success: function () {
                console.log('파일 다운로드');
                alert('파일 다운로드');
            },
            error: function () {
                alert('err');
            }
        })

    }

</script>
<body>
<div>
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
            <div class="page" id="left_page">
                <div class="board_top">
                    <div class="board_title">${board.board_title}</div>
                    <div id="datetime" class="board_date">
                        ${board.board_datetime}
                    </div>
                </div>
                <div id='content' class='board_content'>
                    ${board.board_content}
                </div>
                <c:if test="${!empty board.board_file_name}">
                <div>
                    <img class="board-img" src="/board/storage/${fileName}" width="250px" height="auto">
                    <img class="board-img" src="${fileUrl}" width="250px" height="auto">
                </div>
                </c:if>
                    <div class="like"></div>
                <!-- 파일 다운로드 test -->
                <div class="btn_container">
                <button type="button" class="btn btn-default" id="board_btn"
                        onclick="location.href='/board/listpage'">
                    목록
                </button>
                <c:if test="${board.user_email eq user_email}">
                    <button type="button" class="btn btn-default" id="updateBtn">글 수정</button>
                    <button type="button" class="btn btn-default" id="deleteBoard" value="삭제">삭제</button>
                </c:if>
                <c:if test="${!empty board.board_file_name}">
                <button class='btn btn-default' onclick="fileDownload('${board.board_file_name}','${board.user_email}','${board.board_datetime}')">
                    파일 다운로드
                </button>
                </c:if>
                </div>
            </div>
            <!--  댓글  -->
            <div class="page" id="right_page">
                <div class="reply_container">
                    <h3>댓글</h3>
                    <!--  댓글  -->
                    <div class="container-fluid" style="margin-bottom: 10px;">
                        <form name="insertReplyForm">
                            <div class="input-BReply-group" style="display: flex; flex-direction: row;">
                                <!--class="input-group"-->
                                <input type="hidden" name="board_id" value="${board.board_id}"/>
                                <input type="hidden" name="user_email" value="${board.user_email}"/>
                                <input type="text" class="form-control" id="reply_content" name="reply_content"
                                       placeholder="내용을 입력하세요." style='width:380px;' required>
                                <input type="checkbox" id="reply_secret" name="reply_secret" value="1">비밀글</span>
                                <button class="btn btn-default" type="button" name="insertReplyBtn">등록</button>
                            </div>
                        </form>
                    </div>

                    <div class="container-fluid">
                        <div class="listReply"></div>
                    </div>
                    <%@ include file="reply.jsp" %>
                </div>
            </div>
            <div id="category">
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
                //document.getElementsByClassName("page")[1].style.backgroundColor = page_color;
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
</script>
</body>
</html>