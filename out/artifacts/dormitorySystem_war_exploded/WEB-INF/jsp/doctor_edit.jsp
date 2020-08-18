<%--
  Created by IntelliJ IDEA.
  User: hkw
  Date: 2018/11/14
  Time: 16:35
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
    <form class="layui-form" action="${pageContext.request.contextPath}/updateDoctor" method="post" id="f_auto" accept-charset="UTF-8">
        <input type="hidden" value="${sessionScope.d.d_id}" name="d_id" id="d_id"/>
        <div class="layui-form-item">
            <label for="d_doctorid" class="layui-form-label">
                <span class="f_sp">工号</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="d_doctorid" name="d_doctorid"
                       autocomplete="off" value="${sessionScope.d.d_doctorid}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="d_name" class="layui-form-label">
                <span class="f_sp">姓名</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="d_name" name="d_name"
                       autocomplete="off" value="${sessionScope.d.d_name}" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label for="d_house" class="layui-form-label">
                <span class="f_sp">科室</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="d_house" name="d_house"
                       autocomplete="off" value="${sessionScope.d.d_house}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="d_phone" class="layui-form-label">
                <span class="f_sp">电话</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="d_phone" name="d_phone"
                       autocomplete="off" value="${sessionScope.d.d_phone}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="d_status" class="layui-form-label">
                <span class="f_sp">状态</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="d_status" name="d_status"
                       autocomplete="off" value="${sessionScope.d.d_status}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" id="btn_xg">
            <button class="layui-btn" id="btn_on" lay-filter="updateForm" lay-submit="">
                修改
            </button>
        </div>
    </form>
</div>

<script>

</script>
</body>
</html>
