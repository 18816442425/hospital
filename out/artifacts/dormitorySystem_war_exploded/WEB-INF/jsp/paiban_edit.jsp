<%--
  Created by IntelliJ IDEA.
  User: 周训凯
  Date: 2019/4/24
  Time: 23:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>修改信息</title>
    <link rel="icon" href="/images/favicon.ico" sizes="32x32"/>
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <link rel="stylesheet" href="./css/pg_btn.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
</head>

<body>

<div class="x-body">
    <form class="layui-form" id="f_auto" action="${pageContext.request.contextPath}/updatePaiban" method="post">
        <div class="layui-form-item">
            <label for="xqe" class="layui-form-label">
                <span class="">星期一</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="d_id" name="xqy"
                       autocomplete="off" value="${sessionScope.p.xqy}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="xqe" class="layui-form-label">
                <span class="">星期二</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="xqe" name="xqe"
                       autocomplete="off" value="${sessionScope.p.xqe}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="xqs" class="layui-form-label">
                <span class="">星期三</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="xqs" name="xqs"
                       autocomplete="off" value="${sessionScope.p.xqs}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="xqf" class="layui-form-label">
                <span class="">星期四</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="xqf" name="xqf"
                       autocomplete="off" value="${sessionScope.p.xqf}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="xqw" class="layui-form-label">
                <span class="">星期五</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="xqw" name="xqw"
                       autocomplete="off" value="${sessionScope.p.xqw}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="xql" class="layui-form-label">
                <span class="">星期六</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="xql" name="xql"
                       autocomplete="off" value="${sessionScope.p.xql}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" id="btn_xg">
            <button class="layui-btn" id="btn_on" lay-submit="" lay-filter="updateClass">
                修改
            </button>
        </div>
    </form>
</div>

<script>
</script>
</body>
</html>

