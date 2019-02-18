<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xh601
  Date: 2019/2/1
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>班委信息</title>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div>
    <div>
        <!-- 内容主体区域 -->
        <div>
            <%--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 15px;">--%>
                <%--<legend>各班通知</legend>--%>
            <%--</fieldset>--%>
            <form class="layui-form" action="" lay-filter="example" style="margin-top: 15px;">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">班级号</label>
                        <div class="layui-input-inline">
                            <select name="classid"  lay-verify="required" id="classid" lay-filter="classidFilter">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>
            </form>
            <fieldset class="layui-elem-field layui-field-title" >
                <legend>班级通知</legend>
            </fieldset>
            <table class="layui-table" id="LAY_table_user" lay-filter="user"></table>
            <fieldset class="layui-elem-field layui-field-title">
                <legend>班主任通知</legend>
            </fieldset>
            <table class="layui-table" id="LAY_table_tea" lay-filter="user"></table>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="layui/layui.js"></script>
<script>
    layui.use(['element','table','form'], function(){
        var element = layui.element
            ,table = layui.table
            ,form = layui.form
            ,$ = layui.jquery;


        //添加下拉框选项
        $.ajax({
            url: '/instructor/instructorselect',
            dataType: 'json',
            type: 'get',
            success: function (data) {
                $.each(data.classinfo, function (index, item) {
                    $('#classid').append(new Option(item.classid, item.classid));// 下拉菜单里添加元素
                });
                layui.form.render("select");//重新渲染 固定写法
            }
        });

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
                sclass:$('#classid').val()
            }
            ,cellMinWidth: 75
            ,cols: [[
                // {checkbox: true, fixed: true},
                {field:'atime',  sort: true, title: '时间',width: 160}
                ,{field:'title',  title: '标题',width: 160}
                ,{field:'text',  sort: true, title: '正文'}
                ,{field:'stuinfo',  sort: true, align: 'left', title: '发布人',templet: '<div>{{d.stuinfo.sname}}</div>',width: 160}
            ]]
            ,id: 'testReload1'
            // ,page: true
            ,height: '205'
            ,limit: 50
        });
        table.render({
            elem: '#LAY_table_tea'
            ,url: '/announcement/announcementHead'
            ,skin: 'line' //行边框风格
            ,size: 'lg' //小尺寸的表格
            // ,even: true //开启隔行背景
            ,response: {
                statusCode: 200 //规定成功的状态码，默认：0
            }
            ,where: {
                sclass:$('#classid').val()
            }
            ,cellMinWidth: 75
            ,cols: [[
                // {checkbox: true, fixed: true},
                {field:'atime',  sort: true, title: '时间',width: 160}
                ,{field:'title',  title: '标题',width: 160}
                ,{field:'text',  sort: true, title: '正文'}
                ,{field:'stuinfo',  sort: true, align: 'left', title: '发布人',templet: '<div>{{d.teainfo.tname}}</div>',width: 160}
            ]]
            ,id: 'testReload2'
            // ,page: true
            ,height: '205'
            ,limit: 50
        });
        form.on('select(classidFilter)', function(data){
            table.reload('testReload1', {
                where: {
                    sclass:$('#classid').val()
                }
            });
            table.reload('testReload2', {
                where: {
                    sclass:$('#classid').val()
                }
            });
        });
    });
</script>
</html>
