<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加图书 - 书籍管理系统</title>

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
        .submit-btn, .return-btn {
            width: 100%; /* 让按钮填满宽度 */
            margin-top: 15px;
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
                <li class="active"><a href="toAddBook"><i class="fa fa-plus"></i> <span>添加书籍</span></a></li>
                <li><a href="loginPage"><i class="fa fa-user"></i> <span>管理员登录</span></a></li>
            </ul>
        </section>
    </aside>
    <!-- 导航侧栏 END -->

    <!-- 内容区域 -->
    <div class="content-wrapper">
        <section class="content-header">
            <h1>添加图书</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 控制面板</a></li>
                <li class="active">添加图书</li>
            </ol>
        </section>

        <section class="content">
            <div class="container">
                <form name="form1" id="bookForm" method="post" action="addBook" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="isbn">ISBN:</label>
                        <input type="text" id="isbn" name="isbn" class="form-control" placeholder="请输入ISBN" required />
                    </div>
                    <div class="form-group">
                        <label for="title">书名:</label>
                        <input type="text" id="title" name="title" class="form-control" placeholder="请输入书名" required />
                    </div>
                    <div class="form-group">
                        <label for="type_id">图书类型:</label>
                        <select id="type_id" name="type_id" class="form-control" required>
                            <option value="1">计算机</option>
                            <option value="2">心理</option>
                            <option value="3">教育</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="author">作者:</label>
                        <input type="text" id="author" name="author" class="form-control" placeholder="请输入作者" required />
                    </div>
                    <div class="form-group">
                        <label for="introduction">图书简介:</label>
                        <textarea id="introduction" name="introduction" rows="4" class="form-control" placeholder="请输入图书简介" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="price">图书价格:</label>
                        <input type="number" id="price" name="price" class="form-control" placeholder="请输入书籍价格" required min="0" step="0.01"/>
                    </div>
                    <div class="form-group">
                        <label for="publisher">出版社:</label>
                        <input type="text" id="publisher" name="publisher" class="form-control" placeholder="请输入出版社" required />
                    </div>
                    <div class="form-group">
                        <label for="uploadFile">请上传封面:</label>
                        <input type="file" id="uploadFile" name="uploadFile" class="form-control-file" required />
                    </div>
                    <div class="form-group">
                        <label for="publishcationDate">出版日期:</label>
                        <input type="date" id="publishcationDate" name="publishcationDate" class="form-control" required />
                    </div>
                    <button type="button" class="btn btn-primary submit-btn" data-toggle="modal" data-target="#confirmModal">添加</button>
                </form>

                <!-- 模态框 -->
                <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="confirmModalLabel">确认添加图书</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                您确认要添加这本图书吗？
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                                <button type="button" class="btn btn-primary" onclick="document.getElementById('bookForm').submit();">确认</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 返回主界面的按钮 -->
                <a href="queryBookList" class="btn btn-secondary return-btn">返回主界面</a>
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
