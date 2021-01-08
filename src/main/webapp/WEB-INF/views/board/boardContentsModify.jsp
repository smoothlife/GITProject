<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board contents modify</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

        <style>
            *{box-sizing: border-box;}
            div{border: 1px solid black;}
            .btn2{text-align: right;}
            #textarea{width: 100%;}
        </style>
</head>
<body>
	<div class="container">
		<form action="/board/contentsModifyDone.board" method="post">
			<div class="row header">
				<div class="col-2 d-none d-md-block writer">${bdto.writerId}</div>
				<div class="col-sm-12 col-md-8 title"><input type="text" name="title" id="title_box" value="${bdto.title}"></div>
				<div class="col-2 d-none d-md-block date">${bdto.writeDate}</div>
			</div>
			<div class="row contents">
				<div class="col text">
					<textarea id="textarea" name="contents"></textarea>
				</div>
			</div>
			<div class="row button">
				<div class="col btn1">
					<button type="submit" class="btn btn-warning">저장</button>
					<button type="button" class="btn btn-warning">삭제</button>
				</div>
				<div class="col btn2">
					<button type="button" class="btn btn-warning">목록</button>
				</div>
			</div>
			<div class="row comment">댓글</div>
		</form>
	</div>
</body>
<script type="text/javascript">
	$('#title_box').blur(function(){
		if($('#title_box').val() != null){
		    $('#title_box').val('');
		}
	}) 

</script>
</html>