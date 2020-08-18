<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.itheima.po.Doctor" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>后台登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="icon" href="/images/favicon.ico" sizes="32x32"/>
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script src="/layui_exts/excel.js"></script>

    <style type="text/css">
        .p{
            color: #0000FF;

        }

        .layui-table {
            text-align: center;
        }

        .layui-table th {
            text-align: center;
        }
    </style>
</head>

<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="${pageContext.request.contextPath}/guaHao">我要挂号</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${pageContext.request.contextPath}/guaHao"
       title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath}/guaHao">
            <input class="layui-input" placeholder="请输入姓名" name="d_name" id="d_name">
            <input class="layui-input" placeholder="请输入科室" name="d_house" id="d_house">

            <input class="layui-input" type="hidden" name="pageIndex" value="1">
            <input class="layui-input" type="hidden" name="pageSize" value="3">
            <button class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>


    <%--表格数据--%>
    <table class="layui-table">
        <thead>
        <tr>
            <th>ID</th>
            <th>工号</th>
            <th>姓名</th>
            <th>所属科室</th>
            <th>联系方式</th>
            <th>医生信息</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${pi.list}" var="doctor">
            <tr>
                <td>${doctor.d_id}</td>
                <td>${doctor.d_doctorid}</td>
                <td>${doctor.d_name}</td>
                <td>${doctor.d_house}</td>
                <td>${doctor.d_phone}</td>
                <td>${doctor.d_status}</td>
                <td>
                    <a class="p" id="updateEdit" href="${pageContext.request.contextPath}/guaBa?d_id=${doctor.d_id}">
                        <i class="layui-icon">挂号</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%-- 尾部--%>
    <div class="">
        <input type="hidden" id="totalPageCount" value="${pi.pageTotalCount}"/>
        <c:import url="pageBtn.jsp">
            <c:param name="totalCount" value="${pi.totalCount}"/>
            <c:param name="currentPageNo" value="${pi.pageIndex}"/>
            <c:param name="totalPageCount" value="${pi.pageTotalCount}"/>
        </c:import>
    </div>
</div>
<script>

    layui.config({
        base: 'layui_exts/',
    }).extend({
        excel: 'excel',
    });


</script>


</body>


</html>
