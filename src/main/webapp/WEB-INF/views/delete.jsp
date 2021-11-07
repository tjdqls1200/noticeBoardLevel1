<%@ page import="crudExampleProject1.springMVC.repository.PostRepository" %>
<%@ page import="crudExampleProject1.springMVC.model.Post" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%
    PostRepository postRepository = PostRepository.getInstance();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 삭제</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <h2>게시글 삭제</h2>
    <form action="/noticeBoard/delete/${deletePost.postId}" method="post">
        <div class="form-group">
            <label for="writer">작성자</label>
            <output class="form-control" id="writer">
                ${deletePost.writer}
            </output>
        </div>
        <div class="form-group">
            <label for="password">비밀번호</label>
            <input type="text" class="form-control" id="password"
                   placeholder="비밀번호를 입력하세요" name="password" required="required">
        </div>
        <button type="submit" class="btn btn-default">저장</button>
    </form>
</div>
</body>
</html>

