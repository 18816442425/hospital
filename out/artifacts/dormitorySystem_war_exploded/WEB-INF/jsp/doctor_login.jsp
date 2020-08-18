
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/usersLogin.css">
    <link rel="icon" href="images/favicon.ico" sizes="32x32"/>
    <script src="./js/jquery-1.3.2.min.js"></script>
    <script src="js/login.js"></script>
    <title>前台首页</title>
    <style>
        .p > a:hover {
            color:red;
        }
        .p{
            margin-left: 250px;
            margin-top:-80px;
            font-size: 15px;

        }
    </style>
</head>
<body>

<div class="header">

</div>

<div class="body">
    <div class="panel">
        <div class="top">
            <p>医生登陆</p>
        </div>

        <div class="middle">
            <form action="doLogin" method="post">
                <span class="erro">${msg}</span>
                <span class="s1"></span>
                <span class="s2"></span>
                <input type="text" name="d_username" value="" class="iputs"/>
                <input type="password" name="d_password" value="" class="iputs"/>
                <input type="submit" value="登陆"/>
            </form>
            <a class="p" href="${pageContext.request.contextPath}/adminLogin" target="_parent">我是管理员</a>
        </div>
    </div>
</div>

<div class="footer">
    <span>@Copyright © 2019-2020 版权所有 </span>
</div>
</body>
</html>
