
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
            <p>患者注册</p>
        </div>

        <div class="middle">
            <form action="patientRegister" method="post">
                <span class="erro">${msg}</span>
                <span class="s1"></span>
                <span class="s2"></span>
                <input type="text" name="username" value="" class="iputs"/>
                <input type="password" name="password" value="" class="iputs"/>
                <input type="submit" value="注册"/>
            </form>
            <a class="p" href="${pageContext.request.contextPath}/tzLogin" target="_parent">直接登录</a>
        </div>
    </div>
</div>

<div class="footer">
    <span>@Copyright © 2019-2020 版权所有 </span>
</div>
</body>
</html>
