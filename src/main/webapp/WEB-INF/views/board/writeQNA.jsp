<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>ASK US</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css"> --%>

</head>

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
}

h2 {
	text-align: center;
	margin-top: 50px;
}

form {
	width: 60%;
	margin: auto;
	background-color: #fff;
	border-radius: 10px;
	padding: 30px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

label {
	font-weight: bold;
	color: #555;
}

input[type="text"], textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ced4da;
	border-radius: 4px;
	box-sizing: border-box;
	font-size: 16px;
}

textarea {
	min-height: 200px;
	resize: vertical;
}

#subBtn {
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
	float: right;
}
</style>
<body>

	<h2>
		<b>Q&A</b>
	</h2>

	<form method="post" id="qnaForm" novalidate enctype="multipart/form-data">
		<div class="form-group">
			<label for="qtitle">제목</label> <input type="text" id="qtitle" name="qtitle" required>
		</div>

		<div class="form-group">
			<label for="quid">작성자</label> <input type="text" id="quid" name="quid" required>
		</div>

		<div class="form-group">
			<label for="qcontent">내용</label>
			<textarea id="qcontent" class="summernote" name="qcontent" required></textarea>
		</div>
		<div>
			<input class="btn btn-dark mt-2" id="subBtn" type="submit" value="글 작성"> <input class="btn btn-dark mt-2" id="subBtn" type="button" value="취소">
		</div>
	</form>

	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/summernote-ko-KR.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/writeQNA.js"></script>
	<script>
    $(document).ready(function() {
      $('.summernote').summernote({
      placeholder : '내용을 입력하세요...',
      minHeight : 300,
      maxHeight : 600,
      focus : true,
      lang : 'ko-KR',
      toolbar : [
      // 글꼴 설정
      [ 'fontname', [ 'fontname' ] ],
      // 글자 크기 설정
      [ 'fontsize', [ 'fontsize' ] ],
      // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
      [ 'style', [ 'bold', 'italic', 'underline', 'strikethrough', 'clear' ] ],
      // 글자색
      [ 'color', [ 'forecolor', 'color' ] ],
      // 표만들기
      [ 'table', [ 'table' ] ],
      // 글머리 기호, 번호매기기, 문단정렬
      [ 'para', [ 'ul', 'ol', 'paragraph' ] ],
      // 줄간격
      [ 'height', [ 'height' ] ],
      // 그림첨부, 링크만들기, 동영상첨부
      [ 'insert', [ 'picture', 'link', 'video' ] ],
      // 코드보기, 확대해서보기, 도움말
      [ 'view', [ 'codeview', 'fullscreen', 'help' ] ] ],
    	callbacks : {
    		onImageUpload : function(files, editor, welEditable) {     
    			for (var i = 0; i < files.length; i++) {
    				sendFile(files[i], this);
    			}
    		}
    	}
    });

    function sendFile(file, editor) {
    	var form_data = new FormData();
    	form_data.append('file', file);
    	$.ajax({
    		data : form_data,
    		type : "POST",
    		url : 'boardImages',
    		cache : false,
    		contentType : false,
    		enctype : 'multipart/form-data',
    		processData : false,
    		success : function(url) {
    			$(editor).summernote('insertImage', url, function($image) {
    				$image.css('width', "25%");
    			});
    		}
    	});
    }
    });
  </script>

</body>
</html>
