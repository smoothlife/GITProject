<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GitProject</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/login.css">
</head>
<body>
	<c:choose>
		<c:when test="${login_id!=null}">
			<div class="container px-4 py-5 m-auto fullscreen">
	            <div class="d-flex" style="justify-content: center;" >
	                <button class="btn btn-white" id="toMypage" type="button">마이페이지</button>
	                <button class="btn btn-white ml-3 mr-3" id="toBoard" type="button">와글게시판</button>
	                <button class="btn btn-white" id="toLogout" type="button">Logout</button>
	            </div>
	            <div class="d-flex" style="justify-content: center;">
	            	<button class="btn-block btn-color1" id="toResign" type="button" style="max-width: 300px;">회원탈퇴</button>
	            </div>
	        </div>
	        <script type="text/javascript">
			document.getElementById("toLogout").onclick = function() {
				if (confirm("로그아웃 하시겠습니까?")) {
					location.href = "/member/logout.mem";
				}
			}
			document.getElementById("toResign").onclick = function() {
				location.href = "/member/resignView.mem";
			}
			document.getElementById("toMypage").onclick = function() {
				location.href = "#";
			}
			document.getElementById("toBoard").onclick = function() {
				location.href = "#";
			}
	        </script>
		</c:when>
		<c:otherwise>
			<div class="container px-4 py-5 m-auto fullscreen">
				<div class="card card0 h-100">
					<div class="d-flex flex-lg-row flex-column-reverse h-100">
						<div class="card card1 container">
							<div class="row justify-content-center my-auto">
								<div class="col-md-8 col-10 my-5">
									<div class="row justify-content-center px-3 mb-3">
										<div class="loginLogo"></div>
									</div>
									<h3 class="mb-5 text-center heading">와글와글 v2</h3>
									<form action="/member/login.mem" method="post">
										<div class="form-group">
											<label class="form-control-label text-muted">아이디</label> <input
												type="text" id="id" name="id" placeholder="아이디를 입력하세요"
												class="form-control">
										</div>
										<div class="form-group">
											<label class="form-control-label text-muted">비밀번호</label> <input
												type="password" id="pw" name="pw" placeholder="비밀번호를 입력하세요"
												class="form-control">
										</div>
										<div class="row justify-content-center my-3 px-3">
											<button id="login" class="btn-block btn-color"
												style="margin-top: 1rem">와글와글 로그인</button>
										</div>
									</form>

									<div id="signin" class="row justify-content-center my-3 px-3">
										<button id="signin" class="btn-block btn-white">회원가입</button>
									</div>
									<div id="findPw" class="row justify-content-center my-2">
										<a href="#"><small class="text-muted">비밀번호를 잊으셨나요? -미개발</small></a>
									</div>
								</div>
							</div>
						</div>
						<div class="card card2">
							<div class="my-auto mx-md-5 px-md-5 right">
								<h3>3조입니다.</h3>
								<small class="text-main">요즘들어 날이 춥네요. 와글게시판에서 게시글 하나 남기고
									가세요..</small>
								<button class="btn btn-outline-dark" id="btn_board" onclick="btn_board()">게시판</button>
								<script>
									function btn_board(){
										location.href="/board/toboard.board?cpage=1";
									}
								</script>
							</div>
						</div>
					</div>
				</div>
			</div>
			<script>
			document.getElementById("signin").onclick = function() {
				location.href = "/member/join.mem";
			}
			document.getElementById("findPw").onclick = function() {
				location.href = "/member/findPw.mem";
			}
		</script>
		</c:otherwise>
	</c:choose>
</body>
</html>