<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>管理员登录 - 书籍管理系统</title>

  <!-- 引入AdminLTE的CSS文件 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">

  <style>
    body {
      background-color: #f8f9fa; /* 设置背景颜色 */
    }
    .login-box {
      width: 400px; /* 确定登录框的宽度 */
      margin: 7% auto; /* 垂直居中 */
      background-color: white; /* 白色背景 */
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 添加阴影效果 */
    }
  </style>
</head>
<body>
<div class="login-box">
  <h2 class="text-center">管理员登录</h2>
  <form action="${pageContext.request.contextPath}/admin/login" method="post" class="mt-4">
    <div class="form-group">
      <label for="username">用户名：</label>
      <input type="text" id="username" name="username" class="form-control" required>
    </div>
    <div class="form-group">
      <label for="password">密码：</label>
      <input type="password" id="password" name="password" class="form-control" required>
    </div>
    <button type="submit" class="btn btn-primary btn-block">登录</button> <!-- 使用 btn-block 使按钮宽度填满 -->
  </form>
</div>

<!-- 引入必要的 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
</body>
</html>
