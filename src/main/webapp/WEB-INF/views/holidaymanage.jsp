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
    <title>班级成员</title>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div>
    <div>
        <!-- 内容主体区域 -->
        <div>
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 15px;">
                <legend>离校登记管理</legend>
            </fieldset>
            <form class="layui-form">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">当前统计<br>节日</label>
                        <div class="layui-input-inline">
                            <input name="holidaying" class="layui-input" placeholder="必填" id="holidaying" type="text" autocomplete="off" value="" readonly>
                        </div>
                        <label class="layui-form-label">开始日期</label>
                        <div class="layui-input-inline">
                            <input name="starttime" class="layui-input" id="starttime" type="text" autocomplete="off" lay-verify="date" value="">
                        </div>
                        <label class="layui-form-label">结束日期</label>
                        <div class="layui-input-inline">
                            <input name="endtime" class="layui-input" id="endtime" type="text" autocomplete="off" lay-verify="date" value="">
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
            ,$ = layui.jquery
            ,table = layui.table;
        var holiday;
        $.ajax({
            url: '/holiday/holidayison',
            dataType: 'json',
            type: 'POST',
            success: function (data) {
                holiday = data.holiday.holidayname;
                $("#holidaying").val(data.holiday.holidayname);
                $("#starttime").val(data.holiday.starttime);
                $("#endtime").val(data.holiday.endtime);
            }
        });
        //方法级渲染
        table.render({
            elem: '#LAY_table_user'
            ,url: '/holiday/holidaymanage'
            ,response: {
                statusCode: 200 //规定成功的状态码，默认：0
            }
            ,where: {
                classid:${sessionScope.classinfo.classid}
                ,holidayname:$("#holidaying").val()
            }
            ,cellMinWidth: 75
            ,cols: [[
                // {checkbox: true, fixed: true},
                {field:'stuid',  sort: true, title: '学号'}
                ,{field:'name',  title: '姓名'}
                ,{field:'leavetime',  sort: true, title: '性别'}
                ,{field:'sbirthday',  sort: true, align: 'left', title: '出生日期'}
                ,{field:'spolitical', align: 'left', title: '政治面貌'}
                ,{field:'sphone', title: '手机号码'}
                ,{field:'sadress', align: 'left', title: '寝室'}
            ]]
            ,id: 'testReload'
            ,page: true
            ,height: 'full-100'
            ,limit: 50
        });
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
