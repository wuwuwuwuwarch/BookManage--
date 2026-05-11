<%--
  Created by IntelliJ IDEA.
  User: 86178
  Date: 2024/11/28
  Time: 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>图书列表</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="row" style="margin-bottom: 20px;">
    <div class="col-md-4">图书列表</div>
    <div class="col-md-4 offset-md-4" style="text-align: right;">
        <a href="#">登录</a> | <a href="#">注册</a>
    </div>
</div>
<div class="row">
    <div class="col-md-3">类别</div>
    <div class="col-md-9">
        <table class="table table-striped table-bordered">
            <thead>
            <tr>
                <th>序号</th>
                <th>书名</th>
                <th>作者</th>
                <th>价格</th>
                <th>出版社</th>
            </tr>
            </thead>
            <tbody>
            <jsp:useBean id="listBooks" scope="request" type="java.util.List"/>
            <c:forEach items="${listBooks}" var="book">
                <tr>
                    <td>${book.isbn}</td>
                    <td>${book.title}</td>
                    <td>${book.author}</td>
                    <td>${book.price}</td>
                    <td>${book.publisher}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
