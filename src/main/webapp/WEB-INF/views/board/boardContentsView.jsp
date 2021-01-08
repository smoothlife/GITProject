<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board contents view</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<style>
* {
	box-sizing: border-box;
}

div {
	border: 1px solid gray;
}

.button {
	text-align: right;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row header">
			<div class="col-2 d-none d-md-block writer">${dto.writerId}</div>
			<div class="col-sm-12 col-md-8 title">${dto.title}</div>
			<div class="col-2 d-none d-md-block date">${dto.writeDate}</div>
		</div>
		<div class="row button">
			<div class="col">
				<c:if test="${isWriterContents>0}">
					<button type="button" onclick="fn_modify(${seq},${cpage})" class="btn btn-warning">글 수정</button>
					<button type="button" onclick="fn_delete()" class="btn btn-warning">글 삭제</button>
				</c:if>
				<button type="button" onclick="fn_toboardlistview(${cpage})" class="btn btn-warning">목록</button>
			</div>
		</div>
		<div class="row contents">
			<div class="col text">${dto.contents}</div>
		</div>
	</div>

	<!-- 의진 댓글추가 -->
	<div class="container" id="commentContainer">
		<form id="commentForm" name="commentForm" method="get">
			<input type="hidden" id="getboardSeq" name="boardSeq" value="${seq}">
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

</body>
<script>
   function fn_modify(seq,cpage){
      location.href="/board/contentsModify.board?seq"+seq+"&cpage="+cpage;
   }
   function fn_toboardlistview(cpage){
      location.href="/board/toboard.board?cpage="+cpage;
   }
   
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
           boardSeq : ${seq}
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
	   $.ajax({
           data: 
           {seq : seq},
           type: "post",
           url: "/comment/deleteComment.comment",
           success: function(data){
           console.log(data);
           console.log("삭제성공!");
           /*다시 댓글리스트를 불러와야한다.*/
           //getCommentList();
      	 }
  	 })
   }

   /*ajax로 댓글리스트 불러오기*/
   function getCommentList() {
       $.ajax({
           type : 'POST',
           url : "/comment/getListComment.comment",
           dataType : "json",
           data :  {boardSeq : ${seq}}, //boardSeq 를 넘겨줌
           contentType : "application/x-www-form-urlencoded; charset=UTF-8",
           success : function(data) {
              	console.log(data.length);
               var html = "";
               if (data.length > 0) {
                   for (i = 0; i < data.length; i++) {	
                       html += "<input type='hidden' id='getboardSeq' name='boardSeq' value="+${seq}+">";
                       html += "<input type='hidden' class='getSeq' name='seq' value="+data[i].seq+">";
                       html += "<div class='row' id='commentHeader"+data[i].seq+"'>";
                       html += "<div class='col-2' style='font-size: 16px;'>"+data[i].writerId+"</div>"
                       html += "<div class='col-3' style='font-size: 12px;'>"+data[i].writeDate+"</div>"
                       html += "<div class='col-4'></div>";
                       /* if 작성자와 현재 로그인한 사람이 같다면 보여줌 */
                       html += "<div class='col-3'>";
                       html += "<button class='btn btn-outline-primary btn-sm' id='btn-upd"+data[i].seq+"' onclick='toUpdateComment("+data[i].seq+")'>수정</button>";
                       html += "<button class='btn btn-outline-danger btn-sm' id='btn-del"+data[i].seq+"' onclick='deleteComment("+data[i].seq+")'>삭제</button>";
                       html += "</div>";
                       html += "</div>"
                       html += "<div class='row' id='commentDiv"+data[i].seq+ "style='height: 200px;'>";
                       html += data[i].contents;
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
</html>