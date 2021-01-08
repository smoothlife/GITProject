<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GitProject</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/login.css">
</head>
<body>
	<div class="container px-4 py-5 m-auto fullscreen d-flex"
		style="align-items: center;">
		<div class="container col-11 col-sm-9 col-lg-6"
			style="min-width: 540px;">
			<h4 class="row m-2 mb-4">회원 탈퇴를 위해 비밀번호를 입력하세요.</h4>
			<form action="/member/resign.mem">
				<div class="form-group">
					 <input
						type="password" id="pw" name="pw" placeholder="비밀번호를 입력하세요"
						class="form-control">
				</div>
				<div class="row justify-content-center my-3 px-3">
					<button id="signout" class="btn-block btn-color1"
						style="margin-top: 1rem">회원탈퇴</button>
					<button type="button" id="toHome" class="btn-block btn-color1"
						style="margin-top: 1rem">뒤로가기</button>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	document.getElementById("toHome").onclick = function() {
		location.href = "/";
	}
	</script>
</body>
</html>