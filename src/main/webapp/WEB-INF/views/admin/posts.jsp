<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<title>Admin</title>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">관리자 페이지</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin">대시보드</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/users">사용자 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/products">상품 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/shippings">배송 관리</a></li>
						<li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/admin/posts">게시글 관리</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<section class="card">
		<div class="d-flex justify-content-end me-5 mt-3 justify-content-sm-between">
			<h2 class="ms-4">게시글 관리</h2>

			<div>
				<input type="text" />
				<button>검색</button>
			</div>

		</div>


	</section>
	<section class="container mt-4">
		<div class="container mt-5">

			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th><button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#createPostModal">게시글 추가</button></th>
					</tr>
				</thead>
				<tbody>
					<%-- <c:set var="posts" value="${[{'id':1, 'title':'First Post', 'author':'ian', 'date':'2022-04-01'},{'id':2, 'title':'Second Post', 'author':'sunghwan', 'date':'2022-04-02'}]}" />
					 --%><c:forEach var="post" items="${posts}">
						<tr>
							<td>${post.id}</td>
							<td>${post.title}</td>
							<td>${post.author}</td>
							<td>${post.date}</td>
							<td>
								<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editPostModal${post.id}">수정</button>
								<button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deletePostModal${post.id}">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<!-- 각 게시글에 대한 수정 모달 -->
		<c:forEach var="post" items="${posts}">
			<div class="modal fade" id="editPostModal${post.id}" tabindex="-1" aria-labelledby="editPostModalLabel${post.id}" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="editPostModalLabel${post.id}">게시글 수정</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form>
								<div class="mb-3">
									<label for="postTitle${post.id}" class="form-label">제목</label> <input type="text" class="form-control" id="postTitle${post.id}" value="${post.title}">
								</div>
								<div class="mb-3">
									<label for="postContent${post.id}" class="form-label">내용</label>
									<textarea class="form-control" id="postContent${post.id}" rows="3">${post.content}</textarea>
								</div>
								<button type="submit" class="btn btn-primary">저장</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 삭제 확인 모달 -->
			<div class="modal fade" id="deletePostModal${post.id}" tabindex="-1" aria-labelledby="deletePostModalLabel${post.id}" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="deletePostModalLabel${post.id}">게시글 삭제 확인</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">정말로 삭제하시겠습니까?</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger">삭제</button>
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>


		<!-- 페이징 -->
		<nav aria-label="..." class="d-flex justify-content-center me-5">
			<ul class="pagination">
				<li class="page-item"><a class="page-link">Previous</a></li>
				<li class="page-item active"><a class="page-link" href="#">1</a></li>
				<li class="page-item" aria-current="page"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</nav>
	</section>
	<script src="/viewport_mini_web/resources/js/admin.js"></script>

</body>
</html>
