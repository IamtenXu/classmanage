// +----------------------------------------------------------------------
// | 表单提交页面通用表单监听（如有特殊需求可参照此文件写一个单独的js文件，如:sys_config.js）
// +----------------------------------------------------------------------
layui.use(['element','form'], function(){
    var element = layui.element;
    var form = layui.form;
    //监听提交
    form.on('submit(formDemo)', function(data){
        var action = data.form.action;//表单提交URL地址
        console.log(JSON.stringify(data.field));//表单数据
        $.post(action,data.field,function(obj){
            if(obj.code===500){
                alert(obj.msg);
                return false;
            }else{
                alert("修改成功");
                return false;
            }
        });
        return false;//注释掉这行代码后，表单将会以普通方式提交表单，否则以ajax方式提交表单
    });

    form.verify({
        regPwd: function(value) {
            //获取密码
            var pwd = $("#password1").val();
            var oldpwd = $("#password").val();
            if (!new RegExp(pwd).test(value)) {
                return '两次输入的密码不一致';
            }
            else if(!new RegExp(oldpwd).test(value)){
                return '新密码不能与原密码相同';
            }
        }
    })
});