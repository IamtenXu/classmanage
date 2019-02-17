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
            <c:if test="${getrole != '1'&&getrole != '2'&&getrole != '3'}">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 15px;">
                    <legend>班级通知</legend>
                </fieldset>
                <table class="layui-table" id="LAY_table_user" lay-filter="user"></table>
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>辅导员通知</legend>
                </fieldset>
                <table class="layui-table" id="LAY_table_tea" lay-filter="user"></table>
            </c:if>
            <c:if test="${getrole == '2'}">
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>已发布通知</legend>
                </fieldset>
                <table class="layui-table" id="LAY_table_tea" lay-filter="user"></table>
            </c:if>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="layui/layui.js"></script>
<script>
    layui.use(['element','table'], function(){
        var element = layui.element;
        var table = layui.table;
        <c:if test="${getrole != '1'&&getrole != '2'&&getrole != '3'}">
        //方法级渲染
        table.render({
            elem: '#LAY_table_user'
            ,url: '/user/announcementClass'
            ,skin: 'line' //行边框风格
            ,size: 'lg' //小尺寸的表格
            // ,even: true //开启隔行背景
            ,response: {
                statusCode: 200 //规定成功的状态码，默认：0
            }
            ,where: {
                sclass:${sessionScope.userinfo.sclass}
            }
            ,cellMinWidth: 75
            ,cols: [[
                // {checkbox: true, fixed: true},
                {field:'atime',  sort: true, title: '时间',width: 160}
                ,{field:'title',  title: '标题',width: 160}
                ,{field:'text',  sort: true, title: '正文'}
                ,{field:'stuinfo',  sort: true, align: 'left', title: '发布人',templet: '<div>{{d.stuinfo.sname}}</div>',width: 160}
            ]]
            ,id: 'testReload'
            // ,page: true
            ,height: '250'
            ,limit: 50
        });
        table.render({
            elem: '#LAY_table_tea'
            ,url: '/user/announcementTea'
            ,skin: 'line' //行边框风格
            ,size: 'lg' //小尺寸的表格
            // ,even: true //开启隔行背景
            ,response: {
                statusCode: 200 //规定成功的状态码，默认：0
            }
            ,where: {
                sclass:${sessionScope.userinfo.sclass}
            }
            ,cellMinWidth: 75
            ,cols: [[
                // {checkbox: true, fixed: true},
                {field:'atime',  sort: true, title: '时间',width: 160}
                ,{field:'title',  title: '标题',width: 160}
                ,{field:'text',  sort: true, title: '正文'}
                ,{field:'stuinfo',  sort: true, align: 'left', title: '发布人',templet: '<div>{{d.teainfo.tname}}</div>',width: 160}
            ]]
            ,id: 'testReload'
            // ,page: true
            ,height: '220'
            ,limit: 50
        });
        </c:if>
        <c:if test="${getrole == '2'}">
        table.render({
            elem: '#LAY_table_tea'
            ,url: '/user/Teaannouncement'
            ,skin: 'line' //行边框风格
            ,size: 'lg' //小尺寸的表格
            // ,even: true //开启隔行背景
            ,response: {
                statusCode: 200 //规定成功的状态码，默认：0
            }
            ,where: {
                publisher:${sessionScope.userinfo.teaid}
            }
            ,cellMinWidth: 75
            ,cols: [[
                // {checkbox: true, fixed: true},
                {field:'atime',  sort: true, title: '时间',width: 160}
                ,{field:'title',  title: '标题',width: 160}
                ,{field:'text',  sort: true, title: '正文'}
                ,{field:'stuinfo',  sort: true, align: 'left', title: '发布人',templet: '<div>{{d.teainfo.tname}}</div>',width: 160}
            ]]
            ,id: 'testReload'
            // ,page: true
            ,height: 'full-80'
            ,limit: 50
        });
        </c:if>
        var $ = layui.$, active = {
            reload: function(){
                var demoReload = $('#demoReload');
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        name:demoReload.val()
                    }
                });
            }
        };
        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>
</html>
