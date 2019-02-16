<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>用户注册</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="Keywords" content="网站关键词">
    <meta name="Description" content="网站介绍">
    <link rel="stylesheet" type="text/css" href="css/base.css" />
    <link rel="stylesheet" type="text/css" href="css/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="css/reg.css" />
</head>
<body>
<div id="ajax-hook"></div>
<div class="wrap">
    <div class="wpn">
        <div class="form-data pos">
            <a href=""><img src="img/logo.png" class="head-logo"></a>
            <div class="change-login">
                <p class="account_number on">账号注册</p>
                <p class="message">短信注册</p>
            </div>
            <div class="form1">
                <p class="p-input pos">
                    <label for="num">学号/工号</label>
                    <input type="text" id="num" required>
                </p>
                <p class="p-input pos" id="pwd">
                    <label for="passport">输入密码</label>
                    <input type="password" style="display: none"/>
                    <input type="password" id="passport" required>
                    <span class="tel-warn pwd-err hide"><em></em><i class="icon-warn" style="margin-left: 5px"></i></span>
                </p>
                <p class="p-input pos" id="confirmpwd">
                    <label for="passport2">确认密码</label>
                    <input type="password" style="position:absolute;top:-998px"/>
                    <input type="password" id="passport2" required>
                    <span class="tel-warn confirmpwd-err hide"><em></em><i class="icon-warn" style="margin-left: 5px"></i></span>
                </p>
            </div>
            <div class="form2 hide">
                <p class="p-input pos">
                    <label for="num2">手机号</label>
                    <input type="number" id="num2">
                    <span class="tel-warn num2-err hide"><em>账号或密码错误</em><i class="icon-warn"></i></span>
                </p>
                <p class="p-input pos">
                    <label for="veri-code">输入验证码</label>
                    <input type="number" id="veri-code">
                    <a href="javascript:;" class="send">发送验证码</a>
                    <span class="time hide"><em>120</em>s</span>
                    <span class="tel-warn error hide">验证码错误</span>
                </p>
            </div>
            <button class="lang-btn" id="register">注册</button>
            <div class="bottom-info">已有账号，<a href="/login">马上登录</a></div>
            <div class="third-party">
                <a href="#" class="log-qq icon-qq-round"></a>
                <a href="#" class="log-qq icon-weixin"></a>
                <a href="#" class="log-qq icon-sina1"></a>
            </div>
            <p class="right">Powered by Iamten© 2019</p>
        </div>
    </div>
</div>
<script src="js/jquery.js"></script>
<script src="js/agree.js"></script>
<script src="js/register.js"></script>
<script src="js/cookie.js"></script>
<script>
    $("#register").click(function(){
        var inp = $.trim($('#num').val());
        var passport = $.trim($('#passport').val());
        var passport2 = $.trim($('#passport2').val());
        if(passport !== passport2){
            alert("两次密码不一致，请重新输入");
            return false;
        }
        var ldata = {"username":inp,"password":passport2};
        $.ajax({
            url: '/user/register',
            type: 'post',
            data: ldata,
            success:
                function(data){
                    if (data.code === 200) {
                        alert(data.msg);
                        window.location = "/login";
                    } else if(data.code === 500) {
                        alert(data.msg);
                    } else{
                        alert("什么情况？");
                    }
                },
            error:function(){
                alert("服务器错误");
            }
        });
    });
</script>
</body>
</html>
