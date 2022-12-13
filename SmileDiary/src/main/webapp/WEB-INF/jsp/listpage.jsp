<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<c:set var="path" value="<%=request.getContextPath()%>" scope="application"/>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.-1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%--    <link rel="stylesheet" type="text/css" href="/css/post_detail_style.css">--%>
    <link rel="stylesheet" type="text/css" href="/css/board_page_style.css">
    <title>board_list_page</title>
</head>
<script
        src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous">
</script>
<script type="text/javascript">

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
                    alert("�α����� ���ּ���");
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
                    alert("�α׾ƿ� �Ǿ����ϴ�.");
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
</script>
<body>
<div class="container">
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
            <div class="page" id="both_page">
                <div style="margin: 10px">
                    <h2>�Խ���</h2>
                    <button type="button" id="writeBtn" class="btn btn-default" onclick="location.href='/postcreate'">��
                        ���
                    </button>
                    <br>
                    <label for="search_keyword"></label>
                    <input type="text" id="search_keyword" name="search_keyword">
                    <button type="button" id="search" name="search" class="btn btn-default">�˻�</button>
                </div>
                <table id="board_list" class="board_list" style="width:100%">
                    <thead> �� ���
                    <tr>
                        <th>�Խñ� ��ȣ</th>
                        <th>����</th>
                        <th>�ۼ���</th>
                        <th>���� ������</th>
                    </tr>
                    </thead>
                    <tbody id="board_tbody">
                    <!-- CONTENTS !-->
                    <c:set var="num" value="${pageMaker.total_count - ((pageMaker.cri.page-1) * 10) }"/>
                    <c:forEach var="board_list" items="${bd_list }" varStatus="status">
                        <tr>
                            <td>${num}<input type='hidden' name="board_ids" value="${board_list.board_id }"/></td>
                            <td>
                                <a href="/board/post/${board_list.board_id}">
                                    <span>${board_list.board_title }</span></a>
                            </td>
                            <td>${board_list.user_email }</td>
                                <%--                    <td>${board_list.board_datetime }</td>--%>
                            <td>${time_list[status.index]}</td>
                        </tr>
                        <c:set var="num" value="${num-1}"></c:set>
                    </c:forEach>
                    </tbody>
                </table>

                <ul class="pagination">
                    <c:if test="${pageMaker.prev}">
                        <li>
                            <a href="/board/listpage${pageMaker.makeQuery(pageMaker.start_page - 1)}">[����]</a>
                        </li>
                    </c:if>

                    <c:forEach begin="${pageMaker.start_page }" end="${pageMaker.end_page }" var="index">
                        <a href="/board/listpage${pageMaker.makeQuery(index)}">[${index }]</a>
                    </c:forEach>

                    <c:if test="${pageMaker.next }">
                        <li>
                            <a href="/board/listpage${pageMaker.makeQuery(pageMaker.end_page + 1)}">[����]</a>
                        </li>
                    </c:if>
                </ul>
            </div>
            <div id="category">
                <div id="category_item_container">
                    <div class="category_item" id="toBoard" onclick="toBoard()">
                        <label>�ϱ���</label>
                    </div>
                    <div class="category_item" id="toAlbum" onclick="toAlbum()">
                        <label>����ø</label>
                    </div>
                    <div class="category_item" id="toCalendar" onclick="toCalendar()">
                        <label>�޷�</label>
                    </div>
                    <div class="category_item" id="toTodo" onclick="toTodo()">
                        <label>�� ��</label>
                    </div>
                    <div class="category_item" id="toGuest" onclick="toGuest()">
                        <label>�����</label>
                    </div>
                    <div class="category_item" id="toSetting" onclick="toSetting()">
                        <label>����</label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    //��� �������� �߰�---------------------------------------------
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

    //�۲� �ҷ�����
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

    // ��Ű �������� �Լ�
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