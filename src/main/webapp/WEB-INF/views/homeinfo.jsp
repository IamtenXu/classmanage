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
    <title>班级信息</title>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div>
    <div>
        <!-- 内容主体区域 -->
        <div>
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 15px;">
                <legend>班级信息</legend>
            </fieldset>

            <form class="layui-form" action="/user/updatehome" lay-filter="example">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">学号</label>
                        <div class="layui-input-inline">
                            <input name="stuid" id="stuid" autocomplete="off" class="layui-input" type="text" value="" readonly>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">姓名</label>
                            <div class="layui-input-inline">
                                <input name="name" id="name" autocomplete="off" class="layui-input" type="text" value="" readonly>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">父亲姓名</label>
                        <div class="layui-input-inline">
                            <input name="fname" id="fname" autocomplete="off" class="layui-input" type="text" value="" >
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">父亲<br>联系方式</label>
                            <div class="layui-input-inline">
                                <input name="fphone" id="fphone" autocomplete="off" class="layui-input" type="text" value="" >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">父亲姓名</label>
                        <div class="layui-input-inline">
                            <input name="mname" id="mname" autocomplete="off" class="layui-input" type="text" value="" >
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">父亲<br>联系方式</label>
                            <div class="layui-input-inline">
                                <input name="mphone" id="mphone" autocomplete="off" class="layui-input" type="text" value="" >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                        <label class="layui-form-label">家庭地址</label>
                        <div class="layui-input-block">
                            <input name="hadress" id="hadress" autocomplete="off" class="layui-input" type="text" value="" >
                        </div>
                </div>
            </form>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="updateinfo">立即修改</button>
                    <input type="button" class="layui-btn layui-btn-danger dw-dailog" dw-url="updatepassword" dw-title="修改密码" value="修改密码">
                    <input type="button" class="layui-btn layui-btn-warm" value="刷新" onclick="location.href='stuinfo'">
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="layui/layui.js"></script>
<script>
    $.ajax({
        url: '/user/stuhomeinfo',
        dataType: 'json',
        type: 'POST',
        data:{"stuid": ${sessionScope.userinfo.stuid}},
        success: function (data) {
            $("#stuid").val(data.homeinfo.stuid);
            $("#name").val(data.homeinfo.stuinfo.sname);
            $("#fname").val(data.homeinfo.fname);
            $("#fphone").val(data.homeinfo.fphone);
            $("#mname").val(data.homeinfo.mname);
            $("#mphone").val(data.homeinfo.mphone);
            $("#hadress").val(data.homeinfo.hadress);
        }
    });
    layui.use(['form'], function(){
        var form = layui.form
            ,$ = layui.jquery

        form.on('submit(updateinfo)', function(data){
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
