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

    input[type="text"],
    textarea {
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
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        float: right;
    }

    #subBtn:hover {
        background-color: #0056b3;
    }
</style>
<body>

<h2><b>ASK US</b></h2>

<form method="post" action="/write">
    <div class="form-group">
        <label for="title">TITLE</label>
        <input type="text" id="title" name="title" required>
    </div>
    
    <div class="form-group">
        <label for="writer">WRITER</label>
        <input type="text" id="writer" name="writer" required>
    </div>
    
    <div class="form-group">
        <label for="ph">Ph.</label>
        <input type="text" id="ph" name="ph" required>
    </div>
    
    <div class="form-group">
        <label for="content">CONTENT</label>
        <textarea id="summernote" name="content" required></textarea>
    </div>
    
    <input id="subBtn" type="submit" value="글 작성">
</form>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/summernote-ko-KR.js"></script>
<script>
    $(document).ready(function() {
        $('#summernote').summernote({
            placeholder: '내용을 입력하세요...',
            minHeight: 300,
            maxHeight: 600,
            focus: true,
            lang: 'ko-KR'
        });
    });
</script>

</body>
</html>
