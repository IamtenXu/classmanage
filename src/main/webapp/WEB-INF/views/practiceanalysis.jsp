<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/1 0001
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="getrole" scope="page" value="${sessionScope.userinfo.roleinfo.rcode}"/>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>实习情况分析</title>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-lg12">
            <fieldset class="layui-elem-field">
                <legend>实习情况分析</legend>
                <div class="layui-field-box">
                    <c:if test="${getrole == '2'}">
                        <form class="layui-form">
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
                    </c:if>
                    <form id="formcontainer">
                    </form>
                </div>
            </fieldset>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="js/cookie.js"></script>
<script type="text/javascript" src="js/textarea.js"></script>
<script type="text/javascript" src="js/time.js"></script>
</body>
<script>
    layui.use(['element','form','laydate'], function(){
        var element = layui.element;
        var form = layui.form;
        <c:if test="${getrole == '2'}">
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
        form.on('select(classidFilter)', function(){
            $.ajax({
                url: '/practice/analysislist',
                dataType: 'json',
                type: 'POST',
                async : false,
                data:{"classid":$('#classid').val()},
                success: function (data) {
                    $('#formcontainer').empty();
                    $('#formcontainer').append("<label><font size='5'> 实习总人数为"+data.sum+"人"+"</font></label><br>");
                    $.each(data.practiceAnalyses, function (index, item) {
                        $('#formcontainer').append(" <br><label><strong> "+(index+1)+" "+item.company+"(共"+item.num+"人)"+"</strong></label><br>\n" +
                            "                        <div class=\"layui-progress layui-progress-big\" lay-showPercent=\"true\" lay-filter=\"demo"+index+"\">\n" +
                            "                            <div class=\"layui-progress-bar layui-bg-blue\" lay-percent=\""+item.percent+"\"></div>\n" +
                            "                        </div>");
                        element.progress('demo'+index,item.percent);
                    });
                }
            });
        });
        </c:if>
    });
    <c:if test="${getrole != '2'}">
    $.ajax({
        url: '/practice/analysislist',
        dataType: 'json',
        type: 'POST',
        async : false,
        data:{"classid":${sessionScope.classinfo.classid}},
        success: function (data) {
            $('#formcontainer').append("<label><font size='5'> 实习总人数为"+data.sum+"人"+"</font></label><br>");
            $.each(data.practiceAnalyses, function (index, item) {
                $('#formcontainer').append(" <br><label><strong> "+(index+1)+" "+item.company+"(共"+item.num+"人)"+"</strong></label><br>\n" +
                    "                        <div class=\"layui-progress layui-progress-big\" lay-showPercent=\"true\">\n" +
                    "                            <div class=\"layui-progress-bar layui-bg-blue\" lay-percent=\""+item.percent+"\"></div>\n" +
                    "                        </div>");
            });
        }
    });
    </c:if>
</script>
</html>
