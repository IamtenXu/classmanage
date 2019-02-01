package xin.iamten.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

    //导航栏
    @RequestMapping("/iframe")
    public String toiframe(){
        return "iframe";
    }

    //退出
    @RequestMapping("/exit")
    public String toindex(){
        return "login";
    }

    //学生个人信息
    @RequestMapping("/stuinfo")
    public String tostuinfo(){
        return "stuinfo";
    }

    //班级信息
    @RequestMapping("/classinfo")
    public String toclassinfo(){
        return "classinfo";
    }


}
