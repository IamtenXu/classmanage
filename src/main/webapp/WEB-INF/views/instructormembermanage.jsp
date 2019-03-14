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
                <legend>班级成员</legend>
            </fieldset>
            <form class="layui-form" action="" lay-filter="example">
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
            <table class="layui-table" id="LAY_table_user" lay-filter="demo"></table>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="layui/layui.js"></script>
<script id="barDemo" type="text/html">
    <a class="layui-btn layui-btn-warm layui-btn-xs dw-dailog" lay-event="update" dw-url="/updatemember" dw-title="修改学生信息">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
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
            ,url: '/user/classmember'
            ,response: {
                statusCode: 200 //规定成功的状态码，默认：0
            }
            ,where: {
                sclass:$('#classid').val()
            }
            ,cellMinWidth: 75
            ,cols: [[
                // {checkbox: true, fixed: true},
                {field:'stuid',  sort: true, title: '学号',width: 100}
                ,{field:'sname',  title: '姓名',width: 80}
                ,{field:'ssex',  sort: true, title: '性别',width: 80}
                ,{field:'students',  sort: true, title: '生源地'}
                ,{field:'sbirthday',  sort: true, align: 'left', title: '出生日期'}
                ,{field:'spolitical', sort: true,align: 'left', title: '政治面貌',width: 100}
                ,{field:'sphone', title: '手机号码'}
                ,{field:'sadress', align: 'left', title: '寝室'}
                ,{field:'sphoto', title: '照片',templet: '<div><img src="{{d.sphoto}}"></div>'}
                ,{fixed: 'right', title: '操作',width:150, align:'center', toolbar: '#barDemo'}
            ]]
            ,id: 'testReload'
            ,page: true
            ,height: 'full-140'
            ,limit: 50
        });
        form.on('select(classidFilter)', function(data){
            table.reload('testReload', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    sclass:$('#classid').val()
                }
            });
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
                if(dw_height == undefined) dw_height = '80%';
                layer.open({
                    type: 2,
                    title: dw_title,
                    shadeClose: true,
                    shade: 0.8,
                    area: [dw_width, dw_height],
                    content: dw_url+"?stuid="+data.stuid,
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
                        url: "/announcement/deletAnnouncement",
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
    });
</script>
</html>
