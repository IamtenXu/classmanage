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
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 15px;">
                <legend>班委信息</legend>
            </fieldset>
            <%--<div class="demoTable">--%>
                <%--搜索姓名：--%>
                <%--<div class="layui-inline">--%>
                    <%--<input name="username" class="layui-input" id="demoReload" autocomplete="off" placeholder="请输完整姓名">--%>
                <%--</div>--%>
                <%--<button class="layui-btn" data-type="reload">搜索</button>--%>
                <%--&lt;%&ndash;<button class="layui-btn" data-type="getCheckLength">选中数目</button>&ndash;%&gt;--%>
            <%--</div>--%>
            <table class="layui-table" id="LAY_table_user" lay-filter="user"></table>


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

        //方法级渲染
        table.render({
            elem: '#LAY_table_user'
            ,url: '/user/classmanager'
            ,response: {
                statusCode: 200 //规定成功的状态码，默认：0
            }
            ,where: {
                sclass:${sessionScope.classinfo.classid}
            }
            ,cellMinWidth: 75
            // ,cols: [[
            //     // {checkbox: true, fixed: true},
            //     {field:'roleinfo', width: 75, sort: true, align: 'left', title: '角色',templet: '<div>{{d.roleinfo.rname}}</div>'}
            //     ,{field:'stuid', width:100, sort: true, title: '学号'}
            //     ,{field:'sname', width:100, title: '姓名'}
            //     ,{field:'ssex', width: 80, sort: true, title: '性别'}
            //     ,{field:'sbirthday', width: 125, sort: true, align: 'left', title: '出生日期'}
            //     ,{field:'spolitical', width: 125, align: 'left', title: '政治面貌'}
            //     ,{field:'sphone', width:150, title: '手机号码'}
            //     ,{field:'sadress', width: 125, align: 'left', title: '寝室'}
            // ]]
            ,cols: [[
                // {checkbox: true, fixed: true},
                {field:'roleinfo', sort: true, align: 'left', title: '角色',templet: '<div>{{d.roleinfo.rname}}</div>'}
                ,{field:'stuid',  sort: true, title: '学号'}
                ,{field:'sname',  title: '姓名'}
                ,{field:'ssex',  sort: true, title: '性别'}
                ,{field:'sbirthday',  sort: true, align: 'left', title: '出生日期'}
                ,{field:'spolitical', align: 'left', title: '政治面貌'}
                ,{field:'sphone', title: '手机号码'}
                ,{field:'sadress', align: 'left', title: '寝室'}
            ]]
            ,id: 'testReload'
            ,page: true
            ,height: 'full-100'
            ,limit: 20
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
