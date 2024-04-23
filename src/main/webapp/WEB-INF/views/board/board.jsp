<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- JQuery 외부 라이브러리 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
</head>
<body>
	<h2 style="text-align: center;">글 작성</h2>
	<br>
	<br>
	<br>

	<div style="width: 60%; margin: auto;">
		<form method="post" action="/write">
			<input type="text" name="writer" style="width: 20%;" placeholder="작성자" /><br> <input type="text" name="title" style="width: 40%;" placeholder="제목" /> <br> <br>
			<textarea id="summernote" name="content"></textarea>
			<input id="subBtn" type="button" value="글 작성" style="float: right;" onclick="goWrite(this.form)" />
		</form>
	</div>
	<script>
    $(document).ready(function() {
      $('#summernote').summernote({
      placeholder : 'content',
      minHeight : 370,
      maxHeight : null,
      focus : true,
      lang : 'ko-KR'
      });
    });
  </script>
	<script src="${pageContext.request.contextPath}/resources/js/summernote-ko-KR.js"></script>
</body>
</html>