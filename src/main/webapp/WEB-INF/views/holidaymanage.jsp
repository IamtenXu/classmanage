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
                        <label class="layui-form-label">节日</label>
                        <div class="layui-input-inline">
                            <select name="holiday"  lay-verify="required" id="holiday" lay-filter="holidayFilter">
                                <option value=""></option>
                            </select>
                        </div>
                        <label class="layui-form-label">当前节日</label>
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
            ,form = layui.form
            ,table = layui.table
            ,holidayname;
        $.ajax({
            url: '/holiday/holidayison',
            dataType: 'json',
            type: 'POST',
            async:false,
            success: function (data) {
                holidayname = data.holiday.holidayname;
                $("#holidaying").val(data.holiday.holidayname);
                $("#starttime").val(data.holiday.starttime);
                $("#endtime").val(data.holiday.endtime);
            }
        });
        //添加下拉框选项
        $.ajax({
            url: '/holiday/holidayselect',
            dataType: 'json',
            type: 'POST',
            success: function (data) {
                $.each(data.holiday, function (index, item) {
                    $('#holiday').append(new Option(item.holidayname, item.holidayname));// 下拉菜单里添加元素
                });
                layui.form.render("select");//重新渲染 固定写法
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
                ,holidayname:holidayname
            }
            ,cellMinWidth: 60
            ,cols: [[
                // {checkbox: true, fixed: true},
                {field:'stuid',  sort: true, title: '学号'}
                ,{field:'name',  title: '姓名', width: 60}
                ,{field:'leavetime', title: '离校时间'}
                ,{field:'backtime',  title: '返校时间'}
                ,{field:'phone', title: '手机号码'}
                ,{field:'gotowhere', title: '去向',width: 60}
                ,{field:'province',  sort: true, title: '省'}
                ,{field:'city',   sort: true,title: '市'}
                ,{field:'area',   sort: true,title: '县/区/县级市'}
                ,{field:'emergencyname', align: 'left', title: '紧急联系人'}
                ,{field:'emergencyphone', title: '紧急联系人联系方式'}
                ,{field:'note', align: 'left', title: '备注'}
            ]]
            ,id: 'testReload'
            ,page: true
            ,height: 'full-140'
            ,limit: 50
        });
        form.on('select(holidayFilter)', function(data){
            table.reload('testReload', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    holidayname:data.value
                }
            });
            $.ajax({
                url: '/holiday/holidaytime',
                dataType: 'json',
                type: 'POST',
                data:{"holidayname": data.value},
                success: function (data) {
                    $("#holidaying").val(data.holiday.holidayname);
                    $("#starttime").val(data.holiday.starttime);
                    $("#endtime").val(data.holiday.endtime);
                }
            });
        });
    });
</script>
</html>
