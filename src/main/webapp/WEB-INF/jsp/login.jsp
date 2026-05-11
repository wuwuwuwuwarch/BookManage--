<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>书籍管理系统 - AdminLTE</title>

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
            <h1>书籍管理系统</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 控制面板</a></li>
                <li class="active">书籍列表</li>
            </ol>
        </section>

        <section class="content">
            <div class="container">
                <h2>书籍列表</h2>
            <div class="row mb-3">
                <div class="col-lg-8">
                    <form class="form-inline" role="form" method="get" action="searchBooks">
                        <div class="form-group">
                            <label for="title">书名</label>
                            <input type="text" class="form-control" name="title" id="title" placeholder="书名">
                        </div>
                        <div class="form-group">
                            <label for="type_id">类型</label>
                            <select class="form-control" name="typeId" id="type_id">
                                <option value="0">请选择类型</option>
                                <option value="1">计算机</option>
                                <option value="2">心理</option>
                                <option value="3">教育学</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-default">查询</button>
                    </form>
                </div>
            </div>


                <!-- 图书列表区域 -->
                <table class="table table-striped table-bordered mt-4">
                    <thead class="thead-dark">
                    <tr>
                        <th>ISBN</th>
                        <th>书名</th>
                        <th>类型</th>
                        <th>作者</th>
                        <th>简介</th>
                        <th>价格</th>
                        <th>出版社</th>
                        <th>封面</th>
                        <th>出版日期</th>
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
                            <td>
                                <img src="${pageContext.servletContext.contextPath}${book.photo}" width="80" height="120" alt="${book.title}的封面图" />
                            </td>

                            <td>${book.publishcationDate}</td>
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
