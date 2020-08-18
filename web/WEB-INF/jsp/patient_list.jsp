<%--
  Created by IntelliJ IDEA.
  User: hkw
  Date: 2018/10/31
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.itheima.po.Patient" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>后台登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <%--<meta http-equiv="Cache-Control" content="no-siteapp" />--%>

    <link rel="icon" href="/images/favicon.ico" sizes="32x32"/>
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script src="/layui_exts/excel.js"></script>

    <style type="text/css">
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
        <a href="${pageContext.request.contextPath}/findPatient">病人信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${pageContext.request.contextPath}/findPatient"
       title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath}/findPatient">
            <input class="layui-input" placeholder="请输入病人姓名" name="p_name" id="p_name">
            <input class="layui-input" placeholder="请输入科室" name="p_house" id="p_house">

            <input class="layui-input" type="hidden" name="pageIndex" value="1">
            <input class="layui-input" type="hidden" name="pageSize" value="3">
            <button class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <xblock>
        <button id="addPatientBtn" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe654;</i>添加</button>
        <button class="layui-btn layui-btn-warm" lay-filter="toolbarDemo" lay-submit=""><i
                class="layui-icon">&#xe67c;</i>导出
        </button>
        <span class="x-right" style="line-height:40px">共有数据：${ci.totalCount} 条</span>
    </xblock>

    <%--添加模态框--%>
    <div class="layui-row" id="test" style="display: none;">
        <div class="layui-col-md10">
            <form class="layui-form" id="addEmployeeForm">
                <div class="layui-form-item">
                    <label class="layui-form-label">班级编号：</label>
                    <div class="layui-input-block">
                        <input type="text" name="c_classid" class="layui-input" placeholder="请输入班级编号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">班级名：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="c_classname" class="layui-input"
                               placeholder="请输入班级名">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">辅导员：</label>
                    <div class="layui-input-block">
                        <input type="text" name="c_counsellor" class="layui-input" placeholder="请输入辅导员姓名">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">提交
                        </button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>


    <%--表格数据--%>
    <table class="layui-table">
        <thead>
        <th>ID</th>
        <th>姓名</th>
        <th>年龄</th>
        <th>住址</th>
        <th>联系方式</th>
        <th>病症</th>
        <th>科室</th>
        <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${ci.list}" var="patient">
            <tr>
                <td>${patient.p_id}</td>
                <td>${patient.p_name}</td>
                <td>${patient.p_age}</td>
                <td>${patient.p_address}</td>
                <td>${patient.p_phone}</td>
                <td>${patient.p_matter}</td>
                <td>${patient.p_house}</td>
                <td>
                    <a title="编辑" id="updateEdit" href="${pageContext.request.contextPath}/findPatientById?p_id=${patient.p_id}">
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" onclick="member_del(this,'${patient.p_id}')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="">
        <input type="hidden" id="totalPageCount" value="${ci.pageTotalCount}"/>
        <c:import url="pageBtn.jsp">
            <c:param name="totalCount" value="${ci.totalCount}"/>
            <c:param name="currentPageNo" value="${ci.pageIndex}"/>
            <c:param name="totalPageCount" value="${ci.pageTotalCount}"/>
        </c:import>
    </div>
    <script>

        layui.config({
            base: 'layui_exts/',
        }).extend({
            excel: 'excel',
        });


        layui.use(['jquery', 'excel', 'form', 'layer', 'laydate'], function () {
            var form = layui.form,
                $ = layui.jquery,
                laydate = layui.laydate;
            var excel = parent.layui.excel;

            //执行一个laydate实例
            laydate.render({
                elem: '#start' //指定元素
            });

            form.on('submit(toolbarDemo)', function () {

                $.ajax({
                    url: '/exportclasslist',
                    type: 'post',
                    dataType: 'json',
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        console.log(data);

                        // 1. 如果需要调整顺序，请执行梳理函数
                        var dt = excel.filterExportData(data, [
                            'c_id'
                            , 'c_classid'
                            , 'c_classname'
                            , 'c_counsellor'
                        ]);

                        // 2. 数组头部新增表头
                        dt.unshift({c_id: 'ID', c_classid: '班级编号', c_classname: '班级名', c_counsellor: '辅导员'});

                        // 意思是：A列40px，B列60px(默认)，C列120px，D、E、F等均未定义
                        var colConf = excel.makeColConfig({
                            'C': 90,
                            'D': 80
                        }, 60);

                        var timestart = Date.now();
                        // 3. 执行导出函数，系统会弹出弹框
                        excel.exportExcel({
                            sheet1: dt
                        }, '班级数据.xlsx', 'xlsx', {
                            extend: {
                                '!cols': colConf
                            }
                        });
                        var timeend = Date.now();

                        var spent = (timeend - timestart) / 1000;
                        layer.alert('导出耗时 ' + spent + ' s');
                        //setTimeout(function () {window.location.href='/findAdmin';},2000);
                    },

                    error: function () {
                        //console.log(data);
                        setTimeout(function () {
                            window.location.href = '/findClass';
                        }, 2000);
                    }
                });
            });

            /*添加弹出框*/
            $("#addPatientBtn").click(function () {
                layer.open({
                    type: 1,
                    title: "添加班级",
                    skin: "myclass",
                    area: ["50%"],
                    anim: 2,
                    content: $("#test").html()
                });
                $("#addEmployeeForm")[0].reset();
                form.on('submit(formDemo)', function (data) {
                    // layer.msg('aaa',{icon:1,time:3000});
                    var param = data.field;
                    // console.log(JSON.stringify(param));
                    $.ajax({
                        url: '/addClass',
                        type: "post",
                        data: JSON.stringify(param),
                        contentType: "application/json; charset=utf-8",
                        success: function () {
                            layer.msg('添加成功', {icon: 1, time: 3000});
                            setTimeout(function () {
                                window.location.href = '/findClass';
                            }, 2000);

                        },
                        error: function () {
                            layer.msg('添加失败', {icon: 0, time: 3000});
                            setTimeout(function () {
                                window.location.href = '/findClass';
                            }, 2000);
                        }
                    });
                    // return false;
                });
            });

        });


        /*删除*/
        function member_del(obj, p_id) {
            layer.confirm('确认要删除吗？', function (index) {
                //发异步删除数据
                $.get("${pageContext.request.contextPath}/deletePatient", {"p_id": p_id}, function (data) {
                    if (data = true) {
                        layer.msg('删除成功!', {icon: 1, time: 2000});
                        setTimeout(function () {
                            window.location.href = '${pageContext.request.contextPath}/findPatient';
                        }, 2000);

                    } else {
                        layer.msg('删除失败!', {icon: 1, time: 2000});
                        setTimeout(function () {
                            window.location.href = '${pageContext.request.contextPath}/findPatient';
                        }, 2000);
                    }
                });
            });
        }

    </script>


</body>


</html>
