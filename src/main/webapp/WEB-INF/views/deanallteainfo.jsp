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
                <legend>教师信息</legend>
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
            url: '/dean/collegeselect',
            dataType: 'json',
            type: 'get',
            success: function (data) {
                $.each(data.college, function (index, item) {
                    $('#college').append(new Option(item.tcollege, item.tcollege));// 下拉菜单里添加元素
                });
                layui.form.render("select");//重新渲染 固定写法
            }
        });
        //方法级渲染
        table.render({
            elem: '#LAY_table_user'
            ,url: '/dean/allteainfo'
            ,method:'POST'
            ,response: {
                statusCode: 200 //规定成功的状态码，默认：0
            }
            ,where: {
                college:$('#college').val()
            }
            ,cellMinWidth: 75
            ,cols: [[
                // {checkbox: true, fixed: true},
                {field:'teaid',  sort: true, title: '工号'}
                ,{field:'tname',  title: '姓名'}
                ,{field:'tsex',  sort: true, title: '性别'}
                ,{field:'tbirthday',  sort: true, align: 'left', title: '出生日期'}
                ,{field:'tpolitical', align: 'left', title: '政治面貌'}
                ,{field:'title', align: 'left', title: '职称'}
                ,{field:'tphone', title: '手机号码'}
                ,{field:'tcollege', align: 'left', title: '学院'}
                ,{field:'taddress', align: 'left', title: '办公室'}
                ,{field:'sphoto', title: '照片',templet: '<div><img src="{{d.tphoto}}"></div>'}
            ]]
            ,id: 'testReload'
            ,page: true
            ,height: 'full-140'
            ,limit: 50
        });
        form.on('select(collegeFilter)', function(data){
            table.reload('testReload', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    college:$('#college').val()
                }
            });
        });
    });
</script>
</html>
