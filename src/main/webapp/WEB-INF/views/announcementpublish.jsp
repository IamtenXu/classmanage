<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xh601
  Date: 2019/2/1
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="getrole" scope="page" value="${sessionScope.userinfo.roleinfo.rcode}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>15052316班</title>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div>
    <div>
        <!-- 内容主体区域 -->
        <div>
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 15px;">
                <legend>发布通知</legend>
            </fieldset>
            <form class="layui-form" action="/announcement/publishAnnouncement">
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
                        <input name="atime" class="layui-input" id="datetime" type="text" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" lay-verify="datetime">
                    </div>
                </div>
                <div class="layui-form-item" style="display:none;">
                    <label class="layui-form-label">发布人</label>
                    <div class="layui-input-inline">
                        <c:if test="${getrole != '1'&&getrole != '2'&&getrole != '3'}">
                            <input type="text" id='publisher' name="publisher" required  lay-verify="required" autocomplete="off" class="layui-input" value="${sessionScope.userinfo.stuid}">
                        </c:if>
                        <c:if test="${getrole == '1'||getrole == '2'||getrole == '3'}">
                            <input type="text" id='publisher' name="publisher" required  lay-verify="required" autocomplete="off" class="layui-input" value="${sessionScope.userinfo.teaid}">
                        </c:if>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">立即发布</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="js/cookie.js"></script>
<script type="text/javascript" src="js/textarea.js"></script>
<script type="text/javascript" src="js/time.js"></script>
<script>
    layui.use(['element','form','laydate'], function(){
        var element = layui.element;
        var form = layui.form;
        var laydate = layui.laydate;
        form.on('submit(formDemo)', function(data){
            var action = data.form.action;//表单提交URL地址
            console.log(JSON.stringify(data.field));//表单数据
            $.post(action,data.field,function(obj){
                if(obj.code===200){
                    alert("发布成功");
                    return false;
                }else{
                    alert(obj.msg);
                    return false;
                }
            });
            return false;//注释掉这行代码后，表单将会以普通方式提交表单，否则以ajax方式提交表单
        });
        //执行一个laydate实例
        laydate.render({
            elem: '#datetime' //指定元素
            ,type: 'datetime'
            ,format: 'yyyy-MM-dd HH:mm:ss' //可任意组合
            ,value: getNowFormatDate()
        });
    });
</script>
</html>
