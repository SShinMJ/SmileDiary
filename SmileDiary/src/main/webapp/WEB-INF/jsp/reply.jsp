<script type="text/javascript">

    let board_id = '${board.board_id}'; //게시글 번호

    $('[name=insertReplyBtn]').click(function () { //댓글 등록 버튼 클릭시
        var insertData = $('[name=insertReplyForm]').serialize(); //insertReplyForm의 내용을 가져옴
        insertReply(insertData); //Insert 함수호출(아래)
    });

    //댓글 목록 
    function listReply(board_id, page) {
        $.ajax({
            url: '/reply/list',
            type: 'get',
            data: {'board_id': board_id, 'page': page},
            success: function (data) {
                let page = data.page;
                let start_page = data.start_page;
                let end_page = data.end_page;
                let list = data.list;
                let a = '';
                /*console.log(data);*/

                $.each(list, function (key, value) {
                    /*console.log("data : " + list);
                    console.log(page + "," + start_page + "," + end_page);
                    console.log("start : " + start_page);
                    console.log("end : " + end_page);*/

                    a += '<div class="replyArea" style="border:0.5px dashed darkgray; padding:10px; margin-bottom: 15px; background-color: white; line-height: 2.2;">';
                    a += '<input type="hidden" class="id-control" name="id_' + value.reply_id + '" value="' + value.user_email + '"/>'
                    a += '<div class="replyInfo' + value.reply_id + '">' + '작성자 : ' + value.user_email;
                    a += '<div class="replyContent' + value.reply_id + '"> 내용 : ' + value.reply_content;
                    if (data.now_user_email == value.user_email) {
                        a += '<br><a class="btn-default" onclick="updateReply(' + value.reply_id + ',\'' + value.reply_content + '\');"> 수정 </a>';
                        a += '<a class="btn-default"  onclick="deleteReply(' + value.reply_id + ');"> 삭제 </a>';
                    }
                    a += '</div></div></div>';
                });

                for (let num = start_page; num <= end_page; num++) {
                    if (num == page) {
                        a += '<a class="button" href="#" onclick="listReply(' + board_id + ', ' + num + '); return false;">' + num + '</a>';
                    } else {
                        a += '<a class="button" href="#" onclick="listReply(' + board_id + ', ' + num + '); return false;">' + num + '</a>';
                    }
                }

                $(".listReply").html(a);

            }
        });
    }

    //댓글 등록
    function insertReply(insertData) {
        if (!$('[name=reply_content]').val()) {
            alert("내용을 입력하세요!");
        } else {
            console.log("insertData : ", insertData);
            $.ajax({
                url: '/reply/insert',
                type: 'post',
                data: insertData,
                success: function (data) {
                    alert("댓글 등록");
                    console.log(insertData);
                    $('[name=reply_content]').val('');
                    listReply(); //댓글 작성 후 댓글 목록 reload
                    location.reload();
                }
            });
        }
    }

    //댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
    function updateReply(reply_id, reply_content) {
        console.log("updateReply");
        let a = '';

        a += '<div class="input-group">';
        a += '<input type="text" class="form-control" name="content_' + reply_id + '" value="' + reply_content + '"/>';
        a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="updateReplyProc(' + reply_id + ');">수정</button> </span>';
        a += '</div>';

        $('.replyContent' + reply_id).html(a);

    }

    //댓글 수정
    function updateReplyProc(reply_id) {
        let updateContent = $('[name=content_' + reply_id + ']').val();

        console.log("updateReplyProc");

        if (!updateContent) {
            alert("내용을 입력하세요!");
        } else {
            $.ajax({
                url: '/reply/update',
                type: 'post',
                data: {'reply_content': updateContent, 'reply_id': reply_id},
                success: function (data) {
                    alert('댓글 수정');
                    listReply(board_id); //댓글 수정후 목록 출력
                }
            });
        }
    }

    //댓글 삭제 
    function deleteReply(reply_id) {
        $.ajax({
            url: '/reply/delete/',
            type: 'post',
            data: {'reply_id': reply_id},
            success: function (data) {
                alert('댓글 삭제');
                location.reload();
                listReply(board_id); //댓글 삭제 후 목록 출력
            }
        });
    }

    $(document).ready(function () {
        listReply(board_id, 1); //페이지 로딩시 댓글 목록 출력
    });
</script>
