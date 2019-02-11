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

            <form class="layui-form" action="updateinfo" lay-filter="example">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">班级号</label>
                        <div class="layui-input-inline">
                            <input name="classid"  autocomplete="off" class="layui-input" type="text" value="${sessionScope.classinfo.classid}" readonly>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">学院</label>
                            <div class="layui-input-inline">
                                <input name="ccollege"  autocomplete="off" class="layui-input" type="text" value="${sessionScope.classinfo.ccollege}" readonly>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">专业</label>
                        <div class="layui-input-inline">
                            <input name="major"  autocomplete="off" class="layui-input" type="text" value="${sessionScope.classinfo.major}" readonly>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">年级</label>
                            <div class="layui-input-inline">
                                <input name="cgrade"  autocomplete="off" class="layui-input" type="text" value="${sessionScope.classinfo.cgrade}" readonly>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">辅导员</label>
                        <div class="layui-input-inline">
                            <input name="instructorname"  autocomplete="off" class="layui-input" type="text" value="${sessionScope.classinfo.instructorname}" readonly>
                        </div>
                        <label class="layui-form-label">联系方式</label>
                        <div class="layui-input-inline">
                            <input name="instructorphone"  autocomplete="off" class="layui-input" type="text" value="${sessionScope.classinfo.instructorphone}" readonly>
                        </div>
                        <label class="layui-form-label">办公室</label>
                        <div class="layui-input-inline">
                            <input name="instructoraddress"  autocomplete="off" class="layui-input" type="text" value="${sessionScope.classinfo.instructoraddress}" readonly>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">班主任</label>
                        <div class="layui-input-inline">
                            <input name="headmaster"  autocomplete="off" class="layui-input" type="text" value="${sessionScope.classinfo.headmastername}" readonly>
                        </div>
                        <label class="layui-form-label">联系方式</label>
                        <div class="layui-input-inline">
                            <input name="headmasterphone"  autocomplete="off" class="layui-input" type="text" value="${sessionScope.classinfo.headmasterphone}" readonly>
                        </div>
                        <label class="layui-form-label">办公室</label>
                        <div class="layui-input-inline">
                            <input name="headmasteraddress"  autocomplete="off" class="layui-input" type="text" value="${sessionScope.classinfo.headmasteraddress}" readonly>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="layui/layui.js"></script>
<script>
    layui.use(['form'], function(){
        var form = layui.form
            ,$ = layui.jquery
    })
</script>
</html>
