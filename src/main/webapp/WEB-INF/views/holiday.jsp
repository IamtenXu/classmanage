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
    <title>假日离校登记</title>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div>
    <div>
        <div style="padding: 10px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 15px;">
                <legend>假日离校登记</legend>
            </fieldset>
            <form class="layui-form" action="/holiday/holidaycheck" lay-filter="example">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">节假日</label>
                        <div class="layui-input-inline">
                            <input name="holidayname"  id= "holidayname" autocomplete="off" lay-verify="required" placeholder="必填" class="layui-input" type="text" value="" readonly>
                        </div>
                        <label class="layui-form-label"><font color="red" size="4">*</font>离校日期</label>
                        <div class="layui-input-inline">
                            <input name="leavetime" class="layui-input" placeholder="必填" id="starttime" type="text" placeholder="yyyy-MM-dd" autocomplete="off" lay-verify="date" value="">
                        </div>
                        <label class="layui-form-label"><font color="red" size="4">*</font>回校日期</label>
                        <div class="layui-input-inline">
                            <input name="backtime" class="layui-input" placeholder="必填" id="endtime" type="text" placeholder="yyyy-MM-dd" autocomplete="off" lay-verify="date" value="">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">班级</label>
                        <div class="layui-input-inline">
                            <input name="classid"  autocomplete="off" placeholder="必填" class="layui-input" type="text" value="${sessionScope.userinfo.sclass}" readonly>
                        </div>
                        <label class="layui-form-label">学号</label>
                        <div class="layui-input-inline">
                            <input name="stuid"  autocomplete="off" placeholder="必填" class="layui-input" type="text" value="${sessionScope.userinfo.stuid}" readonly>
                        </div>
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-input-inline">
                            <input name="name"  autocomplete="off" placeholder="必填" class="layui-input" type="text" value="${sessionScope.userinfo.sname}" readonly>
                        </div>
                        <label class="layui-form-label"><font color="red" size="4">*</font>联系方式</label>
                        <div class="layui-input-inline">
                            <input name="phone"  autocomplete="off" placeholder="必填" class="layui-input" type="text" maxlength="11" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" value="${sessionScope.userinfo.sphone}" >
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label"><font color="red" size="4">*</font>节日去向</label>
                        <div class="layui-input-inline">
                            <select id="gotowhere" name="gotowhere"  lay-verify="required">
                                <option value=""></option>
                                <option value="留校">留校</option>
                                <option value="回家">回家</option>
                                <option value="旅游">旅游</option>
                            </select>
                        </div>
                        <label class="layui-form-label"><font color="red" size="4">*</font>目的地（省）</label>
                        <div class="layui-input-inline">
                            <select name="province"  lay-verify="required" id="province" lay-filter="provinceFilter">
                                <option value=""></option>
                            </select>
                        </div>
                        <label class="layui-form-label"><font color="red" size="4">*</font>目的地（市）</label>
                        <div class="layui-input-inline">
                            <select name="city" id="city" lay-verify="required" lay-filter="cityFilter">
                                <option value=""></option>
                            </select>
                        </div>
                        <label class="layui-form-label"><font color="red" size="4">*</font>目的地（县）</label>
                        <div class="layui-input-inline">
                            <select name="area" id="area" lay-verify="required" lay-filter="areaFilter">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label"><font color="red" size="4">*</font>紧急联系人姓名</label>
                        <div class="layui-input-inline">
                            <input name="emergencyname"  id="emergencyname" autocomplete="off" placeholder="必填" class="layui-input" type="text" lay-verify="required" value="">
                        </div>
                        <label class="layui-form-label"><font color="red" size="4">*</font>紧急联系人联系方式</label>
                        <div class="layui-input-inline">
                            <input name="emergencyphone" id="emergencyphone" autocomplete="off" placeholder="必填" class="layui-input" type="text" lay-verify="required|phone" maxlength="11" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" value="">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">备注</label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入备注(非必填)" class="layui-textarea" name="note"></textarea>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="holidaycheck">立即提交</button>
                        <input type="button" class="layui-btn layui-btn-warm" value="重置" onclick="location.href='/holiday'">
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
            url: '/user/stuhomeinfo',
            dataType: 'json',
            type: 'POST',
            data:{"stuid": ${sessionScope.userinfo.stuid}},
            success: function (data) {
                $("#emergencyname").val(data.homeinfo.emergencyname);
                $("#emergencyphone").val(data.homeinfo.emergencyphone);
            }
        });
        $.ajax({
            url: '/city/provinceselect',
            dataType: 'json',
            type: 'POST',
            success: function (data) {
                $.each(data.province, function (index, item) {
                    $('#province').append(new Option(item.name, item.code));// 下拉菜单里添加元素
                });
                $("#city").empty();
                $('#city').append(new Option('',''));
                $("#area").empty();
                $('#area').append(new Option('',''));
                layui.form.render("select");//重新渲染 固定写法
            }
        });
        $.ajax({
            url: '/holiday/holidayison',
            dataType: 'json',
            type: 'POST',
            async : false,
            success: function (data) {
                $("#holidayname").val(data.holiday.holidayname);
                $("#starttime").val(data.holiday.starttime);
                $("#endtime").val(data.holiday.endtime);
                $.ajax({
                    url: '/holiday/holidaychecked',
                    dataType: 'json',
                    type: 'POST',
                    data:{"stuid": ${sessionScope.userinfo.stuid},"holidayname":data.holiday.holidayname},
                    success: function (data) {
                        if(data.checked===1){
                            var province = data.holidaycheck.province;
                            var city = data.holidaycheck.city;
                            var area = data.holidaycheck.area;
                            $("#gotowhere").val(data.holidaycheck.gotowhere);
                            form.render('select');
                            $("#province").val(data.holidaycheck.province);
                            form.render('select');
                            $.ajax({
                                url: '/city/cityselect',
                                dataType: 'json',
                                type: 'POST',
                                async : false,
                                data:{"provincecode": province},
                                success: function (data) {
                                    $("#city").empty();
                                    $('#city').append(new Option('',''));
                                    $.each(data.city, function (index, item) {
                                        $('#city').append(new Option(item.name, item.code));// 下拉菜单里添加元素
                                    });
                                    $("#area").empty();
                                    $('#area').append(new Option('',''));
                                    $("#city").val(city);
                                    form.render("select");//重新渲染 固定写法
                                }
                            });
                            $.ajax({
                                url: '/city/areaselect',
                                dataType: 'json',
                                type: 'POST',
                                async : false,
                                data:{"citycode": city},
                                success: function (data) {
                                    $("#area").empty();
                                    $('#area').append(new Option('',''));
                                    $.each(data.area, function (index, item) {
                                        $('#area').append(new Option(item.name, item.code));// 下拉菜单里添加元素
                                    });
                                    $("#area").val(area);
                                    form.render("select");//重新渲染 固定写法
                                }
                            });
                            form.render("select");//重新渲染 固定写法
                        }
                    }
                });
            }
        });
        form.on('select(provinceFilter)', function(data){
            $.ajax({
                url: '/city/cityselect',
                dataType: 'json',
                type: 'POST',
                data:{"provincecode": data.value},
                success: function (data) {
                    $("#city").empty();
                    $('#city').append(new Option('',''));
                    $.each(data.city, function (index, item) {
                        $('#city').append(new Option(item.name, item.code));// 下拉菜单里添加元素
                    });
                    $("#area").empty();
                    $('#area').append(new Option('',''));
                    layui.form.render("select");//重新渲染 固定写法
                }
            });
        });
        form.on('select(cityFilter)', function(data){
            $.ajax({
                url: '/city/areaselect',
                dataType: 'json',
                type: 'POST',
                data:{"citycode": data.value},
                success: function (data) {
                    $("#area").empty();
                    $('#area').append(new Option('',''));
                    $.each(data.area, function (index, item) {
                        $('#area').append(new Option(item.name, item.code));// 下拉菜单里添加元素
                    });
                    layui.form.render("select");//重新渲染 固定写法
                }
            });
        });
        function getByteLen(val) {
            var len = 0;
            for (var i = 0; i < val.length; i++) {
                var n = val.charAt(i);
                if (n.match(/[^\x00-\xff]/ig) !== null) {
                    len += 2;
                }
                else {
                    len += 1;
                }
            }
            return len;
        }
        form.verify({
            phone : function(value, item){ //value：表单的值、item：表单的DOM对象
                if(getByteLen(value)!==11&&getByteLen(value)!==0){
                    return '请输入正确格式的手机号码';
                }
            }
        });
        form.on('submit(holidaycheck)', function(data){
            var action = data.form.action;//表单提交URL地址
            console.log(JSON.stringify(data.field));//表单数据
            var c = $("#emergencyphone").val();
            if(getByteLen(c)!==11){
                alert("请输入正确的手机号码");
                return false;
            }
            $.post(action, data.field, function (obj) {
                if (obj.code !== 200) {
                    alert(obj.msg);
                    return false;
                } else {
                    alert("提交成功");
                    location.reload();
                    return false;
                }
            });
            return false;//注释掉这行代码后，表单将会以普通方式提交表单，否则以ajax方式提交表单
        });
        //日期
        laydate.render({
            elem: '#starttime'
        });
        laydate.render({
            elem: '#endtime'
        });

    })
</script>
</html>