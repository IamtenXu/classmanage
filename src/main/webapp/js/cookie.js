function setCookie(name,value)
{
    var Days = 3;
    var exp = new Date();
    exp.setTime(exp.getTime() + Days*24*60*60*1000);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString()+";path=/";
}

function getCookie(name)
{
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");

    if(arr=document.cookie.match(reg))

        return unescape(arr[2]);
    else
        return null;
}

// function delCookie(name)
// {
//     var exp = new Date();
//     exp.setTime(exp.getTime() - 1);
//     var cval=getCookie(name);
//     if(cval!=null)
//         document.cookie= name + "="+cval+";expires="+exp.toGMTString();
// }
//
// function logout() {
//     setCookie("login","0");
//     window.location.href="login.html";
// }

function loginCookie() {
    var login = getCookie("login");
    if(login !== "1"){
        alert("请登录！");
        window.location = "login.html";
    }
}