<%--
  Created by IntelliJ IDEA.
  User: 86178
  Date: 2024/11/14
  Time: 9:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>添加结果</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa; /* 设置背景颜色 */
        }
        h2 {
            margin-top: 20px;
            text-align: center;
        }
        .message {
            font-size: 24px;
            text-align: center;
            margin-top: 20px;
            color: green; /* 设置字体颜色 */
        }
        .return-btn {
            margin-top: 20px;
            display: block;
            width: 100%; /* 让返回按钮填满宽度 */
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>操作结果</h2>
    <div class="message">操作成功！</div> <!-- 显示添加结果消息 -->
    <a href="queryBookList" class="btn btn-secondary return-btn">返回主界面</a>
</div>
</body>
</html>
