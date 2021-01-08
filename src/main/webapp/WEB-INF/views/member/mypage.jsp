<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<style>
body {
	color: #000;
	overflow-x: hidden;
	height: 100%;
	width: 100%;
	background-image: linear-gradient(to right, #ee9ca7, #ffdde1);
	background-repeat: no-repeat;
}

.container {
	width: 550px;
	border: border: 1px solid pink;
	border-radius: 10px;
	margin: auto;
	margin-top: 50px;
	background-color: white;
	padding: 20px;
	margin-bottom: 100px;
}

.row {
	border: 1px solid pink;
	padding-top: 4px;
	padding-bottom: 4px;
}

.col-4 {
	border-right: 1px solid pink;
}

.text-center {
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class=container>
		<h2 class="text-center">마이페이지</h2>
		<form action="/member/join.mem">
			<div class="row">
				<div class="col-4">아이디 :</div>
				<div class="col-8">${dto.id }</div>
			</div>
			<div class="row">
				<div class="col-4">이름 :</div>
				<div class="col-8">${dto.name }</div>
			</div>
			<div class="row">
				<div class="col-4">이메일 :</div>
				<div class="col-8">${dto.email }</div>
			</div>
			<div class="col-12 text-center">
				<input type=button value="정보 수정" id=revise> <input
					type=button value="홈으로" id=home>
				<script>
					$("#home").click(function() {
						location.href = "/";
					})
					$("#revise").click(function() {
						location.href = "/member/toRevisePage.mem";
					})
				</script>
			</div>
		</form>
	</div>
</body>
</html>