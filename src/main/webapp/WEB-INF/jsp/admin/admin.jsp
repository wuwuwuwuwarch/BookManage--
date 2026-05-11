<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>书籍列表 - AdminLTE</title>

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
    <!-- 页面头部 /-->

    <!-- 导航侧栏 -->
    <aside class="main-sidebar">
        <section class="sidebar">
            <ul class="sidebar-menu">
                <li class="header">菜单</li>
                <li><a href="${pageContext.request.contextPath}/books"><i class="fa fa-book"></i> <span>书籍列表</span></a></li>
                <li class="active"><a href="toAddBook"><i class="fa fa-plus"></i> <span>添加书籍</span></a></li>
                <li><a href="logout"><i class="fa fa-user"></i> <span>普通用户</span></a></li>
            </ul>
        </section>
    </aside>
    <!-- 导航侧栏 /-->

    <!-- 内容区域 -->
    <div class="content-wrapper">
        <section class="content-header">
            <h1>书籍管理系统</h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">书籍列表</li>
            </ol>
        </section>

        <section class="content">
            <div class="container">
                <!-- 查询书籍 表单 -->
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

                <table class="table table-striped table-bordered">
                    <thead class="thead-dark">
                    <tr>
                        <th>选择</th>
                        <th>ISBN</th>
                        <th>书名</th>
                        <th>类型</th>
                        <th>作者</th>
                        <th>简介</th>
                        <th>价格</th>
                        <th>出版社</th>
                        <th>封面</th>
                        <th>出版日期</th>
                        <th>编辑</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listBooks}" var="book">
                        <tr>
                            <td><input type="checkbox" name="isbns" value="${book.isbn}"></td>
                            <td>${book.isbn}</td>
                            <td>${book.title}</td>
                            <td>${book.type_id}</td>
                            <td>${book.author}</td>
                            <td>${book.introduction}</td>
                            <td>${book.price}</td>
                            <td>${book.publisher}</td>
                            <td><img src="${pageContext.servletContext.contextPath}${book.photo}" width="80" height="120" /></td>
                            <td>${book.publishcationDate}</td>
                            <td><a href="editBook?isbn=${book.isbn}" class="btn btn-warning btn-sm">编辑</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteConfirmModal">删除所选图书</button>
            </div>
        </section>
    </div>
    <!-- 内容区域 END -->

    <!-- 删除确认模态框 -->
    <div class="modal fade" id="deleteConfirmModal" tabindex="-1" role="dialog" aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteConfirmModalLabel">确认删除</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    您确认要删除所选图书吗？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-danger" onclick="submitDeleteForm();">确认删除</button>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript 文件引入 -->
    <script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>

    <script>
        function submitDeleteForm() {
            const checkboxes = document.querySelectorAll('input[name="isbns"]:checked');
            if (checkboxes.length === 0) {
                alert("请至少选择一本书籍进行删除！");
                return;
            }
            // 创建一个表单
            const form = document.createElement('form');
            form.method = 'POST';
            form.action = 'deleteBookBatch'; // 模拟表单提交
            checkboxes.forEach(checkbox => {
                const input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'isbns'; // 表单字段
                input.value = checkbox.value; // 选中书籍的ISBN
                form.appendChild(input);
            });
            document.body.appendChild(form);
            form.submit(); // 提交表单
        }
    </script>
</div>
</body>
</html>