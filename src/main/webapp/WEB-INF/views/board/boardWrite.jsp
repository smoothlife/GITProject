<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>BoardWrite</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
		<style>
			div {
				border: 1px solid gray;
			}
		</style>
	</head>
	<body>
		<form class="row g-3" action="/board/boardWriting.board" method="post">
			<div class="boardWrite-container">
				<div class="boardWrite-header">
					<h1>게시글 작성</h1>
				</div>
				<div class="boardWrite-body">
					<div class="boardWriteInputTitle mb-3">
						<label for="tilteInput" class="form-label">제목</label>
						<input type="text" class="form-control" id="tilteInput" name="title" placeholder="제목을 입력하세요.">
					</div>
					<div class="boardWriteInputContents mb-3">
						<label for="contentsInput" class="form-label">내용</label>
						<textarea class="form-control" id="contentsInput" name="contents" rows="10"></textarea>
					</div>
					<!--
					<div class="boardWriteInputFile mb-3">
						<label for="formFileMultiple" class="form-label">파일 첨부</label>
						<input class="form-control form-control-sm" type="file" id="formFileMultiple" name="file" multiple>
					</div>
					 -->
					<div class="boardWriteBtn col-12">
						<button type="submit" class="btn btn-primary">글쓰기</button>
						<button type="button" class="btn btn-primary" id="toBoardContentsView">목록으로</button>
					</div>
				</div>
			</div>
		</form>
		<script>
			document.getElementById("toBoardContentsView").onclick = function() {
				location.href = "/board/toboard.board?cpage=${cpage}"
			}
		</script>
	</body>
</html>