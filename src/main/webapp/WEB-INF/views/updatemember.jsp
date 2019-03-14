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
                <legend>修改学生信息</legend>
                <div class="layui-field-box">
                    <form class="layui-form" action="/user/teaupdatestu" lay-filter="example">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">学号</label>
                                <div class="layui-input-inline">
                                    <input name="stuid"  id="stuid" autocomplete="off" class="layui-input" type="text" value="" readonly>
                                </div>
                                <label class="layui-form-label">姓名</label>
                                <div class="layui-input-inline">
                                    <input name="sname"  id="sname" autocomplete="off" readonly class="layui-input" type="text" value="">
                                </div>
                                <label class="layui-form-label">班级</label>
                                <div class="layui-input-inline">
                                    <input name="sclass" id="sclass" autocomplete="off" readonly class="layui-input" type="text" value="">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">性别</label>
                            <div class="layui-input-inline">
                                <select name="ssex" id="ssex" lay-verify="required" >
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">出生日期</label>
                                <div class="layui-input-inline">
                                    <input name="sbirthday" class="layui-input" id="sbirthday" type="text" placeholder="yyyy-MM-dd" autocomplete="off" lay-verify="date" value="">
                                </div>
                                <label class="layui-form-label">生源地</label>
                                <div class="layui-input-inline">
                                    <input name="students" id="students" autocomplete="off" class="layui-input" type="text" value="">
                                </div>
                                <label class="layui-form-label">政治面貌</label>
                                <div class="layui-input-inline">
                                    <select name="militarists" id="spolitical" lay-verify="required">
                                        <option>群众</option>
                                        <option>共青团员</option>
                                        <option>预备党员</option>
                                        <option>党员</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">手机号</label>
                                <div class="layui-input-inline">
                                    <input name="sphone" id="sphone" autocomplete="off" class="layui-input" type="text" maxlength="11" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" value="">
                                </div>
                                <label class="layui-form-label">邮箱</label>
                                <div class="layui-input-inline">
                                    <input name="semail" id="semail" autocomplete="off" class="layui-input" type="email" value="">
                                </div>
                                <label class="layui-form-label">寝室</label>
                                <div class="layui-input-inline">
                                    <input name="dormitory" id="dormitory" autocomplete="off" class="layui-input" type="text" value="">
                                </div>
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
<script type="text/javascript" src="js/time.js"></script>
</body>
<script>
    $.ajax({
        url: '/user/stuinfoByStuid',
        dataType: 'json',
        type: 'POST',
        data: {"stuid":${param.stuid}},
        success: function (data) {
            $("#sname").val(data.stuinfo.sname);
            $("#stuid").val(data.stuinfo.stuid);
            $("#sclass").val(data.stuinfo.sclass);
            $("#ssex").val(data.stuinfo.ssex);
            $("#sbirthday").val(data.stuinfo.sbirthday);
            $("#students").val(data.stuinfo.students);
            $("#spolitical").val(data.stuinfo.spolitical);
            $("#sphone").val(data.stuinfo.sphone);
            $("#semail").val(data.stuinfo.semail);
            $("#dormitory").val(data.stuinfo.sadress);
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
        //日期
        laydate.render({
            elem: '#sbirthday'
        });
    });
</script>
</html>
