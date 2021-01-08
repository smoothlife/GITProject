<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button id="btn_board" onclick="btn_board()">게시판</button>
	<script>
		function btn_board(){
			location.href="/board/toboard.board?cpage=1";
		}
	</script>
</body>
</html>