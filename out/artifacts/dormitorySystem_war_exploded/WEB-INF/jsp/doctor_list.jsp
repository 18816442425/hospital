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
        <a href="${pageContext.request.contextPath}/findStudent">医生信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${pageContext.request.contextPath}/findDoctor"
       title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath}/findDoctor">
            <input class="layui-input" placeholder="请输入姓名" name="d_name" id="d_name">
            <input class="layui-input" placeholder="请输入工号" name="d_doctorid" id="d_doctorid">
            <input class="layui-input" placeholder="请输入科室" name="d_house" id="d_house">

            <input class="layui-input" type="hidden" name="pageIndex" value="1">
            <input class="layui-input" type="hidden" name="pageSize" value="3">
            <button class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <xblock>
        <button id="addDoctorBtn" class="layui-btn layui-btn-normal"> <i class="layui-icon">&#xe654;</i>添加 </button>
        <button class="layui-btn layui-btn-warm" lay-filter="toolbarDemo" lay-submit=""><i
                class="layui-icon">&#xe67c;</i>导出
        </button>
        <span class="x-right" style="line-height:40px">共有数据：${pi.totalCount} 条</span>
    </xblock>

    <%--添加模态框--%>
    <div class="layui-row" id="test" style="display: none;">
        <div class="layui-col-md10">
            <form class="layui-form" id="addEmployeeForm">
                <div class="layui-form-item">
                    <label class="layui-form-label">学号：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="s_studentid" class="layui-input"
                               placeholder="请输入学号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="s_name" class="layui-input" placeholder="请输入姓名">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="s_sex" value="男" title="男" checked="">
                        <input type="radio" name="s_sex" value="女" title="女">
                        <%--<input type="text" name="s_sex" class="layui-input" id="s_sex" placeholder="请输入性别">--%>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">年龄：</label>
                    <div class="layui-input-block">
                        <input type="text" name="s_age" class="layui-input" i placeholder="请输入年龄">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">电话：</label>
                    <div class="layui-input-block">
                        <input type="text" name="s_phone" class="layui-input" placeholder="请输入电话">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">班级编号：</label>
                    <div class="layui-input-block">
                        <input type="text" name="s_classid" class="layui-input" placeholder="请输入班级编号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">班级名：</label>
                    <div class="layui-input-block">
                        <input type="text" name="s_classname" class="layui-input" placeholder="请输入班级名">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">寝室编号：</label>
                    <div class="layui-input-block">
                        <input type="text" name="s_dormitoryid" class="layui-input" placeholder="请输入寝室编号">
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
                    <a title="编辑" id="updateEdit" href="${pageContext.request.contextPath}/findDoctorById?d_id=${doctor.d_id}">
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" onclick="member_del(this,'${doctor.d_id}')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
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

    layui.use(['jquery', 'excel','form','layer','laydate'], function(){
        var form = layui.form,
            $ = layui.jquery,
            laydate = layui.laydate;
        var excel = parent.layui.excel;
        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });
        form.on('submit(toolbarDemo)', function(){
            $.ajax({
                url: '/exportstudentlist',
                type: 'post',
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    console.log(data);
                    // 1. 如果需要调整顺序，请执行梳理函数
                    var dt = excel.filterExportData(data, [
                        's_id'
                        ,'s_studentid'
                        ,'s_name'
                        ,'s_sex'
                        ,'s_age'
                        ,'s_phone'
                        ,'s_classid'
                        ,'s_classname'
                        ,'s_dormitoryid'
                    ]);
                    // 2. 数组头部新增表头
                    dt.unshift({s_id: 'ID', s_studentid: '学号', s_name: '姓名', s_sex: '性别', s_age: '年龄', s_phone: '电话', s_classid: '班级编号', s_classname: '班级名', s_dormitoryid: '寝室编号'});
                    // 意思是：A列40px，B列60px(默认)，C列120px，D、E、F等均未定义
                    var colConf = excel.makeColConfig({
                        'B': 90,
                        'C': 80,
                        'F': 90
                    }, 60);
                    var timestart = Date.now();
                    // 3. 执行导出函数，系统会弹出弹框
                    excel.exportExcel({
                        sheet1: dt
                    }, '学生数据.xlsx', 'xlsx', {
                        extend: {
                            '!cols': colConf
                        }
                    });
                    var timeend = Date.now();
                    var spent = (timeend - timestart) / 1000;
                    layer.alert('导出耗时 '+spent+' s');
                    //setTimeout(function () {window.location.href='/findAdmin';},2000);
                },
                error: function () {
                    //console.log(data);
                    setTimeout(function () {window.location.href='/findStudent';},2000);
                }
            });
        });
        /*添加弹出框*/
        $("#addDoctorBtn").click(function () {
            layer.open({
                type:1,
                title:"添加医生",
                skin:"myclass",
                area:["50%"],
                anim:2,
                content:$("#test").html()
            });
            $("#addEmployeeForm")[0].reset();
            form.on('submit(formDemo)', function(data) {
                // layer.msg('aaa',{icon:1,time:3000});
                var param=data.field;
                // console.log(JSON.stringify(param));
                $.ajax({
                    url: '/addStudent',
                    type: "post",
                    data:JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success:function(){
                        layer.msg('添加成功', {icon: 1, time: 3000});
                        setTimeout(function () {window.location.href='/findStudent';},2000);
                    },
                    error:function(){
                        layer.msg('添加失败',{icon:0,time:3000});
                        setTimeout(function () {window.location.href='/findStudent';},2000);
                    }
                });
                // return false;
            });
        });
    });


    /*删除*/
    function member_del(obj, d_id) {
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            $.get("${pageContext.request.contextPath}/deleteDoctor", {"d_id": d_id}, function (data) {
                if (data = true) {
                    layer.msg('删除成功!', {icon: 1, time: 2000});
                    setTimeout(function () {
                        window.location.href = '${pageContext.request.contextPath}/findDoctor';
                    }, 2000);

                } else {
                    layer.msg('删除失败!', {icon: 1, time: 3000});
                    setTimeout(function () {
                        window.location.href = '${pageContext.request.contextPath}/findDoctor';
                    }, 2000);
                }
            });
        });
    }

</script>


</body>


</html>
