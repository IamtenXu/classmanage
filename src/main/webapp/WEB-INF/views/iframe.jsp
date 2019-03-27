<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Iamten
  Date: 2018/6/7
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="getrole" scope="page" value="${sessionScope.userinfo.roleinfo.rcode}"/>
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
                <c:if test="${getrole != '1'&&getrole != '2'}">
                <li class="layui-nav-item"><a href="/announcement" target="main_self_frame">通知</a></li>
                </c:if>
            <c:if test="${getrole == '2'}">
                <li class="layui-nav-item"><a href="/instrucetorannouncement" target="main_self_frame">各班通知</a></li>
            </c:if>
            <c:if test="${getrole == '2'||getrole == '3'||getrole == '4'||getrole == '5'}">
                <li class="layui-nav-item"><a href="/announcementpublish" target="main_self_frame">发布通知</a></li>
            </c:if>
            <c:if test="${getrole == '2'||getrole == '3'||getrole == '4'||getrole == '5'}">
                <li class="layui-nav-item"><a href="/announcementfinished" target="main_self_frame">已发通知</a></li>
            </c:if>
            </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <c:if test="${getrole == '1'||getrole == '2'||getrole == '3'}">
                    <a href="/teainfo" target="main_self_frame">
                </c:if>
                <c:if test="${getrole != '1'&&getrole != '2'&&getrole != '3'}">
                    <a href="/stuinfo" target="main_self_frame">
                </c:if>
                    <c:if test="${getrole == '1'||getrole == '2'||getrole == '3'}">
                        <img src="${sessionScope.userinfo.tphoto}" class="layui-nav-img" id="photo">
                    </c:if>
                    <c:if test="${getrole != '1'&&getrole != '2'&&getrole != '3'}">
                        <img src="${sessionScope.userinfo.sphoto}" class="layui-nav-img" id="photo">
                    </c:if>
                    <font id="user"></font> <font id="role"></font>
                    <%--<img src="${sessionScope.user.photo}" class="layui-nav-img">--%>
                    <%--${sessionScope.user.name}--%>
                    <%--${sessionScope.user.role}--%>
                </a>
                <%--<dl class="layui-nav-child">--%>
                    <%--<dd><a href="userinfo">基本资料</a></dd>--%>
                    <%--<dd><a href="">安全设置</a></dd>--%>
                <%--</dl>--%>
            </li>
            <li class="layui-nav-item"><a href="javascript:void(0)" id="click">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree">
                <li class="layui-nav-item "><a href="/index" target="main_self_frame">首页</a></li>
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        个人
                        <span class="layui-nav-more"></span>
                    </a>
                    <dl class="layui-nav-child">
                        <c:if test="${getrole == '1'||getrole == '2'||getrole == '3'}">
                            <dd><a href="/teainfo" target="main_self_frame">个人信息</a></dd>
                        </c:if>
                        <c:if test="${getrole != '1'&&getrole != '2'&&getrole != '3'}">
                            <dd><a href="/stuinfo" target="main_self_frame">个人信息</a></dd>
                            <dd><a href="/homeinfo" target="main_self_frame">家庭信息</a></dd>
                        </c:if>
                    </dl>
                </li>
                <c:if test="${getrole != '1'&&getrole != '2'}">
                    <li class="layui-nav-item">
                        <a href="javascript:">班级</a>
                        <dl class="layui-nav-child">
                            <dd><a href="/classinfo" target="main_self_frame">班级信息</a></dd>
                        </dl>
                        <dl class="layui-nav-child">
                            <dd><a href="/classmanager" target="main_self_frame">班委信息</a></dd>
                        </dl>
                        <dl class="layui-nav-child">
                            <dd><a href="/classmember" target="main_self_frame">成员列表</a></dd>
                        </dl>
                    <c:if test="${getrole == '4'||getrole == '5'}">
                        <dl class="layui-nav-child">
                            <dd><a href="/classhome" target="main_self_frame">家庭信息</a></dd>
                        </dl>
                    </c:if>
                    </li>
                </c:if>
                <c:if test="${getrole == '2'}">
                    <li class="layui-nav-item">
                        <a href="javascript:">班级</a>
                        <dl class="layui-nav-child">
                            <dd><a href="/instructorclassinfo" target="main_self_frame">班级信息</a></dd>
                        </dl>
                        <dl class="layui-nav-child">
                            <dd><a href="/instructorclassmanager" target="main_self_frame">班委信息</a></dd>
                        </dl>
                        <dl class="layui-nav-child">
                            <dd><a href="/instructorclassmember" target="main_self_frame">成员列表</a></dd>
                        </dl>
                        <dl class="layui-nav-child">
                            <dd><a href="/instructorclasshome" target="main_self_frame">家庭信息</a></dd>
                        </dl>
                    </li>
                </c:if>
                <c:if test="${getrole == '1'}">
                    <li class="layui-nav-item">
                        <a href="javascript:">信息</a>
                        <dl class="layui-nav-child">
                            <dd><a href="/deanallteainfo" target="main_self_frame">教师信息</a></dd>
                        </dl>
                        <dl class="layui-nav-child">
                            <dd><a href="/deanallstuinfo" target="main_self_frame">学生信息</a></dd>
                        </dl>
                        <dl class="layui-nav-child">
                            <dd><a href="/deanclassmanage" target="main_self_frame">班委信息</a></dd>
                        </dl>
                        <dl class="layui-nav-child">
                            <dd><a href="/deanclassinfo" target="main_self_frame">班级信息</a></dd>
                        </dl>
                    </li>
                </c:if>
                <c:if test="${getrole != '1'&&getrole != '2'&&getrole != '3'}">
                <li class="layui-nav-item">
                    <a href="javascript:;">班级事务</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/holiday" target="main_self_frame">节假日离校登记</a></dd>
                        <dd><a href="/practice" target="main_self_frame">实习登记</a></dd>
                        <dd><a href="/work" target="main_self_frame">工作登记</a></dd>
                        <dd><a href="/postgraduate" target="main_self_frame">考研登记</a></dd>
                    </dl>
                </li>
                </c:if>
                <c:if test="${getrole == '1'||getrole == '2'||getrole == '4'||getrole == '5'}">
                    <li class="layui-nav-item">
                        <a href="javascript:;">管理</a>
                        <dl class="layui-nav-child">
                            <c:if test="${getrole == '1'}">
                            <dd><a href="/deaninfomanage" target="main_self_frame">信息管理</a></dd>
                            </c:if>
                            <c:if test="${getrole == '2'}">
                                <dd><a href="/instructormembermanage" target="main_self_frame">学生信息管理</a></dd>
                                <dd><a href="/instructormanageset" target="main_self_frame">班委设置</a></dd>
                                <dd><a href="/holidayset" target="main_self_frame">节日设置</a></dd>
                                <dd><a href="/instructorholidaymanage" target="main_self_frame">离校登记管理</a></dd>
                                <dd><a href="/instructorpracticemanage" target="main_self_frame">实习情况管理</a></dd>
                            </c:if>
                            <c:if test="${getrole == '4'||getrole == '5'}">
                                <dd><a href="/holidaymanage" target="main_self_frame">离校登记管理</a></dd>
                                <dd><a href="/practicemanage" target="main_self_frame">实习情况管理</a></dd>
                            </c:if>
                        </dl>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
    <div class="layui-body">
        <iframe src="/index" name="main_self_frame" frameborder="0" class="layadmin-iframe"></iframe>
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
<script type="text/javascript" src="js/cookie.js"></script>
<script>
    $("#user").html(getCookie("name"));
    // $("#photo").attr("src",getCookie("photo"));
    $("#role").html(getCookie("role"));
    loginCookie();
    $("#click").click(function (){
        setCookie("login","0");
        window.location.href="/exit";
    });
</script>
</html>
