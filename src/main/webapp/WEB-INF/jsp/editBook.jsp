<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑图书 - 书籍管理系统</title>

    <!-- 引入AdminLTE的CSS文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">

    <style>
        body {
            background-color: #f8f9fa; /* 设置背景颜色 */
        }
        h2 {
            margin-top: 20px;
            margin-bottom: 20px;
            text-align: center;
        }
        .form-control, .form-control-file {
            margin-bottom: 15px; /* 增加输入框间距 */
        }
        .submit-btn {
            width: 100%; /* 让“保存”按钮填满宽度 */
            margin-top: 15px;
        }
        .return-btn {
            margin-top: 20px;
            display: block;
            width: 100%; /* 让返回按钮填满宽度 */
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
    <!-- 页头 END -->

    <!-- 导航侧栏 -->
    <aside class="main-sidebar">
        <section class="sidebar">
            <ul class="sidebar-menu">
                <li class="header">菜单</li>
                <li><a href="books"><i class="fa fa-book"></i> <span>书籍列表</span></a></li>
                <li class="active"><a href="toAddBook"><i class="fa fa-plus"></i> <span>添加书籍</span></a></li>
                <li><a href="loginPage"><i class="fa fa-user"></i> <span>管理员登录</span></a></li>
            </ul>
        </section>
    </aside>
    <!-- 导航侧栏 END -->

    <!-- 内容区域 -->
    <div class="content-wrapper">
        <section class="content-header">
            <h1>编辑图书</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">编辑图书</li>
            </ol>
        </section>

        <section class="content">
            <div class="container">
                <form id="bookForm" action="saveBookChanges" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="isbn" value="${book.isbn}" />

                    <div class="form-group">
                        <label for="title">书名</label>
                        <input type="text" class="form-control" id="title" name="title" value="${book.title}" required>
                    </div>

                    <div class="form-group">
                        <label for="author">作者</label>
                        <input type="text" class="form-control" id="author" name="author" value="${book.author}" required>
                    </div>

                    <div class="form-group">
                        <label for="type_id">类型</label>
                        <input type="text" class="form-control" id="type_id" name="type_id" value="${book.type_id}" required>
                    </div>

                    <div class="form-group">
                        <label for="price">价格</label>
                        <input type="number" step="0.01" class="form-control" id="price" name="price" value="${book.price}" required>
                    </div>

                    <div class="form-group">
                        <label for="publisher">出版社</label>
                        <input type="text" class="form-control" id="publisher" name="publisher" value="${book.publisher}" required>
                    </div>

                    <div class="form-group">
                        <label for="introduction">简介</label>
                        <textarea class="form-control" id="introduction" name="introduction" required>${book.introduction}</textarea>
                    </div>

                    <div class="form-group">
                        <label for="publishcationDate">出版日期</label>
                        <input type="date" class="form-control" id="publishcationDate" name="publishcationDate" value="${book.publishcationDate}" required>
                    </div>

                    <div class="form-group">
                        <label for="uploadFile">请上传封面:</label>
                        <input type="file" id="uploadFile" name="uploadFile" class="form-control-file" />
                    </div>

                    <button type="button" class="btn btn-primary submit-btn" data-toggle="modal" data-target="#confirmModal">保存</button>
                </form>

                <!-- 保存确认模态框 -->
                <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="confirmModalLabel">确认保存</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                您确认要保存对书籍的更改吗？
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                                <button type="button" class="btn btn-primary" onclick="document.getElementById('bookForm').submit();">确认保存</button>
                            </div>
                        </div>
                    </div>
                </div>

                <a href="queryBookList" class="btn btn-secondary return-btn">返回主界面</a> <!-- 返回主界面的按钮 -->
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

<!-- 引入必要的 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
</body>
</html>
