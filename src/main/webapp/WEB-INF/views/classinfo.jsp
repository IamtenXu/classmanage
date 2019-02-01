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
    <title>15052316班</title>
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
    layui.use(['form', 'layedit', 'laydate','upload'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate
            ,$ = layui.jquery
            ,upload = layui.upload;


        // +----------------------------------------------------------------------
        // | 弹出层
        // +----------------------------------------------------------------------
        $(".dw-dailog").click(function(){
            var dw_url = $(this).attr("dw-url");//URL地址，必填
            var dw_title = $(this).attr("dw-title");//弹出层标题，必填
            var dw_width = $(this).attr("dw-width");//弹出层宽度，如80%或500px；如果没有默认为屏幕宽度的50%
            var dw_height = $(this).attr("dw-height");//弹出层高度，如50%或500px；如果没有默认为屏幕高度的50%
            if(dw_url == undefined) {
                layer.msg("请给button加上dw-url属性");
                return false;
            }
            if(dw_title == undefined) {
                layer.msg("请给button加上dw-title属性");
                return false;
            }
            if(dw_width == undefined) dw_width = '50%';
            if(dw_height == undefined) dw_height = '50%';
            layer.open({
                type: 2,
                title: dw_title,
                shadeClose: true,
                shade: 0.8,
                area: [dw_width, dw_height],
                content: dw_url,
                end: function () {
                    location.reload();
                }
                ,cancel: function () {
                    layer.closeAll();
                    location.reload();
                    return false;
                }
            });
        });
        // +----------------------------------------------------------------------
        // | 刷新
        // +----------------------------------------------------------------------
        $(".dw-refresh").click(function(){
            location.href = location.href;
        });

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#uploadpic'
            ,url: 'upload'
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demopic').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                //上传成功
                if(res.code === 0) {
                    alert("上传成功，请稍等");
                    // layer.msg('上传成功，请稍等');
                    location.reload();
                }
                //如果上传失败
                else{
                    return layer.msg('上传失败');
                }
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
//            title: function(value){
//                if(value.length < 5){
//                    return '标题至少得5个字符啊';
//                }
//            }
//            ,pass: [/(.+){6,16}$/, '密码必须6到12位']
            content: function(value){
                layedit.sync(editIndex);
            }
        });

        form.on('submit(updateinfo)', function(data){
            var action = data.form.action;//表单提交URL地址
            console.log(JSON.stringify(data.field));//表单数据
            $.post(action,data.field,function(obj){
                if(obj.code!==0){
                    alert(obj.msg);
                    return false;
                }else{
                    alert("修改成功");
                    location.reload();
                    return false;
                }
            });
            return false;//注释掉这行代码后，表单将会以普通方式提交表单，否则以ajax方式提交表单
        });
        //监听指定开关
        form.on('switch(switchTest)', function(data){
            layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });
    })
</script>
</html>
