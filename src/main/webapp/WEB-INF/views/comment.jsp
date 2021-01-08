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
            <form id="commentForm" name="commentForm" method="get">
				<input type="hidden" id="getboardSeq" name="boardSeq" value="${dto.seq}">
			</form>
        </div>

        <!--게시판 댓글쓰기-->
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
            
        <script>
            $(function() {
            	console.log("시작할 때 댓글목록을 불러옴.");
                getCommentList();
            });

            /*ajax로 댓글쓰기*/
            function writeComment(){
                var contents = $('#comment-contents').val();
                if(contents.length==0){
                    return;}
                $.ajax({
                    data: 
                    {contents : contents,
                    boardSeq : $('#getboardSeq').val()
                },
                       type: "post",
                       url: "/comment/writeComment.comment",
                       success: function(data){
                    console.log(data);
                    console.log("입력성공!");
                    $('#comment-contents').val("");
                    /*다시 댓글리스트를 불러와야한다.*/
                    getCommentList();
                }
            })

            }
            /*수정버튼을 눌렀을 때 수정페이지로 이동하는게 아니라 div가 input type text로 바뀌어야한다.*/
            function toUpdateComment(seq){
				
            }

            /*ajax로 댓글수정*/
            function updateComment(seq){
				
            }

            /*ajax로 댓글삭제*/
            function deleteComment(seq){
				
            }

            /*ajax로 댓글리스트 불러오기*/
            function getCommentList() {
                $.ajax({
                    type : 'POST',
                    url : "/comment/getListComment.comment",
                    dataType : "json",
                    data :  $("#commentForm").serialize(), //boardSeq 를 넘겨줌
                    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
                    success : function(data) {
                       	console.log(data.length);
                        var html = "";
                        if (data.length > 0) {
                            for (i = 0; i < data.length; i++) {	
                                html += "<input type=hidden class=getboardSeq name=boardSeq value="+data[i].boardSeq+">";
                                html += "<input type=hidden class=getSeq name=seq value="+data[i].seq+">"; 
                                html += "<div class='row' id='commentDiv"+data[i].seq+ "style='height: 200px;'>";
                                html += data[i].contents;
                                html += "</div>";
                                html += "<div class='row' id='buttonDiv"+data[i].seq+"'>";
                                html += "<div class='col-9'></div>";
                               	html += "<div class='col-3'>";
                                html += "<button class='btn btn-outline-primary btn-sm' id='btn-upd"+data[i].seq+"' onclick='toUpdateComment("+data[i].seq+")'>수정</button>";
                                html += "<button class='btn btn-outline-danger btn-sm' id='btn-del"+data[i].seq+"' onclick='deleteComment("+data[i].seq+")'>삭제</button>";
                                html += "</div>";
                                html += "</div>"; 
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