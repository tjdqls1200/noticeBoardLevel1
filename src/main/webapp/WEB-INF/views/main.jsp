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
    List<Post> posts = postRepository.list();
%>
<!DOCTYPE html>
<head>
    <style type="text/css">
        table{
            text-align: center;
        }
    </style>
</head>
<body>
<table border="1" width="600" height="100">
    <thead>
    <th></th>
    <th>제 목</th>
    <th>글쓴이</th>
    <th>조회수</th>
    </thead>
    <tbody>
    <% int len = posts.size();
        for(int i = 0; i <= 10; i++) {
            if (i < len) {
                pageContext.setAttribute("index", i);
        %>
                <tr height="30">
                    <td>
                        ${index + 1}
                    </td>
                    <td width="400">
                        <a href="/noticeBoard/read/${postList.get(index).postId}">${postList.get(index).title}</a>
                    </td>
                    <td>
                        ${postList.get(index).writer}
                    </td>
                    <td>
                        ${postList.get(index).postHits}
                    </td>
                </tr>
        <%
            }
            else { %>
                <tr height="30">
                    <td>
                        <br>
                    </td>
                    <td>
                        <br>
                    </td>
                    <td>
                        <br>
                    </td>
                    <td>
                        <br>
                    </td>
                </tr>
        <% }
        } %>
    </tbody>
</table>
<form action="/noticeBoard/newPost" method="get" style="width: 200px; height: 30px">
    <button type="submit">글쓰기</button>
</form>
</body>
</html>