<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board contents view</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

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
					<button type="button" onclick="fn_modify(${dto.seq},${cpage})"
						class="btn btn-warning">글 수정</button>
					<button type="button" onclick="fn_delete(${dto.seq},${cpage})" class="btn btn-warning">글 삭제</button>
				</c:if>
				<button type="button" onclick="fn_toboardlistview(${cpage})" class="btn btn-warning">목록</button>
			</div>
		</div>
		<div class="row contents">
			<div class="col text">${dto.contents}</div>
		</div>
		<div class="row comment">댓글부분</div>
	</div>
</body>
<script>
	function fn_modify(seq,cpage){
		console.log(seq);
		console.log(cpage);
		location.href="/board/contentsModify.board?seq="+seq+"&cpage="+cpage;
	}
	function fn_delete(seq,cpage){
		console.log(seq);
		console.log(cpage);
		location.href="/board/delContents.board?seq="+seq+"&cpage="+cpage;
	}
	function fn_toboardlistview(cpage){
		location.href="/board/toboard.board?cpage="+cpage;
	}
    </script>
</html>