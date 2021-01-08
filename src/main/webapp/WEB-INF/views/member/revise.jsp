<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
.container {
	width: 500px;
	margin: auto;
	margin-top: 50px;
}

div {
	border: 1px solid pink;
}
</style>
</head>
<body>
	<div class=container>
		<h2 class="text-center">회원가입</h2>
		<form action="/member/revise.mem" method=post>
			<div class="row">
				<div class="col-4">아이디 :</div>
				<div class="col-8">
					${dto.id }
				</div>
			</div>
			<div class="row">
				<div class="col-4">이름 :</div>
				<div class="col-8">
					<input type=text name=name value=${dto.name } required>
				</div>
			</div>
			<div class="row">
				<div class="col-4">비밀번호 :</div>
				<div class="col-8">
					<input type=password name=pw required>
				</div>
			</div>
			<div class="row">
				<div class="col-4">비밀번호 확인 :</div>
				<div class="col-8">
					<input type=password name=pwck required>
				</div>
			</div>
			<div class="row">
				<div class="col-4">이메일 :</div>
				<div class="col-8">
					<input type=text name=email value=${dto.email} required>
				</div>
			</div>
			<div class=row>
				<div class="col-12 text-center">
					<input type=submit>
				</div>
			</div>
		</form>
	</div>
</body>
</html>