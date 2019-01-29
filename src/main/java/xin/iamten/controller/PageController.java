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

    //主页
    @RequestMapping("/index")
    public String toindex(){
        return "index";
    }

}
