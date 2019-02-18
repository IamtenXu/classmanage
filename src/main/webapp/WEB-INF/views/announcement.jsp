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
            <c:if test="${getrole != '1'&&getrole != '2'}">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 15px;">
                    <legend>班级通知</legend>
                </fieldset>
                <table class="layui-table" id="LAY_table_user" lay-filter="user"></table>
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>辅导员/班主任通知</legend>
                </fieldset>
                <table class="layui-table" id="LAY_table_tea" lay-filter="user"></table>
            </c:if>
            <c:if test="${getrole == '2'}">
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>已发布通知</legend>
                </fieldset>
                <table class="layui-table" id="LAY_table_tea" lay-filter="demo"></table>
            </c:if>
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
        <c:if test="${getrole != '1'&&getrole != '2'}">
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
            ,url: '/user/announcementTea'
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
                ,{field:'text',   title: '正文'}
                ,{field:'stuinfo',  sort: true, align: 'left', title: '发布人',templet: '<div>{{d.teainfo.tname}}</div>',width: 160}
                ,{fixed: 'right', title: '操作',width:150, align:'center', toolbar: '#barDemo'}
            ]]
            ,id: 'testReload'
            // ,page: true
            ,height: 'full-80'
            ,limit: 50
        });
        table.on('tool(demo)', function(obj) {
            var data = obj.data;
            if(obj.event === 'update'){
                var dw_url = $(this).attr("dw-url");//URL地址，必填
                var dw_title = $(this).attr("dw-title");//弹出层标题，必填
                var dw_width = $(this).attr("dw-width");//弹出层宽度，如80%或500px；如果没有默认为屏幕宽度的50%
                var dw_height = $(this).attr("dw-height");//弹出层高度，如50%或500px；如果没有默认为屏幕高度的50%
                if(dw_url == undefined) {
                    layer.msg("请给button加上dw-url属性");
                    return false;
                }
                if(dw_title == undefined) {
                    layer.msg("请给button加上dw-title属性");
                    return false;
                }
                if(dw_width == undefined) dw_width = '30%';
                if(dw_height == undefined) dw_height = '62%';
                layer.open({
                    type: 2,
                    title: dw_title,
                    shadeClose: true,
                    shade: 0.8,
                    area: [dw_width, dw_height],
                    content: dw_url+"?id="+data.id,
                    end: function () {
                        location.reload();
                    }
                    ,cancel: function () {
                        layer.closeAll();
                        location.reload();
                        return false;
                    }
                })
            }else if(obj.event === 'del'){
                layer.confirm('确定要删除这条通知吗？', function(index){
                    console.log(data);
                    $.ajax({
                        url: "/user/deletAnnouncement",
                        type: "POST",
                        data:{"id":data.id},
                        dataType: "json",
                        success: function(data){
                            if(data.code===200){
                                //删除这一行
                                obj.del();
                                //关闭弹框
                                layer.close(index);
                                layer.msg("删除成功", {icon: 6});
                            }else{
                                layer.msg("删除失败", {icon: 5});
                            }
                        }
                    });
                });
            }
        });
        </c:if>
    });
</script>
</html>
