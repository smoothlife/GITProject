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
.container {
	width: 550px;
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
		<form action="/member/join.mem" method=post id=form>
			<div class="row">
				<div class="col-4">아이디 :</div>
				<div class="col-8">
					<input type=text name=id id=id required> <input type=button
						value="중복확인" id=idDupleCk>
					<input type="hidden" value="false" id=dpFlag>
					<div id="dupleResult"></div>
				</div>
				<script>
					let dupleResult = document.getElementById("dupleResult");
					let dpFlag = document.getElementById("dpFlag");
					$("#idDupleCk").click(function() {
						$.ajax({
							url : "/member/idDupleCk.mem",
							type : "get",
							data : {
								id : $("#id").val()
							}
						}).done(function(resp) {
							if(resp == "이미 존재하는 아이디입니다."){
								dupleResult.innerHTML = resp;
								dpFlag.value=false;
							}else{
								dupleResult.innerHTML = resp;
								dpFlag.value=true;
							}
						})
					})
				</script>
			</div>
			<div class="row">
				<div class="col-4">이름 :</div>
				<div class="col-8">
					<input type=text name=name required>
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
					<input type=password id=pwck required>
					<input type=hidden id=pwFlag value="false">
					<span id="pwckResult"></span>
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
					console.log(pw);
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
					let dpFlag = document.getElementById("dpFlag");
					if(dpFlag.value == "false"){
						alert("아이디 중복여부를 해주세요.");
						return false;
					}
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
					<input type=text name=email required>
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