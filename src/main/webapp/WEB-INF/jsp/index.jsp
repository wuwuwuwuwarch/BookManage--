<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style>
    </style>
    <title>图书管理系统 - 主页面</title>
</head>
<body>
<div class="container">
    <div class="jumbotron">
        <h1>图书管理系统</h1>
    </div>

    <div class="row">
        <div class="col-lg-8">
            <form class="form-inline" role="form" method="get" action="${pageContext.request.contextPath}/queryBookListByTitleOrType_id">
                <div class="form-group">
                    <label for="title">书名</label>
                    <input type="text" class="form-control" name="title" id="title" placeholder="书名">
                </div>
                <div class="form-group">
                    <label for="type_id">类型</label>
                    <select class="form-control" name="type_id" id="type_id"> <!-- 添加 id="type_id" -->
                        <option value="0">请选择类型</option>
                        <c:forEach items="${listTypes}" var="type">
                            <option value="${type.id}">${type.typename}</option>
                        </c:forEach>
                    </select>
                </div>

                <button type="submit" class="btn btn-default">查询</button>
            </form>
        </div>

        <div class="col-lg-4">
            <c:if test="${sessionScope.loggedIn == null}">
                <p class="navbar-text navbar-right"><a href="loginPage">管理员登录</a></p>
            </c:if>
            <c:if test="${sessionScope.loggedIn != null}">
                <p class="navbar-text navbar-right">欢迎回来，管理员！</p>
            </c:if>
        </div>
    </div>

    <div class="row">
        <c:forEach items="${listBooks}" var="book">
            <div class="col-md-4">
                <div class="thumbnail">
                    <img src="${book.photo}" alt="${book.title}的封面" style="width:100%; height:auto;"/>
                    <div class="caption">
                        <h3>${book.title}</h3>
                        <p>${book.author}</p>
                        <p><a href="bookDetails?isbn=${book.isbn}" class="btn btn-primary" role="button">详情</a></p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
