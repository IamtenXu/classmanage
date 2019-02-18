<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xh601
  Date: 2019/2/1
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="getrole" scope="page" value="${sessionScope.userinfo.roleinfo.rcode}"/>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>通知</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <style type="text/css">
        .layui-table-cell {
            height: auto;
            line-height: 28px;
        }
    </style>
</head>
<body>
<div>
    <div>
        <!-- 内容主体区域 -->
        <div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 15px;">
                    <legend>班级通知</legend>
                </fieldset>
                <table class="layui-table" id="LAY_table_user" lay-filter="user"></table>
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>辅导员/班主任通知</legend>
                </fieldset>
                <table class="layui-table" id="LAY_table_tea" lay-filter="user"></table>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="layui/layui.js"></script>
<script id="barDemo" type="text/html">
    <a class="layui-btn layui-btn-warm layui-btn-xs dw-dailog" lay-event="update" dw-url="updateannouncement" dw-title="修改通知">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
    layui.use(['element','table'], function(){
        var element = layui.element
            ,table = layui.table;
        //方法级渲染
        table.render({
            elem: '#LAY_table_user'
            ,url: '/announcement/announcementClass'
            ,skin: 'line' //行边框风格
            ,size: 'lg' //小尺寸的表格
            // ,even: true //开启隔行背景
            ,response: {
                statusCode: 200 //规定成功的状态码，默认：0
            }
            ,where: {
                sclass:${sessionScope.classinfo.classid}
            }
            ,cellMinWidth: 75
            ,cols: [[
                // {checkbox: true, fixed: true},
                {field:'atime',  sort: true, title: '时间',width: 160}
                ,{field:'title',  title: '标题',width: 160}
                ,{field:'text',   title: '正文'}
                ,{field:'stuinfo',  sort: true, align: 'left', title: '发布人',templet: '<div>{{d.stuinfo.sname}}</div>',width: 160}
            ]]
            ,id: 'testReload'
            // ,page: true
            ,height: '250'
            ,limit: 50
        });
        table.render({
            elem: '#LAY_table_tea'
            ,url: '/announcement/announcementTea'
            ,skin: 'line' //行边框风格
            ,size: 'lg' //小尺寸的表格
            // ,even: true //开启隔行背景
            ,response: {
                statusCode: 200 //规定成功的状态码，默认：0
            }
            ,where: {
                sclass:${sessionScope.classinfo.classid}
            }
            ,cellMinWidth: 75
            ,cols: [[
                // {checkbox: true, fixed: true},
                {field:'atime',  sort: true, title: '时间',width: 160}
                ,{field:'title',  title: '标题',width: 160}
                ,{field:'text',   title: '正文'}
                ,{field:'stuinfo',  sort: true, align: 'left', title: '发布人',templet: '<div>{{d.teainfo.tname}}</div>',width: 160}
            ]]
            ,id: 'testReload'
            // ,page: true
            ,height: '220'
            ,limit: 50
        });
    });
</script>
</html>
