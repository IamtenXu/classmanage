package xin.iamten.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class PageController {

    //登录
    @RequestMapping("/login")
    public String tologin(){
        return "login";
    }

    //注册
    @RequestMapping("/register")
    public String toregister(){
        return "register";
    }

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

    //班长团支书学生家庭信息
    @RequestMapping("/classhome")
    public String toclasshome(){
        return "classhome";
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

    //通知
    @RequestMapping("/announcement")
    public String toannouncement(){
        return "announcement";
    }

    //各班通知
    @RequestMapping("/instrucetorannouncement")
    public String toinstrucetorannouncement(){
        return "instrucetorannouncement";
    }

    //修改通知
    @RequestMapping("/updateannouncement")
    public String updateannouncement(){
        return "updateannouncement";
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

    //辅导员班级家庭信息
    @RequestMapping("/instructorclasshome")
    public String toinstructorclasshome(){
        return "instructorclasshome";
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

    //教务处学生信息
    @RequestMapping("/deanclassmanage")
    public String todeanclassmanage(){
        return "deanclassmanage";
    }

    //发布通知
    @RequestMapping("/announcementpublish")
    public String toannouncementpublish(){
        return "announcementpublish";
    }

    //发布通知
    @RequestMapping("/announcementfinished")
    public String toannouncementfinished(){
        return "announcementfinished";
    }

}
