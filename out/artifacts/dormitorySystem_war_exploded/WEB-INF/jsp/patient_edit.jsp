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
    <form class="layui-form" id="f_auto" action="${pageContext.request.contextPath}/updatePatient" method="post">
        <input type="hidden" value="${sessionScope.p.p_id}" name="p_id" id="p_id"/>
        <div class="layui-form-item">
            <label for="p_name" class="layui-form-label">
                <span class="">姓名</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="p_name" name="p_name"
                       autocomplete="off" value="${sessionScope.p.p_name}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="p_age" class="layui-form-label">
                <span class="">年龄</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="p_age" name="p_age"
                       autocomplete="off" value="${sessionScope.p.p_age}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="p_address" class="layui-form-label">
                <span class="">住址</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="p_address" name="p_address"
                       autocomplete="off" value="${sessionScope.p.p_address}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="p_phone" class="layui-form-label">
                <span class="">联系方式</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="p_phone" name="p_phone"
                       autocomplete="off" value="${sessionScope.p.p_phone}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="p_matter" class="layui-form-label">
                <span class="">病症</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="p_matter" name="p_matter"
                       autocomplete="off" value="${sessionScope.p.p_matter}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="p_house" class="layui-form-label">
                <span class="">科室</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="p_house" name="p_house"
                       autocomplete="off" value="${sessionScope.p.p_house}" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item" id="btn_xg">
            <button class="layui-btn" id="btn_on" lay-submit="" lay-filter="updateForm">
                修改
            </button>
        </div>
    </form>
</div>

<script>

</script>
</body>
</html>
