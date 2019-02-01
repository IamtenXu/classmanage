package xin.iamten.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.iamten.entity.Classinfo;
import xin.iamten.entity.Loginuser;
import xin.iamten.entity.Stuinfo;
import xin.iamten.entity.Teainfo;
import xin.iamten.service.ClassService;
import xin.iamten.service.LoginuserService;
import xin.iamten.service.StuService;
import xin.iamten.service.TeaService;
import xin.iamten.utils.ClassTea;
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

    @Autowired
    private ClassService classService;

    //登录
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public R login(@RequestParam String username, @RequestParam String password, HttpSession session) {
//        System.out.println(username);
//        System.out.println(password);
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
                if(teaService.queryTea(tea)==null){
                    return R.error("用户名信息缺失，请联系管理员！");
                }
                Teainfo queryTea = teaService.queryTea(tea);
                session.setAttribute("userinfo",queryTea);
//                if(queryTea.getTrole()==3){
//
//                }
                login.setName(queryTea.getTname());
                login.setUsername(queryTea.getTeaid());
                login.setRole(queryTea.getRoleinfo().getRname());
                login.setPhoto(queryTea.getTphoto());
                login.setStatus("200");
                return R.ok().put("login",login);
            }else if (username.length()==8){
                Stuinfo stu = new Stuinfo();
                stu.setStuid(username);
                if(stuService.queryStu(stu)==null){
                    return R.error("用户名信息缺失，请联系管理员！");
                }
                Stuinfo queryStu = stuService.queryStu(stu);
                Classinfo classinfo = classService.queryClassinfo(queryStu.getSclass());
                ClassTea classTea = new ClassTea();
                Teainfo instructor = new Teainfo();
                instructor.setTeaid(classinfo.getInstructor());
                instructor = teaService.queryTea(instructor);
                Teainfo headmaster = new Teainfo();
                headmaster.setTeaid(classinfo.getHeadmaster());
                headmaster = teaService.queryTea(headmaster);
                classTea.setClassid(classinfo.getClassid());
                classTea.setCcollege(classinfo.getCcollege());
                classTea.setMajor(classinfo.getMajor());
                classTea.setCgrade(classinfo.getCgrade());
                classTea.setInstructor(classinfo.getInstructor());
                classTea.setInstructorname(instructor.getTname());
                classTea.setInstructorphone(instructor.getTphone());
                classTea.setInstructoraddress(instructor.getTaddress());
                classTea.setHeadmaster(classinfo.getHeadmaster());
                classTea.setHeadmastername(headmaster.getTname());
                classTea.setHeadmasterphone(headmaster.getTphone());
                classTea.setHeadmasteraddress(headmaster.getTaddress());
                session.setAttribute("classinfo",classTea);
                session.setAttribute("userinfo",queryStu);
                login.setName(queryStu.getSname());
                login.setUsername(queryStu.getStuid());
                login.setRole(queryStu.getRoleinfo().getRname());
                login.setPhoto(queryStu.getSphoto());
                login.setStatus("200");
                return R.ok().put("login",login);
            }else {
                return R.error("非法用户！请联系管理员核实信息！");
            }
        }
        return R.error("未知错误");
    }


}
