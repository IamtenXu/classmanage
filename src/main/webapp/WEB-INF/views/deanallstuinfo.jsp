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
    <title>教师信息</title>
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
                <legend>学生信息</legend>
            </fieldset>
            <form class="layui-form" action="" lay-filter="example">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">学院</label>
                        <div class="layui-input-inline">
                            <select name="college"  lay-verify="required" id="college" lay-filter="collegeFilter">
                                <option value=""></option>
                            </select>
                        </div>
                        <label class="layui-form-label">专业</label>
                        <div class="layui-input-inline">
                            <select name="major"  lay-verify="required" id="major" lay-filter="majorFilter">
                                <option value=""></option>
                            </select>
                        </div>
                        <label class="layui-form-label">年级</label>
                        <div class="layui-input-inline">
                            <select name="cgard"  lay-verify="required" id="cgrade" lay-filter="cgradeFilter">
                                <option value=""></option>
                            </select>
                        </div>
                        <label class="layui-form-label">班级</label>
                        <div class="layui-input-inline">
                            <select name="classid"  lay-verify="required" id="classid" lay-filter="classidFilter">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>
            </form>
            <table class="layui-table" id="LAY_table_user" lay-filter="user"></table>
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
            url: '/dean/collegeclassselect',
            dataType: 'json',
            type: 'get',
            success: function (data) {
                $.each(data.college, function (index, item) {
                    $('#college').append(new Option(item.ccollege, item.ccollege));// 下拉菜单里添加元素
                });
                $("#major").empty();
                $('#major').append(new Option('',''));
                $("#cgrade").empty();
                $('#cgrade').append(new Option('',''));
                $("#classid").empty();
                $('#classid').append(new Option('',''));
                layui.form.render("select");//重新渲染 固定写法
            }
        });
        //方法级渲染
        table.render({
            elem: '#LAY_table_user'
            ,url: '/dean/allstuinfo'
            ,response: {
                statusCode: 200 //规定成功的状态码，默认：0
            }
            ,where: {
                college:$('#college').val()
            }
            ,cellMinWidth: 75
            ,cols: [[
                // {checkbox: true, fixed: true},
                {field:'sclass',  sort: true, title: '班级'}
                ,{field:'stuid',  sort: true, title: '学号'}
                ,{field:'roleinfo', width: 100,sort: true, align: 'left', title: '职务',templet: '<div>{{d.roleinfo.rname}}</div>'}
                ,{field:'sname', width: 90, title: '姓名'}
                ,{field:'ssex',  width: 80, sort: true, title: '性别'}
                ,{field:'students',  sort: true, title: '生源地'}
                ,{field:'sbirthday',  sort: true, align: 'left', title: '出生日期'}
                ,{field:'spolitical', align: 'left', title: '政治面貌'}
                ,{field:'sphone', title: '手机号码'}
                ,{field:'sadress', align: 'left', title: '寝室'}
                ,{field:'sphoto', title: '照片',templet: '<div><img src="{{d.sphoto}}"></div>'}
            ]]
            ,id: 'testReload'
            ,height: 'full-140'
            ,limit: 50
        });
        form.on('select(collegeFilter)', function(data){
            $.ajax({
                url: '/dean/majorselect',
                dataType: 'json',
                type: 'get',
                data:{"college": data.value},
                success: function (data) {
                    $("#major").empty();
                    $('#major').append(new Option('',''));
                    $.each(data.major, function (index, item) {
                        $('#major').append(new Option(item.major, item.major));// 下拉菜单里添加元素
                    });
                    $("#cgrade").empty();
                    $('#cgrade').append(new Option('',''));
                    $("#classid").empty();
                    $('#classid').append(new Option('',''));
                    layui.form.render("select");//重新渲染 固定写法
                }
            });
            table.reload('testReload', {
                where: {
                    college:data.value
                    ,major:''
                    ,cgrade:''
                    ,classid:''
                }
            });
        });
        form.on('select(majorFilter)', function(data){
            $.ajax({
                url: '/dean/gradeselect',
                dataType: 'json',
                type: 'get',
                data:{"major": data.value},
                success: function (data) {
                    $("#cgrade").empty();
                    $('#cgrade').append(new Option('',''));
                    $.each(data.cgrade, function (index, item) {
                        $('#cgrade').append(new Option(item.cgrade, item.cgrade));// 下拉菜单里添加元素
                    });
                    $("#classid").empty();
                    $('#classid').append(new Option('',''));
                    layui.form.render("select");//重新渲染 固定写法
                }
            });
            table.reload('testReload', {
                where: {
                    college:$('#college').val()
                    ,major:data.value
                    ,cgrade:''
                    ,classid:''
                }
            });
        });
        form.on('select(cgradeFilter)', function(data){
            $.ajax({
                url: '/dean/classselect',
                dataType: 'json',
                type: 'get',
                data:{"major": $('#major').val(),"cgrade": data.value},
                success: function (data) {
                    $("#classid").empty();
                    $('#classid').append(new Option('',''));
                    $.each(data.classid, function (index, item) {
                        $('#classid').append(new Option(item.classid, item.classid));// 下拉菜单里添加元素
                    });
                    layui.form.render("select");//重新渲染 固定写法
                }
            });
            table.reload('testReload', {
                where: {
                    college:$('#college').val()
                    ,major:$('#major').val()
                    ,cgrade:data.value
                    ,classid:''
                }
            });
        });
        form.on('select(classidFilter)', function(data){
            table.reload('testReload', {
                where: {
                    college:$('#college').val()
                    ,major:$('#major').val()
                    ,cgrade:$('#grade').val()
                    ,classid:data.value
                }
            });
        });
    });
</script>
</html>
