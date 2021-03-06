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
    <title>E班</title>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div>
    <div>
        <!-- 内容主体区域 -->
        <div>
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 15px;">
                <legend>个人信息</legend>
            </fieldset>
            <form class="layui-form">
                <div class="layui-form-item">
                    <label class="layui-form-label">照片</label>
                    <div class="layui-upload">
                        <img src="${sessionScope.userinfo.tphoto}" width="200" height="200" />
                    </div>
                </div>
            </form>
            <form class="layui-form" id="uploadForm" enctype="multipart/form-data">
                <div class="layui-form-item">
                    <label class="layui-form-label">修改照片</label>
                    <div class="layui-input-inline">
                        <input class="layui-input" id="file" type="file" name="file"/>
                    </div>
                    <button class="layui-btn layui-btn-small" id="upload" type="button" onclick="uploadImg()">上传</button>
                </div>
            </form>
            <form class="layui-form" action="/user/updatetea" lay-filter="example">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">工号</label>
                        <div class="layui-input-inline">
                            <input name="ttuid"  autocomplete="off" class="layui-input" type="text" value="${sessionScope.userinfo.teaid}" readonly>
                        </div>
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-input-inline">
                            <input name="tname"  autocomplete="off" readonly class="layui-input" type="text" value="${sessionScope.userinfo.tname}">
                        </div>
                        <label class="layui-form-label">职称</label>
                        <div class="layui-input-inline">
                            <input name="title"  autocomplete="off" readonly class="layui-input" type="text" value="${sessionScope.userinfo.title}">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <c:set var="getsex" scope="page" value="${sessionScope.userinfo.tsex}"/>
                        <input name="tsex" value="男" title="男" <c:if test="${getsex == '男'}">checked="checked"</c:if> type="radio">
                        <input name="tsex" value="女" title="女" <c:if test="${getsex == '女'}">checked="checked"</c:if> type="radio">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">出生日期</label>
                        <div class="layui-input-inline">
                            <input name="tbirthday" class="layui-input" id="date" type="text" placeholder="yyyy-MM-dd" autocomplete="off" lay-verify="date" value="${sessionScope.userinfo.tbirthday}">
                        </div>
                        <label class="layui-form-label">政治面貌</label>
                        <div class="layui-input-inline">
                            <c:set var="getmilitarists" scope="page" value="${sessionScope.userinfo.tpolitical}"/>
                            <select name="militarists"  lay-verify="required">
                                <option <c:if test="${getmilitarists == '群众'}">selected</c:if>>群众</option>
                                <option <c:if test="${getmilitarists == '共青团员'}">selected</c:if>>共青团员</option>
                                <option <c:if test="${getmilitarists == '预备党员'}">selected</c:if>>预备党员</option>
                                <option <c:if test="${getmilitarists == '党员'}">selected</c:if>>党员</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">手机号</label>
                        <div class="layui-input-inline">
                            <input name="tphone"  autocomplete="off" class="layui-input" type="text" maxlength="11" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" value="${sessionScope.userinfo.tphone}">
                        </div>
                        <label class="layui-form-label">邮箱</label>
                        <div class="layui-input-inline">
                            <input name="temail"  autocomplete="off" class="layui-input" type="email" value="${sessionScope.userinfo.temail}">
                        </div>
                        <label class="layui-form-label">办公室</label>
                        <div class="layui-input-inline">
                            <input name="taddress"  autocomplete="off" class="layui-input" type="text" value="${sessionScope.userinfo.taddress}">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="updateinfo">立即修改</button>
                        <input type="button" class="layui-btn layui-btn-danger dw-dailog" dw-url="updatepassword" dw-title="修改密码" value="修改密码">
                        <input type="button" class="layui-btn layui-btn-warm" value="刷新" onclick="location.href='teainfo'">
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
    //上传头像
    function uploadImg() {
        $.ajax({
            type: "post",
            url: '/user/teaupload',
            data: new FormData($('#uploadForm')[0]),
            processData: false,
            contentType: false,
            success: function (data) {
                alert(data.msg);
                location.reload();
            },
            error:function (XMLHttpRequest, textStatus, errorThrown) {
                alert("请求失败！");
            }
        });
    }
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
            if(dw_width == undefined) dw_width = '30%';
            if(dw_height == undefined) dw_height = '60%';
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

        // //普通图片上传
        // var uploadInst = upload.render({
        //     elem: '#uploadpic'
        //     ,url: '/user/teaupload'
        //     ,method: 'POST'
        //     ,size:1024
        //     ,accept:'images'
        //     ,before: function(obj){
        //         //预读本地文件示例，不支持ie8
        //         obj.preview(function(index, file, result){
        //             $('#demopic').attr('src', result); //图片链接（base64）
        //         });
        //     }
        //     ,done: function(res){
        //         //上传成功
        //         if(res.code === 200) {
        //             // alert("上传成功，请稍等");
        //             // layer.msg('上传成功，请稍等');
        //             layer.msg(res.msg, { icon: 6, time: 1000 });
        //             location.reload();
        //         }
        //         //如果上传失败
        //         else{
        //             return layer.msg('上传失败');
        //         }
        //     }
        //     ,error: function(){
        //         //演示失败状态，并实现重传
        //         var demoText = $('#demoText');
        //         demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
        //         demoText.find('.demo-reload').on('click', function(){
        //             uploadInst.upload();
        //         });
        //     }
        // });

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
                if(obj.code!==200){
                    alert("服务器错误，请联系服务器管理员！");
                    return false;
                }else{
                    alert(obj.msg);
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
