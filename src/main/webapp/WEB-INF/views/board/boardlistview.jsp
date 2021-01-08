<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
* {
	box-sizing: border-box;
	
}
</style>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-12 text-end">
				<button type=button class="btn btn-primary mt-5" onclick="toboardwrite(${cpage})">글쓰기</button>
			</div>
		</div>
		<div class="row">
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="col-md-1">#</th>
						<th class="col-md-6">글 제목</th>
						<th class="col-md-2">글 작성자</th>
						<th class="col-md-3">작성일</th>
					</tr>
				</thead>
					<c:forEach var="i" items="${list}">
						<tr>
							<td class="col-md-1">${i.seq}</td>
							<td class="col-md-6" onclick ="toboardreadview(${i.seq},${cpage})" style="cursor: pointer;">${i.title}</td>
							<td class="col-md-2">${i.writerId}</td>
							<td class="col-md-2">${i.writeDate}</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>
		<div class="row">
			<div class="pt-3">
				<ul class="pagination justify-content-center mb-0">
					${navi}
				</ul>
				<input type="hidden" id="getcpage" value="${cpage}" />
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col text-center">
				<input type="text" id=getsearchtitle /> <button class="btn btn-outline-dark mb-1 pt-1 pb-1" type=button onclick="fn_searchtitle(${cpage})">검색</button>
			</div>
		</div>
	</div>
	<script>
	
		$("#getsearchtitle").keydown(function(key) {
			var title = $("#getsearchtitle").val();
			var cpage = $("#getcpage").val();''
		if (key.keyCode == 13) {
			location.href="/board/boardsearchlist.board?cpage=1&title="+title;
		}else{
			return;
		}
		});

		function toboardreadview(seq,cpage){
			location.href="/board/toboardcontentsview.board?seq="+seq+"&cpage="+cpage;
		}
		function toboardwrite(cpage){
			location.href="/board/toboardwrite.board?cpage="+cpage;
		}
		function fn_searchtitle(cpage){
			var title = $("#getsearchtitle").val();
			location.href="/board/boardsearchlist.board?cpage=1&title="+title;
		}
	</script>
</body>
</html>