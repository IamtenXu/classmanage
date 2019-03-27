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
    <title>实习信息</title>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div>
    <div>
        <!-- 内容主体区域 -->
        <div>
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 15px;">
                <legend>实习信息</legend>
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
                        <div class="layui-input-inline">
                            <button class="layui-btn dw-dailog" dw-url="/practiceanalysis" dw-title="实习情况分析" type = "button">分析</button>
                        </div>
                    </div>
                </div>
            </form>
            <%--&nbsp;&nbsp;&nbsp;&nbsp;<button class="layui-btn dw-dailog" dw-url="/practiceanalysis" dw-title="实习情况分析">分析</button>--%>
            <table class="layui-table" id="LAY_table_user" lay-filter="user"></table>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/html" id="tpl_demo">
    {{#  if(d.isrent == '1'){ }}
    是
    {{#  } else { }}
    否
    {{#  } }}
</script>
<script>
    layui.use(['element','table'], function(){
        var element = layui.element;
        var table = layui.table;
        var form = layui.form;

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
            ,url: '/practice/practicelist'
            ,response: {
                statusCode: 200 //规定成功的状态码，默认：0
            }
            ,where: {
                classid:$('#classid').val()
            }
            ,cellMinWidth: 75
            ,cols: [[
                // {checkbox: true, fixed: true},
                {field:'stuid',  sort: true, width: 100, title: '学号'}
                ,{field:'stuinfo',  title: '姓名', width: 80,templet: '<div>{{d.stuinfo.sname}}</div>'}
                ,{field:'company',  sort: true, width: 250, title: '公司'}
                ,{field:'starttime', align: 'left', width: 125, title: '开始日期'}
                ,{field:'endtime', align: 'left', width: 125, title: '结束日期'}
                ,{field:'isrent',align: 'center',  sort: true, width: 80,title: '租房', templet: '#tpl_demo'}
                ,{field:'address', align: 'left', title: '住址'}
            ]]
            ,id: 'testReload'
            // ,page: true
            ,height: 'full-140'
            ,limit: 20
        });

        form.on('select(classidFilter)', function(data){
            table.reload('testReload', {
                where: {
                    classid:$('#classid').val()
                }
            });
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
            if(dw_height == undefined) dw_height = '80%';
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
