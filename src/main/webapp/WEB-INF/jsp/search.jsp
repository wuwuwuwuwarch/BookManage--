<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>查询结果 - 书籍管理系统</title>

    <!-- 引入AdminLTE的CSS文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">

    <style>
        body {
            background-color: #f8f9fa;
        }
        h2 {
            margin-top: 20px;
            margin-bottom: 20px;
            text-align: center;
        }
        .table th, .table td {
            vertical-align: middle;
        }
    </style>
</head>
<body class="hold-transition skin-purple sidebar-mini">
<div class="wrapper">

    <!-- 页面头部 -->
    <header class="main-header">
        <a href="#" class="logo">
            <span class="logo-mini"><b>书籍</b></span>
            <span class="logo-lg"><b>书籍管理</b>系统</span>
        </a>
        <nav class="navbar navbar-static-top">
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
        </nav>
    </header>
    <!-- 头部 END -->

    <!-- 导航侧栏 -->
    <aside class="main-sidebar">
        <section class="sidebar">
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">菜单</li>
                <li><a href="books"><i class="fa fa-book"></i> <span>书籍列表</span></a></li>
                <li><a href="toAddBook"><i class="fa fa-plus"></i> <span>添加书籍</span></a></li>
                <li><a href="loginPage"><i class="fa fa-user"></i> <span>管理员登录</span></a></li>
            </ul>
        </section>
    </aside>
    <!-- 导航侧栏 END -->

    <!-- 内容区域 -->
    <div class="content-wrapper">
        <section class="content-header">
            <h1>查询结果</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 控制面板</a></li>
                <li class="active">查询结果</li>
            </ol>
        </section>

        <section class="content">
            <div class="container">
                <a href="queryBookList" class="btn btn-primary mb-3">返回主界面</a>
                <table class="table table-striped table-bordered">
                    <thead class="thead-dark">
                    <tr>
                        <th>ISBN</th>
                        <th>书名</th>
                        <th>类型 ID</th>
                        <th>作者</th>
                        <th>简介</th>
                        <th>价格</th>
                        <th>出版社</th>
                        <th>出版日期</th>
                        <th>封面</th>
                        <th>编辑</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listBooks}" var="book">
                        <tr>
                            <td>${book.isbn}</td>
                            <td>${book.title}</td>
                            <td>${book.type_id}</td>
                            <td>${book.author}</td>
                            <td>${book.introduction}</td>
                            <td>${book.price}</td>
                            <td>${book.publisher}</td>
                            <td>${book.publishcationDate}</td>
                            <td><img src="${pageContext.servletContext.contextPath}${book.photo}" alt="${book.title}的封面" style="width:50px;height:75px;"/></td>
                            <td><a href="$editBook?isbn=${book.isbn}" class="btn btn-warning btn-sm">编辑</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
    <!-- 内容区域 END -->

    <!-- 页脚 -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0.0
        </div>
        <strong>Copyright &copy; 2024 <a href="#">书籍管理系统</a>.</strong> All rights reserved.
    </footer>
</div>

<!-- 引入JavaScript文件 -->
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
</body>
</html>
