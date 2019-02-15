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

    //学生家庭信息
    @RequestMapping("/homeinfo")
    public String tohomeinfo(){
        return "homeinfo";
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

    //主页
    @RequestMapping("/index")
    public String toindex(){
        return "index";
    }

    //班委信息
    @RequestMapping("/classmanager")
    public String toclassmanager(){
        return "classmanager";
    }

    //成员列表
    @RequestMapping("/classmember")
    public String toclassmember(){
        return "classmember";
    }

    //辅导员班级信息
    @RequestMapping("/instructorclassinfo")
    public String toinstructorclassinfo(){
        return "instructorclassinfo";
    }

    //辅导员班委信息
    @RequestMapping("/instructorclassmanager")
    public String toinstructorclassmanager(){
        return "instructorclassmanager";
    }

    //辅导员班级成员信息
    @RequestMapping("/instructorclassmember")
    public String toinstructorclassmember(){
        return "instructorclassmember";
    }

    //教务处教师信息
    @RequestMapping("/deanallteainfo")
    public String todeanallteainfo(){
        return "deanallteainfo";
    }

    //教务处学生信息
    @RequestMapping("/deanallstuinfo")
    public String todeanallstuinfo(){
        return "deanallstuinfo";
    }

}
