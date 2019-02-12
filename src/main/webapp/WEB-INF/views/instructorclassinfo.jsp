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

            <form class="layui-form" action="" lay-filter="example">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">班级号</label>
                        <div class="layui-input-inline">
                            <select name="classid"  lay-verify="required" id="classid" lay-filter="classidFilter">
                                <option value=""></option>
                            </select>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">学院</label>
                            <div class="layui-input-inline">
                                <input name="ccollege" id="ccollege" autocomplete="off" class="layui-input" type="text" value="" readonly>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">专业</label>
                        <div class="layui-input-inline">
                            <input name="major"  id="major" autocomplete="off" class="layui-input" type="text" value="" readonly>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">年级</label>
                            <div class="layui-input-inline">
                                <input name="cgrade" id="cgrade" autocomplete="off" class="layui-input" type="text" value="" readonly>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">辅导员</label>
                        <div class="layui-input-inline">
                            <input name="instructorname" id="instructorname" autocomplete="off" class="layui-input" type="text" value="" readonly>
                        </div>
                        <label class="layui-form-label">联系方式</label>
                        <div class="layui-input-inline">
                            <input name="instructorphone" id="instructorphone" autocomplete="off" class="layui-input" type="text" value="" readonly>
                        </div>
                        <label class="layui-form-label">办公室</label>
                        <div class="layui-input-inline">
                            <input name="instructoraddress" id="instructoraddress" autocomplete="off" class="layui-input" type="text" value="" readonly>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">班主任</label>
                        <div class="layui-input-inline">
                            <input name="headmastername" id="headmastername" autocomplete="off" class="layui-input" type="text" value="" readonly>
                        </div>
                        <label class="layui-form-label">联系方式</label>
                        <div class="layui-input-inline">
                            <input name="headmasterphone" id="headmasterphone" autocomplete="off" class="layui-input" type="text" value="" readonly>
                        </div>
                        <label class="layui-form-label">办公室</label>
                        <div class="layui-input-inline">
                            <input name="headmasteraddress" id="headmasteraddress" autocomplete="off" class="layui-input" type="text" value="" readonly>
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
            ,$ = layui.jquery;

        //添加下拉框选项
        $.ajax({
            url: '/instructor/instructorselect',
            dataType: 'json',
            type: 'get',
            success: function (data) {
                $.each(data.classinfo, function (index, item) {
                    $('#classid').append(new Option(item.classid, item.classid));// 下拉菜单里添加元素
                });
                layui.form.render("select");//重新渲染 固定写法
            }
        });
        form.on('select(classidFilter)', function(data){
            if(data.value!=="") {
                $.ajax({
                    url: '/instructor/instructorclassinfo',
                    dataType: 'json',
                    type: 'POST',
                    data: {"classid": data.value},
                    success: function (data) {
                        $("#ccollege").val(data.classinfo.ccollege);
                        $("#major").val(data.classinfo.major);
                        $("#cgrade").val(data.classinfo.cgrade);
                        $("#instructorname").val(data.classinfo.instructorname);
                        $("#instructorphone").val(data.classinfo.instructorphone);
                        $("#instructoraddress").val(data.classinfo.instructoraddress);
                        $("#headmastername").val(data.classinfo.headmastername);
                        $("#headmasterphone").val(data.classinfo.headmasterphone);
                        $("#headmasteraddress").val(data.classinfo.headmasteraddress);
                    }
                });
            }
        });
    })
</script>
</html>
