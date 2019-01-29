package xin.iamten.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.iamten.entity.Loginuser;
import xin.iamten.entity.Teainfo;
import xin.iamten.service.LoginuserService;
import xin.iamten.service.StuService;
import xin.iamten.service.TeaService;
import xin.iamten.utils.Login;
import xin.iamten.utils.R;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private LoginuserService loginuserService;

    @Autowired
    private TeaService teaService;

    @Autowired
    private StuService stuService;

    //登录
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public R login(@RequestParam String username, @RequestParam String password, HttpSession session) {
        System.out.println(username);
        System.out.println(password);
        Loginuser loginuser = new Loginuser();
        loginuser.setUsername(username);
        loginuser.setPassword(password);
        if(loginuserService.queryLoginuser(loginuser)==null)
            return R.error("用户名不存在，请先注册！");
        Loginuser qUsers = loginuserService.queryLoginuser(loginuser);
        if (!qUsers.getPassword().equals(password)) {
            return R.error("密码错误！");
        }
        else if (password.equals(qUsers.getPassword())) {
            Login login = new Login();
            if(username.length()==5){
                Teainfo tea = new Teainfo();
                tea.setTeaid(username);
                if(teaService.queryTea(tea)==null)
                    return R.error("用户名信息缺失，请联系管理员！");
                Teainfo queryTea = teaService.queryTea(tea);
                session.setAttribute("userinfo",queryTea);
                login.setName(queryTea.getTname());
                login.setUsername(queryTea.getTeaid());
                login.setRole(queryTea.getRoleinfo().getRname());
                return R.ok().put("login",login);
            }
            return R.error("非法用户！请联系管理员核实信息！");
        }
        return R.error("未知错误");
    }


}
