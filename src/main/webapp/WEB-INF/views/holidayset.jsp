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
                <legend>法定节假日设置</legend>
            </fieldset>
            <form class="layui-form">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">当前统计<br>节日</label>
                        <div class="layui-input-inline">
                            <input name="holidaying" class="layui-input" placeholder="必填" id="holidaying" type="text" autocomplete="off" value="" readonly>
                        </div>
                    </div>
                </div>
            </form>
            <form class="layui-form" action="/holiday/holidayset" lay-filter="example">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">节日设置</label>
                        <div class="layui-input-inline">
                            <input name="year" class="layui-input" placeholder="必填" id="year" type="text" placeholder="yyyy年" autocomplete="off" lay-verify="year" value="">
                            <select name="holidayname"  lay-verify="required">
                                <option selected></option>
                                <option>元旦节</option>
                                <option>清明节</option>
                                <option>劳动节</option>
                                <option>端午节</option>
                                <option>中秋节</option>
                                <option>国庆节</option>
                                <option>暑假</option>
                                <option>寒假</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">开始日期</label>
                        <div class="layui-input-inline">
                            <input name="starttime" class="layui-input" id="starttime" type="text" autocomplete="off" lay-verify="date" value="">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">结束日期</label>
                        <div class="layui-input-inline">
                            <input name="endtime" class="layui-input" id="endtime" type="text" autocomplete="off" lay-verify="date" value="">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="holidayset">立即设置</button>
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
            ,laydate = layui.laydate
            ,$ = layui.jquery;

        $.ajax({
            url: '/holiday/holidayison',
            dataType: 'json',
            type: 'POST',
            success: function (data) {
                $("#holidaying").val(data.holiday.holidayname);
                $("#starttime").val(data.holiday.starttime);
                $("#endtime").val(data.holiday.endtime);
            }
        });
        form.on('submit(holidayset)', function(data){
            var action = data.form.action;//表单提交URL地址
            console.log(JSON.stringify(data.field));//表单数据
            $.post(action,data.field,function(obj){
                if(obj.code!==200){
                    alert(obj.msg);
                    return false;
                }else{
                    alert("设置成功");
                    location.reload();
                    return false;
                }
            });
            return false;//注释掉这行代码后，表单将会以普通方式提交表单，否则以ajax方式提交表单
        });

        //日期
        laydate.render({
            elem: '#year'
            ,type: 'year'
            ,format: 'yyyy年'
        });
        laydate.render({
            elem: '#starttime'
        });
        laydate.render({
            elem: '#endtime'
        });

    })
</script>
</html>
