<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="crudExampleProject1.springMVC.model.Post" %>
<%@ page import="crudExampleProject1.springMVC.repository.PostRepository" %>
<%@ page import="java.util.List" %>
<%@ page import="org.springframework.ui.Model" %>
<%
    PostRepository postRepository = PostRepository.getInstance();
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<table border="1" width="600" height="100">
    <thead>
        <tr>
            <td style="text-align: center" width="600">
                제목
            </td>
        </tr>
        <tr>
            <td style="text-align: center" width="600">
                ${readPost.title}
            </td>
        </tr>
    </thead>
</table>
<table border="1" width="600" height="30">
    <tbody>
        <tr>
            <th>
                <td style="text-align: center" width="100">
                    글쓴이
                </td>
            </th>
            <th>
                <td style="text-align: center" width="200">
                    ${readPost.writer}
                </td>
            </th>
            <th>
                <td style="text-align: center" width="100">
                    조회
                </td>
            </th>
            <th>
                <td style="text-align: center" width="200">
                    ${readPost.postHits}
                </td>
            </th>
        </tr>
    </tbody>
</table>
<table border="1" width="600" height="200">
    <tbody>
        <tr>
            <th>
                <td style="text-align: center" width="100">
                    내용
                </td>
            </th>
            <th>
                <td style="vertical-align: top; text-align: left" width="500">
                    ${readPost.textContents}
                </td>
            </th>
        </tr>
    </tbody>
</table>
<form action="/" method="get" style="width: 200px; height: 30px; text-align: center">
    <button type="submit">확인</button>
</form>
<form action="/noticeBoard/update/${readPost.postId}" method="get" style="width: 200px; height: 30px; text-align: center">
    <button type="submit">수정</button>
</form>
<form action="/noticeBoard/delete/${readPost.postId}" method="get" style="width: 200px; height: 30px; text-align: center">
    <button type="submit">삭제</button>
</form>
</body>
</html>