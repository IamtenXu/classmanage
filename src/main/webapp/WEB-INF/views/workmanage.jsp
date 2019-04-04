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
    <title>工作信息</title>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div>
    <div>
        <!-- 内容主体区域 -->
        <div>
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 15px;">
                <legend>工作信息</legend>
            </fieldset>
            &nbsp;&nbsp;&nbsp;&nbsp;<button class="layui-btn dw-dailog" dw-url="/workanalysis" dw-title="工作情况分析">分析</button>
            <table class="layui-table" id="LAY_table_user" lay-filter="user"></table>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/html" id="tpl_demo">
    {{#  if(d.status == '0'){ }}
    找工作
    {{#  } else if(d.status == '1'){ }}
    未签三方
    {{#  } else if(d.status == '2'){ }}
    已签三方
    {{#  } }}
</script>
<script>
    layui.use(['element','table'], function(){
        var element = layui.element;
        var table = layui.table;
        var form = layui.form;

        //方法级渲染
        table.render({
            elem: '#LAY_table_user'
            ,url: '/work/worklist'
            ,response: {
                statusCode: 200 //规定成功的状态码，默认：0
            }
            ,where: {
                classid:${sessionScope.classinfo.classid}
            }
            ,cellMinWidth: 75
            ,cols: [[
                // {checkbox: true, fixed: true},
                {field:'stuid',  sort: true, width:120,title: '学号'}
                ,{field:'stuinfo',  title: '姓名',width:120,templet: '<div>{{d.stuinfo.sname}}</div>'}
                ,{field:'isrent',align: 'center', width:120, title: '状态', templet: '#tpl_demo'}
                ,{field:'company', title: '公司'}
            ]]
            ,id: 'testReload'
            // ,page: true
            ,height: 'full-140'
            ,limit: 20
        });

        // +----------------------------------------------------------------------
        // | 弹出层
        // +----------------------------------------------------------------------
        $(".dw-dailog").click(function(){
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
            if(dw_width == undefined) dw_width = '60%';
            if(dw_height == undefined) dw_height = '100%';
            layer.open({
                type: 2,
                title: dw_title,
                shadeClose: true,
                shade: 0.8,
                area: [dw_width, dw_height],
                content: dw_url,
                end: function () {
                    location.reload();
                }
                ,cancel: function () {
                    layer.closeAll();
                    location.reload();
                    return false;
                }
            });
        });
    });
</script>
</html>
