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
  <title>게시판 글쓰기</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
  <h2>게시판 글쓰기</h2>
  <form action="/noticeBoard/update/${updatePost.postId}" method="post">
    <div class="form-group">
      <label for="title">제목</label>
      <!-- placeholder 속성 입력한 데이터가 없는 경우 배경으로 나타난다.실제적으로 입력을 100자까지로 지정 -->
      <!-- required 속성을 설정하면 필수입력 사항이된다. -->
      <!-- pattern 속성을 이용한 정규표현식으로 데이터의 유효성 검사를 할 수 있다. -->
      <input type="text" class="form-control" id="title"
             placeholder="제목을 입력하세요" name="title"
             maxlength="100" required="required"
             pattern=".{2,100}"
             value="${updatePost.title}">
    </div>
    <div class="form-group">
      <label for="writer">작성자</label>
      <output class="form-control" id="writer">
        ${updatePost.writer}
      </output>
    </div>
    <div class="form-group">
      <label for="password">비밀번호</label>
      <input type="text" class="form-control" id="password"
             placeholder="비밀번호를 입력하세요" name="password" required="required">
    </div>
    <div class="form-group">
      <label for="textContents">내용</label>
      <!--  여러줄의 데이터를 입력하고 하고자 할때 textarea 태그를 사용한다. -->
      <!--  textarea 안에 있는 모든 글자는 그대로 나타난다. 공백문자, tag, enter -->
      <textarea class="form-control" rows="5" id="textContents"
                name="textContents">${updatePost.textContents}</textarea>
    </div>
    <button type="submit" class="btn btn-default">저장</button>
  </form>
</div>
</body>
</html>

