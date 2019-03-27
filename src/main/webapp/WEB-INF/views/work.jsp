<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Iamten
  Date: 2018/6/7
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>实习登记</title>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div>
    <div>
        <div style="padding: 10px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 15px;">
                <legend>实习登记</legend>
            </fieldset>
            <form class="layui-form" action="/work/workcheck" lay-filter="example">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">班级</label>
                        <div class="layui-input-inline">
                            <input name="classid"  id= "classid" autocomplete="off" lay-verify="required" placeholder="必填" class="layui-input" type="text" value="${sessionScope.userinfo.sclass}" readonly>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">学号</label>
                        <div class="layui-input-inline">
                            <input name="stuid"  id= "stuid" autocomplete="off" lay-verify="required" placeholder="必填" class="layui-input" type="text" value="${sessionScope.userinfo.stuid}" readonly>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-input-inline">
                            <input name="name"  id= "name" autocomplete="off" lay-verify="required" placeholder="必填" class="layui-input" type="text" value="${sessionScope.userinfo.sname}" readonly>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label"><font color="red" size="4">*</font>状态</label>
                        <div class="layui-input-inline">
                            <select id="status" name="status"  lay-verify="required" lay-filter="statusFilter">
                                <option value=""></option>
                                <option value="0">找工作</option>
                                <option value="1">未签三方</option>
                                <option value="2">已签三方</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item" id="companyform">
                    <%--<div class="layui-inline">--%>
                        <label class="layui-form-label"><font color="red" size="4">*</font>公司</label>
                        <div class="layui-input-block" style="width:514px;">
                            <input name="company"  id= "company" autocomplete="off" placeholder="未（已）签三方的同学必填写" lay-verify="required" class="layui-input" type="text" value="">
                        </div>
                    <%--</div>--%>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="updatework">立即提交</button>
                        <input type="button" class="layui-btn layui-btn-warm" value="重置" onclick="location.href='/work'">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script>
    layui.use(['form', 'laydate'], function(){
            var form = layui.form
                ,layer = layui.layer
                ,laydate = layui.laydate
                ,$ = layui.jquery;

        $.ajax({
            url: '/work/findwork',
            dataType: 'json',
            type: 'POST',
            data:{"stuid":${sessionScope.userinfo.stuid}},
            success: function (data) {
                if(data.is === 1){
                    $("#company").val(data.work.company);
                    $("#status").val(data.work.status);
                    form.render('select');
                }
            }
        });
        form.on('select(statusFilter)', function(data){
            if(data.value === "0"){
                $("#company").removeAttr("lay-verify");
                $("#company").val("");
                $("#companyform").hide();
            }else{
                $("#company").attr("lay-verify","required");
                $("#companyform").show();
            }
        });
        form.on('submit(updatework)', function(data){
            var action = data.form.action;//表单提交URL地址
            console.log(JSON.stringify(data.field));//表单数据
            $.post(action,data.field,function(obj){
                if(obj.code!==200){
                    alert("服务器错误，请联系服务器管理员！");
                    return false;
                }else{
                    alert(obj.msg);
                    location.reload();
                    return false;
                }
            });
            return false;//注释掉这行代码后，表单将会以普通方式提交表单，否则以ajax方式提交表单
        });
    })
</script>
</html>