package xin.iamten.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class PageController {

    //导航栏
    @RequestMapping("/iframe")
    public String toiframe(){
        return "iframe";
    }

    //退出
    @RequestMapping("/exit")
    public String toindex(HttpSession session){
        session.removeAttribute("userinfo");
        session.removeAttribute("classinfo");
        return "login";
    }

    //学生个人信息
    @RequestMapping("/stuinfo")
    public String tostuinfo(){
        return "stuinfo";
    }

    //老师个人信息
    @RequestMapping("/teainfo")
    public String toteainfo(){
        return "teainfo";
    }

    //班级信息
    @RequestMapping("/classinfo")
    public String toclassinfo(){
        return "classinfo";
    }

    //修改密码
    @RequestMapping("/updatepassword")
    public String toupdatepassword(){
        return "updatepassword";
    }


}
