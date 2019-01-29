<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Iamten
  Date: 2018/6/7
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>E班</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo"><font size="5">班级事务处理系统</font></div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="index" target="main_self_frame">照片墙</a></li>
            <li class="layui-nav-item"><a href="index_video" target="main_self_frame">视频</a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="${sessionScope.user.photo}" class="layui-nav-img">
                    ${sessionScope.user.name}
                    ${sessionScope.user.role}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="userinfo">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="tologin">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree">
                <li class="layui-nav-item "><a href="index" target="main_self_frame">首页</a></li>
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        个人
                        <span class="layui-nav-more"></span>
                    </a>

                    <dl class="layui-nav-child">
                        <dd class="layui-this"><a href="userinfo" target="main_self_frame">基本信息</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:">班级</a>
                    <dl class="layui-nav-child">
                        <dd><a href="tomember" target="main_self_frame">成员列表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">班级事务</a>
                    <dl class="layui-nav-child">
                        <dd><a href="toholiday" target="main_self_frame">法定节假日离校登记</a></dd>
                        <dd><a href="tovacation" target="main_self_frame">寒暑假离校情况</a></dd>
                        <dd><a href="tofuture" target="main_self_frame">实习考研情况</a></dd>
                    </dl>
                </li>
                <c:set var="getpermission" scope="page" value="${sessionScope.user.permission}"/>
                <c:if test="${getpermission == '1'}">
                    <li class="layui-nav-item">
                        <a href="javascript:;">管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="tomembermanage" target="main_self_frame">成员管理</a></dd>
                            <dd><a href="toservicemanage" target="main_self_frame">接口管理</a></dd>
                            <dd><a href="toholidaymanage" target="main_self_frame">离校登记管理</a></dd>
                            <dd><a href="tovacationmanage" target="main_self_frame">寒暑假离校情况管理</a></dd>
                            <dd><a href="tofuturemanage" target="main_self_frame">实习考研情况管理</a></dd>
                        </dl>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
    <div class="layui-body">
        <iframe src="index" name="main_self_frame" frameborder="0" class="layadmin-iframe"></iframe>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        <span style="float:right;">© iamten.xin - 出现任何问题，请联系 xh601@126.com</span>
    </div>
</div>
</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="js/index.js"></script>
</html>
