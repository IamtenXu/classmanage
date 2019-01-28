package xin.iamten.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.iamten.entity.Loginuser;
import xin.iamten.service.LoginuserService;
import xin.iamten.utils.R;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private LoginuserService loginuserService;

    //登录
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public R login(@RequestParam String username, @RequestParam String password, HttpSession session) {
        Loginuser loginuser = new Loginuser();
        loginuser.setUsername(username);
        loginuser.setPassword(password);
        if(loginuserService.queryLoginuser(loginuser)==null)
            return R.error("用户名不存在，请先注册！");
        Loginuser qUsers = loginuserService.queryLoginuser(loginuser);
        if (!qUsers.getPassword().equals(password)) {
            return R.error("密码错误！");
        }
//        else if (password.equals(qUsers.getPassword())) {
//            return R.ok().put("name", qUsers.getName());
//        }
        return R.error();
    }


}
