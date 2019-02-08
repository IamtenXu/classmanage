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
                <legend>信息管理 - 修改密码</legend>
                <div class="layui-field-box">
                    <form class="layui-form" action="/user/updateallpassword">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-inline">
                                <c:if test="${getrole == '1'||getrole == '2'||getrole == '3'}">
                                    <input type="text" name="username" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input" disabled value="${sessionScope.userinfo.teaid}">
                                </c:if>
                                <c:if test="${getrole != '1'&&getrole != '2'&&getrole != '3'}">
                                    <input type="text" name="username" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input" disabled value="${sessionScope.userinfo.stuid}">
                                </c:if>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">原密码</label>
                            <div class="layui-input-inline">
                                <input type="password" name="password" required lay-verify="required" placeholder="请输入原密码" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">新密码</label>
                            <div class="layui-input-inline">
                                <input type="password" name="password1" required lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">确认密码</label>
                            <div class="layui-input-inline">
                                <input type="password" name="password2" required lay-verify="regPwd" placeholder="请确认密码" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
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
<script type="text/javascript" src="js/dw_form_submit.js"></script>
<script type="text/javascript" src="js/cookie.js"></script>
</body>
</html>
