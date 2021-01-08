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
		<h2 class="text-center">정보 수정</h2>
		<form action="/member/revise.mem" method=post id=form>
			<div class="row">
				<div class="col-4">아이디 :</div>
				<div class="col-8">${dto.id }</div>
			</div>
			<div class="row">
				<div class="col-4">이름 :</div>
				<div class="col-8">
					<input type=text name=name value="${dto.name }" required>
				</div>
			</div>
			<div class="row">
				<div class="col-4">비밀번호 :</div>
				<div class="col-8">
					<input type=password name=pw id=pw required>
				</div>
			</div>
			<div class="row">
				<div class="col-4">비밀번호 확인 :</div>
				<div class="col-8">
					<input type=password id=pwck required> <input type=hidden
						id=pwFlag value="false"> <span id="pwckResult"></span>
				</div>
			</div>
			<script>
			let pw = document.getElementById("pw");
			let pwck = document.getElementById("pwck");
			let pwckResult = document.getElementById("pwckResult");
			let pwFlag = document.getElementById("pwFlag");
			
			pw.oninput = function(){
				console.log(pw);
				if(pw.value == pwck.value){
					pwckResult.innerHTML = "비밀번호 일치";
					pwckResult.style.color = "black";
					pwFlag.value="true";
				}else{
					pwckResult.innerHTML = "비밀번호 불일치!!";
					pwckResult.style.color = "red";
					pwFlag.value="false";
				}
			}
			pwck.oninput = function(){
				if(pw.value == pwck.value){
					pwckResult.innerHTML = "비밀번호 일치";
					pwckResult.style.color = "black";
					pwFlag.value=true;
				}else{
					pwckResult.innerHTML = "비밀번호 불일치!!";
					pwckResult.style.color = "red";
					pwFlag.value=false;
				}
			}
			
			let form = document.getElementById("form");
			form.onsubmit = function() {
				let pwFlag = document.getElementById("pwFlag");
				if(pwFlag.value == "false"){
					alert("비밀번호가 일치하지 않습니다.");
					return false;
				}
				return true;
			}
			</script>
			<div class="row">
				<div class="col-4">이메일 :</div>
				<div class="col-8">
					<input type=text name=email value="${dto.email}" required>
				</div>
			</div>
			<div class="col-12 text-center">
				<input type=submit> <input type=button value="취소" id=cancel>
				<script>
					let cancel = document.getElementById("cancel");
					cancel.onclick = function(){
						location.href = "/member/toMyPage.mem"
					}
					</script>
			</div>
		</form>
	</div>
</body>
</html>