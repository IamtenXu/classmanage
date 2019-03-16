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
    <title>15052316班</title>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div>
    <div>
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 15px;">
                <legend>信息导入与更新</legend>
            </fieldset>
            <form class="layui-form" id="StuForm" enctype="multipart/form-data">
                <div class="layui-form-item">
                    <label class="layui-form-label">学生信息</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" id="stu" type="file" name="file"/>
                    </div>
                    <button class="layui-btn layui-btn-small" id="uploadstu" type="button" onclick="uploadStu()">导入</button>
                    <button class="layui-btn layui-btn-small" onclick="window.open('https://iamten-1253464268.cos.ap-shanghai.myqcloud.com/classmanage/%E5%AD%A6%E7%94%9F%E4%BF%A1%E6%81%AF%E4%B8%8A%E4%BC%A0%E6%A8%A1%E6%9D%BF.xls')">下载学生信息模板</button>
                </div>
            </form>
            <form class="layui-form" id="TeaForm" enctype="multipart/form-data">
                <div class="layui-form-item">
                    <label class="layui-form-label">教师信息</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" id="tea" type="file" name="file"/>
                    </div>
                    <button class="layui-btn layui-btn-small" id="uploadtea" type="button" onclick="uploadTea()">导入</button>
                    <button class="layui-btn layui-btn-small" onclick="window.open('https://iamten-1253464268.cos.ap-shanghai.myqcloud.com/classmanage/%E6%95%99%E5%B8%88%E4%BF%A1%E6%81%AF%E4%B8%8A%E4%BC%A0%E6%A8%A1%E6%9D%BF.xls')">下载教师信息模板</button>
                </div>
            </form>
            <form class="layui-form" id="ClassForm" enctype="multipart/form-data">
                <div class="layui-form-item">
                    <label class="layui-form-label">班级信息</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" id="class" type="file" name="file"/>
                    </div>
                    <button class="layui-btn layui-btn-small" id="uploadclass" type="button" onclick="uploadClass()">导入</button>
                    <button class="layui-btn layui-btn-small" onclick="window.open('https://iamten-1253464268.cos.ap-shanghai.myqcloud.com/classmanage/%E7%8F%AD%E7%BA%A7%E4%BF%A1%E6%81%AF%E4%B8%8A%E4%BC%A0%E6%A8%A1%E6%9D%BF.xls')">下载班级信息模板</button>
                </div>
            </form>
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 15px;">
                <legend>信息导出</legend>
            </fieldset>
            <form class="layui-form">
                <div class="layui-form-item">
                    <label class="layui-form-label">学生信息</label>
                    <div class="layui-input-inline">
                        <button class="layui-btn layui-btn-small" onclick="window.open('/excel/exportStu')">导出</button>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">教师信息</label>
                    <div class="layui-input-inline">
                        <button class="layui-btn layui-btn-small" onclick="window.open('/excel/exportTea')">导出</button>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">班级信息</label>
                    <div class="layui-input-inline">
                        <button class="layui-btn layui-btn-small" onclick="window.open('/excel/exportClass')">导出</button>
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
<script type="text/javascript" src="js/upload.js"></script>
<script>
    layui.use(['form', 'laydate'], function(){
        var form = layui.form
            ,$ = layui.jquery;
    })
</script>
</html>
