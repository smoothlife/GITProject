<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <style>
            *{box-sizing: border-box}
            div{
                border: 1px solid gray;
            }
        </style>
    </head>
    <body>
        <!--게시판 글 읽기-->
        <div class="container">
            <div class="row" style="height: 100px;">
               		 여기는 게시물이 있는 곳입니다.
            </div>
        </div>

        <!--게시판 댓글읽기-->
        <!--내 댓글이면 수정,삭제 버튼이 있다.-->
        <!--writerId-->
        <div class="container" id="commentContainer">
            <!--댓글 한줄이 forEach로 반복출력-->
            <div class="row" id="commentDiv1" style="height: 100px;">
                	댓글내용
            </div>
            <div class="row">
                <div class="col-9"></div>
                <div class="col-3">
                    <button class="btn btn-outline-primary btn-sm" onclick="updateComment()">수정</button>
                    <button class="btn btn-outline-danger btn-sm" onclick="deleteComment()">삭제</button>
                </div>
            </div>
            <div class="row" id="commentDiv2" style="height: 100px;">    
                댓글내용
            </div>
            <div class="row">
                <div class="col-9"></div>
                <div class="col-3">
                    <button class="btn btn-outline-primary btn-sm" onclick="updateComment()">수정</button>
                    <button class="btn btn-outline-danger btn-sm" onclick="deleteComment()">삭제</button>
                </div>
            </div>
        </div>

        <!--게시판 댓글쓰기-->
        <form action="">
            <div class="container">
                <div class="row" style="height: 100px;">
                    <input type="text" id="comment-contents">
                </div>
                <div class="row">
                    <div class="col-10"></div>
                    <div class="col-2">
                        <button class="btn btn-primary btn-sm" onclick="writeComment()">작성</button>
                    </div>
                </div>
            </div>
        </form>

        <script>
            $(function() {
                getCommentList();
            });

            /*ajax로 댓글쓰기*/
            function writeComment(){
                var contents = $('#comment-contents').val();
                if(contents.length==0){
                    return;}
                console.log("contents = " + contents);
                $.ajax({
                    data: 
                    {contents : contents,
                     boardSeq : ${boardSeq}
                },
                       type: "post",
                       url: "/comment/writeComment.comment",
                       success: function(data){
                    console.log(data);
                    console.log("입력성공!");
                    /*다시 댓글리스트를 불러와야한다.*/
                    //getCommentList();
                }
            })

            }
            /*수정버튼을 눌렀을 때 수정페이지로 이동하는게 아니라 div가 input type text로 바뀌어야한다.*/
            function toUpdateComment(){

            }

            /*ajax로 댓글수정*/
            function updateComment(){

            }

            /*ajax로 댓글삭제*/
            function deleteComment(){

            }

            /*ajax로 댓글리스트 불러오기*/
            function getCommentList() {
                $.ajax({
                    type : 'POST',
                    url : "/comment/getListComment.comment",
                    dataType : "json",
                    data :  $("#addcommentForm").serialize(), //이게 뭐지...
                    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
                    success : function(data) {
                        console.log("댓글불러오기 도착!");
                        var html = "";
                        if (data.length > 0) {
                            for (i = 0; i < data.length; i++) {	
                                html += "<input type=hidden class=getboard_seq name=board_seq value="+data[i].board_seq+">"; 
                                html += "<div id=commentsContainer"+data[i].seq+">";
                                html += "<div id=commmnts"+data[i].seq+" class=comments>";
                                html += "<div class=main_cheader>";
                                html += "<div class=main_cprofile>";
                                html += "<div class=main_cphoto><img src="+data[i].imgURL+"/></div>";
                                html += "<div class=main_cwriter>"
                                    + data[i].writer_id + "</div>";
                                html += "<div class=main_cwrite_date>"
                                    + data[i].write_date + "</div>";
                                html += "<div class=main_cbtnbox>";
                                html += "<button type=button class=main_cbtnwritecomment onclick=openWrite("
                                    + data[i].seq + ")>답글</button>";
                                if(data[i].auth>0){
                                    html += "<button type=button id=main_cbtnmod"+data[i].seq+" class=main_cbtnmod onclick=fn_modMainComment("+data[i].seq+")>수정</button>";
                                    html += "<button type=button id=main_cbtndel"+data[i].seq+" class=main_cbtndel onclick=fn_delMainComment("+data[i].seq+")>삭제</button>";
                                };
                                html += "</div></div></div><div class=main_ccontents>";
                                html += "<div id=main_ccontents"+data[i].seq+" class=main_ccontent>"
                                    + data[i].contents + "</div>";
                                html += "<div class=main_closecomment>";
                                if(data[i].childCnt > 0 ){
                                    html += "<span id=sub_close"+data[i].seq+" class=sub_close onclick=openCloseComment2("+data[i].seq+","+data[i].childCnt+")>댓글 숨기기 </span>"
                                }
                                html += "</div></div></div><div class=sub_write id=sub_write"+data[i].seq+" style=display:none>";
                                html += "<div class=sub_writecontent><textarea id=contents"+data[i].seq+" class=sub_writetextarea name=contents></textarea></div>";
                                html += "<input type=hidden id=comment_seq"+data[i].seq+" name=comment_seq value="+data[i].seq+">";
                                html += "<input type=hidden id=writer_id"+data[i].seq+" name=writer_id value="+data[i].writer_id+">";
                                html += "<div class=sub_wbtnbox><button type=button class=sub_add onclick=fn_addCommentDepth1("
                                    + data[i].seq
                                    + ")>작성<button type=button class=sub_cancel id=sub_cancel"
                                    + data[i].seq
                                    + " onclick=closeWrite("
                                    + data[i].seq
                                    + ")>취소</button></div></div></div>";
                                html += "<div id=sub_hide"+data[i].seq+"></div>";
                                getCommentList2(data[i].seq);
                                $("#commentForm").html(html);			
                            }
                        }else if(data.length==0){
                            $("#commentForm").html("");
                        }
                    }
                });
            }

        </script>
    </body>
</html>