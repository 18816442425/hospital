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
        <a href="${pageContext.request.contextPath}/doctorGua">我的挂号信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${pageContext.request.contextPath}/doctorGua"
       title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath}/doctorGua">
            <input class="layui-input" type="hidden" name="pageIndex" value="1">
            <input class="layui-input" type="hidden" name="pageSize" value="3">
        </form>
    </div>

    <%--表格数据--%>
    <table class="layui-table">
        <thead>
        <tr>
            <th>ID</th>
            <th>姓名</th>
            <th>年龄</th>
            <th>所挂科室</th>
            <th>描述症状</th>
            <th>医生姓名</th>
            <th>挂号状态</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${gi.list}" var="gua">
            <tr>
                <td>${gua.id}</td>
                <td>${gua.paname}</td>
                <td>${gua.age}</td>
                <td>${gua.house}</td>
                <td>${gua.trouble}</td>
                <td>${gua.doname}</td>
                <td style="color: blue">${gua.status}</td>
                <td>
                    <a style="color: green" title="预约成功" onclick="member_del(this,'${gua.id}')" href="javascript:;">
                        <i class="layui-icon">预约成功</i>
                    </a>&nbsp&nbsp&nbsp&nbsp
                    <a style="color: red" title="预约失败" onclick="member_dal(this,'${gua.id}')" href="javascript:;">
                        <i class="layui-icon">预约失败</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%-- 尾部--%>
    <div class="">
        <input type="hidden" id="totalPageCount" value="${gi.pageTotalCount}"/>
        <c:import url="pageBtn.jsp">
            <c:param name="totalCount" value="${gi.totalCount}"/>
            <c:param name="currentPageNo" value="${gi.pageIndex}"/>
            <c:param name="totalPageCount" value="${gi.pageTotalCount}"/>
        </c:import>
    </div>
</div>
<script>

    layui.config({
        base: 'layui_exts/',
    }).extend({
        excel: 'excel',
    });

    function member_del(obj, id) {
        layer.confirm('确认要通过此人的挂号请求吗？', function (index) {
            //发异步删除数据
            $.get("${pageContext.request.contextPath}/successGua", {"id": id}, function (data) {
                if (data = true) {
                    layer.msg('成功!', {icon: 1, time: 2000});
                    setTimeout(function () {
                        window.location.href = '${pageContext.request.contextPath}/doctorGua';
                    }, 2000);

                } else {
                    layer.msg('失败!', {icon: 1, time: 3000});
                    setTimeout(function () {
                        window.location.href = '${pageContext.request.contextPath}/doctorGua';
                    }, 2000);
                }
            });
        });
    }

    function member_dal(obj, id) {
        layer.confirm('确认要拒绝此人的挂号请求吗？', function (index) {
            //发异步删除数据
            $.get("${pageContext.request.contextPath}/failGua", {"id": id}, function (data) {
                if (data = true) {
                    layer.msg('拒绝成功!', {icon: 1, time: 2000});
                    setTimeout(function () {
                        window.location.href = '${pageContext.request.contextPath}/doctorGua';
                    }, 2000);

                } else {
                    layer.msg('拒绝失败!', {icon: 1, time: 3000});
                    setTimeout(function () {
                        window.location.href = '${pageContext.request.contextPath}/doctorGua';
                    }, 2000);
                }
            });
        });
    }


</script>


</body>


</html>
