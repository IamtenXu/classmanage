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
    <title>Iamten群组通讯录</title>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-lg12">
            <fieldset class="layui-elem-field">
                <legend>修改通知</legend>
                <div class="layui-field-box">
                    <form class="layui-form" action="/user/updateAnnouncement">
                        <div class="layui-form-item">
                            <label class="layui-form-label">标题</label>
                            <div class="layui-input-inline">
                                <input type="text" id='title' name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">正文</label>
                            <div class="layui-input-inline">
                                <textarea placeholder="请输入正文" lay-verify="required" class="layui-textarea" name="text" id="textarea"></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">时间</label>
                            <div class="layui-input-inline">
                                <input name="atime" class="layui-input" id="date" type="text" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" lay-verify="date">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                            </div>
                        </div>
                    </form>
                </div>
            </fieldset>
        </div>
    </div>
    <%--<div class="layui-footer">--%>
        <%--<!-- 底部固定区域 -->--%>
        <%--<span style="float:right;">© iamten.xin - 出现任何问题，请联系 xh601@126.com</span>--%>
    <%--</div>--%>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="js/cookie.js"></script>
<script type="text/javascript" src="js/textarea.js"></script>
</body>
<script>
    $.ajax({
        url: '/user/announcementById',
        dataType: 'json',
        type: 'POST',
        data: {"id":${param.id}},
        success: function (data) {
            $("#title").val(data.announcement.title);
            $("#textarea").val(data.announcement.text);
        }
    });
    layui.use(['element','form','laydate'], function(){
        var element = layui.element;
        var form = layui.form;
        var laydate = layui.laydate;
        form.on('submit(formDemo)', function(data){
            var action = data.form.action;//表单提交URL地址
            console.log(JSON.stringify(data.field));//表单数据
            $.post(action,data.field,function(obj){
                if(obj.code===500){
                    alert(obj.msg);
                    return false;
                }else{
                    alert("修改成功");
                    return false;
                }
            });
            return false;//注释掉这行代码后，表单将会以普通方式提交表单，否则以ajax方式提交表单
        });
        //执行一个laydate实例
        laydate.render({
            elem: '#date' //指定元素
            ,type: 'datetime'
            ,value: new Date()
        });
    });
</script>
</html>
