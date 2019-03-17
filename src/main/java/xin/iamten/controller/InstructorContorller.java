package xin.iamten.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.iamten.entity.*;
import xin.iamten.service.*;
import xin.iamten.utils.ClassTea;
import xin.iamten.utils.R;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/instructor")
public class InstructorContorller {
    @Autowired
    private LoginuserService loginuserService;

    @Autowired
    private TeaService teaService;

    @Autowired
    private StuService stuService;

    @Autowired
    private ClassService classService;

    @Autowired
    private ClassTeaService classTeaService;


    //辅导员班级select赋值
    @RequestMapping(value = "/instructorselect", method = RequestMethod.GET)
    @ResponseBody
    public R instructorcselect(HttpSession httpSession)throws Exception{
        Teainfo teainfo=(Teainfo) httpSession.getAttribute("userinfo");
        List<Classinfo> classinfo=classService.queryClassinfoByInstructor(teainfo.getTeaid());
        return R.ok().put("classinfo",classinfo);
    }

    //辅导员查询班级信息
    @RequestMapping(value = "/instructorclassinfo", method = RequestMethod.POST)
    @ResponseBody
    public R instructorclassinfo(@RequestParam(value = "classid",required=false,defaultValue="") String classid)throws Exception{
        Classinfo classinfo = classService.queryClassinfo(classid);
        ClassTea classTea = new ClassTea();
        Teainfo instructor = new Teainfo();
        instructor.setTeaid(classinfo.getInstructor());
        instructor = teaService.queryTea(instructor);
        Teainfo headmaster = new Teainfo();
        headmaster.setTeaid(classinfo.getHeadmaster());
        headmaster = teaService.queryTea(headmaster);
        classTea=classTeaService.setClassTea(classinfo,instructor,headmaster);
        return R.ok().put("classinfo",classTea);
    }
    //辅导员查询班委信息
    @RequestMapping(value = "/instructormanagequery", method = RequestMethod.POST)
    @ResponseBody
    public R instructormanagequery(@RequestParam(value = "classid",required=false,defaultValue="") String classid)throws Exception{
        Classmanage classmanage = new Classmanage();
        Stuinfo stuinfo = new Stuinfo();
        Stuinfo getstuinfo = new Stuinfo();
        stuinfo.setSclass(classid);
        List<Stuinfo> stuinfoList = stuService.queryStuList(stuinfo);
        stuinfo.setSrole(4);
        if(stuService.queryByClassRole(stuinfo) != null){
            getstuinfo = stuService.queryByClassRole(stuinfo);
            classmanage.setMonitor(getstuinfo);
        }
        stuinfo.setSrole(5);
        if(stuService.queryByClassRole(stuinfo) != null){
            getstuinfo = stuService.queryByClassRole(stuinfo);
            classmanage.setSecretary(getstuinfo);
        }
        stuinfo.setSrole(14);
        if(stuService.queryByClassRole(stuinfo) != null){
            getstuinfo = stuService.queryByClassRole(stuinfo);
            classmanage.setMmonitor(getstuinfo);
        }
        stuinfo.setSrole(6);
        if(stuService.queryByClassRole(stuinfo) != null){
            getstuinfo = stuService.queryByClassRole(stuinfo);
            classmanage.setLearning(getstuinfo);
        }
        stuinfo.setSrole(7);
        if(stuService.queryByClassRole(stuinfo) != null){
            getstuinfo = stuService.queryByClassRole(stuinfo);
            classmanage.setOrganizing(getstuinfo);
        }
        stuinfo.setSrole(8);
        if(stuService.queryByClassRole(stuinfo) != null){
            getstuinfo = stuService.queryByClassRole(stuinfo);
            classmanage.setPublicity(getstuinfo);
        }
        stuinfo.setSrole(9);
        if(stuService.queryByClassRole(stuinfo) != null){
            getstuinfo = stuService.queryByClassRole(stuinfo);
            classmanage.setArt(getstuinfo);
        }
        stuinfo.setSrole(10);
        if(stuService.queryByClassRole(stuinfo) != null){
            getstuinfo = stuService.queryByClassRole(stuinfo);
            classmanage.setSports(getstuinfo);
        }
        stuinfo.setSrole(11);
        if(stuService.queryByClassRole(stuinfo) != null){
            getstuinfo = stuService.queryByClassRole(stuinfo);
            classmanage.setLife(getstuinfo);
        }
        stuinfo.setSrole(12);
        if(stuService.queryByClassRole(stuinfo) != null){
            getstuinfo = stuService.queryByClassRole(stuinfo);
            classmanage.setPsychological(getstuinfo);
        }
        return R.ok().put("classmanage",classmanage).put("stulist",stuinfoList);
    }
    //辅导员设置班委
    @RequestMapping(value = "/instructormanageset", method = RequestMethod.POST)
    @ResponseBody
    public R instructormanageset(@RequestParam String classid,@RequestParam String monitor,
                                 @RequestParam String secretary,@RequestParam String mmonitor,@RequestParam String learning,
                                 @RequestParam String sports,@RequestParam String art,@RequestParam String organizing,
                                 @RequestParam String publicity,@RequestParam String life,@RequestParam String psychological)throws Exception{
        Stuinfo stuinfo = new Stuinfo();
        stuinfo.setSclass(classid);
        Stuinfo getstuinfo = new Stuinfo();
        Stuinfo newstuinfo = new Stuinfo();
        Loginuser loginuser =new Loginuser();
        Loginuser getloginuser = new Loginuser();
        stuinfo.setSrole(4);
        if(stuService.queryByClassRole(stuinfo) != null){
            getstuinfo = stuService.queryByClassRole(stuinfo);
            if(!getstuinfo.getStuid().equals(monitor)){
                getstuinfo.setSrole(13);
                stuService.updateStu(getstuinfo);
                loginuser.setUsername(getstuinfo.getStuid());
                if(loginuserService.queryLoginuser(loginuser) != null){
                    getloginuser = loginuserService.queryLoginuser(loginuser);
                    getloginuser.setRole(13);
                    loginuserService.updateLoginuser(getloginuser);
                }
            }
        }
        newstuinfo.setStuid(monitor);
        newstuinfo = stuService.queryStu(newstuinfo);
        newstuinfo.setSrole(4);
        stuService.updateStu(newstuinfo);
        loginuser.setUsername(newstuinfo.getStuid());
        if(loginuserService.queryLoginuser(loginuser) != null){
            getloginuser = loginuserService.queryLoginuser(loginuser);
            getloginuser.setRole(4);
            loginuserService.updateLoginuser(getloginuser);
        }
        stuinfo.setSrole(5);
        if(stuService.queryByClassRole(stuinfo) != null){
            getstuinfo = stuService.queryByClassRole(stuinfo);
            if(!getstuinfo.getStuid().equals(secretary)){
                getstuinfo.setSrole(13);
                stuService.updateStu(getstuinfo);
                loginuser.setUsername(getstuinfo.getStuid());
                if(loginuserService.queryLoginuser(loginuser) != null){
                    getloginuser = loginuserService.queryLoginuser(loginuser);
                    getloginuser.setRole(13);
                    loginuserService.updateLoginuser(getloginuser);
                }
            }
        }
        newstuinfo.setStuid(secretary);
        newstuinfo = stuService.queryStu(newstuinfo);
        newstuinfo.setSrole(5);
        stuService.updateStu(newstuinfo);
        loginuser.setUsername(newstuinfo.getStuid());
        if(loginuserService.queryLoginuser(loginuser) != null){
            getloginuser = loginuserService.queryLoginuser(loginuser);
            getloginuser.setRole(5);
            loginuserService.updateLoginuser(getloginuser);
        }
        stuinfo.setSrole(14);
        if(stuService.queryByClassRole(stuinfo) != null){
            getstuinfo = stuService.queryByClassRole(stuinfo);
            if(!getstuinfo.getStuid().equals(mmonitor)){
                getstuinfo.setSrole(13);
                stuService.updateStu(getstuinfo);
                loginuser.setUsername(getstuinfo.getStuid());
                if(loginuserService.queryLoginuser(loginuser) != null){
                    getloginuser = loginuserService.queryLoginuser(loginuser);
                    getloginuser.setRole(13);
                    loginuserService.updateLoginuser(getloginuser);
                }
            }
        }
        newstuinfo.setStuid(mmonitor);
        newstuinfo = stuService.queryStu(newstuinfo);
        newstuinfo.setSrole(14);
        stuService.updateStu(newstuinfo);
        loginuser.setUsername(newstuinfo.getStuid());
        if(loginuserService.queryLoginuser(loginuser) != null){
            getloginuser = loginuserService.queryLoginuser(loginuser);
            getloginuser.setRole(14);
            loginuserService.updateLoginuser(getloginuser);
        }
        stuinfo.setSrole(6);
        if(stuService.queryByClassRole(stuinfo) != null){
            getstuinfo = stuService.queryByClassRole(stuinfo);
            if(!getstuinfo.getStuid().equals(learning)){
                getstuinfo.setSrole(13);
                stuService.updateStu(getstuinfo);
                loginuser.setUsername(getstuinfo.getStuid());
                if(loginuserService.queryLoginuser(loginuser) != null){
                    getloginuser = loginuserService.queryLoginuser(loginuser);
                    getloginuser.setRole(13);
                    loginuserService.updateLoginuser(getloginuser);
                }
            }
        }
        newstuinfo.setStuid(learning);
        newstuinfo = stuService.queryStu(newstuinfo);
        newstuinfo.setSrole(6);
        stuService.updateStu(newstuinfo);
        loginuser.setUsername(newstuinfo.getStuid());
        if(loginuserService.queryLoginuser(loginuser) != null){
            getloginuser = loginuserService.queryLoginuser(loginuser);
            getloginuser.setRole(6);
            loginuserService.updateLoginuser(getloginuser);
        }
        stuinfo.setSrole(7);
        if(stuService.queryByClassRole(stuinfo) != null){
            getstuinfo = stuService.queryByClassRole(stuinfo);
            if(!getstuinfo.getStuid().equals(organizing)){
                getstuinfo.setSrole(13);
                stuService.updateStu(getstuinfo);
                loginuser.setUsername(getstuinfo.getStuid());
                if(loginuserService.queryLoginuser(loginuser) != null){
                    getloginuser = loginuserService.queryLoginuser(loginuser);
                    getloginuser.setRole(13);
                    loginuserService.updateLoginuser(getloginuser);
                }
            }
        }
        newstuinfo.setStuid(organizing);
        newstuinfo = stuService.queryStu(newstuinfo);
        newstuinfo.setSrole(7);
        stuService.updateStu(newstuinfo);
        loginuser.setUsername(newstuinfo.getStuid());
        if(loginuserService.queryLoginuser(loginuser) != null){
            getloginuser = loginuserService.queryLoginuser(loginuser);
            getloginuser.setRole(7);
            loginuserService.updateLoginuser(getloginuser);
        }
        stuinfo.setSrole(8);
        if(stuService.queryByClassRole(stuinfo) != null){
            getstuinfo = stuService.queryByClassRole(stuinfo);
            if(!getstuinfo.getStuid().equals(publicity)){
                getstuinfo.setSrole(13);
                stuService.updateStu(getstuinfo);
                loginuser.setUsername(getstuinfo.getStuid());
                if(loginuserService.queryLoginuser(loginuser) != null){
                    getloginuser = loginuserService.queryLoginuser(loginuser);
                    getloginuser.setRole(13);
                    loginuserService.updateLoginuser(getloginuser);
                }
            }
        }
        newstuinfo.setStuid(publicity);
        newstuinfo = stuService.queryStu(newstuinfo);
        newstuinfo.setSrole(8);
        stuService.updateStu(newstuinfo);
        loginuser.setUsername(newstuinfo.getStuid());
        if(loginuserService.queryLoginuser(loginuser) != null) {
            getloginuser = loginuserService.queryLoginuser(loginuser);
            getloginuser.setRole(8);
            loginuserService.updateLoginuser(getloginuser);
        }
        stuinfo.setSrole(9);
        if(stuService.queryByClassRole(stuinfo) != null){
            getstuinfo = stuService.queryByClassRole(stuinfo);
            if(!getstuinfo.getStuid().equals(art)){
                getstuinfo.setSrole(13);
                stuService.updateStu(getstuinfo);
                loginuser.setUsername(getstuinfo.getStuid());
                if(loginuserService.queryLoginuser(loginuser) != null){
                    getloginuser = loginuserService.queryLoginuser(loginuser);
                    getloginuser.setRole(13);
                    loginuserService.updateLoginuser(getloginuser);
                }
            }
        }
        newstuinfo.setStuid(art);
        newstuinfo = stuService.queryStu(newstuinfo);
        newstuinfo.setSrole(9);
        stuService.updateStu(newstuinfo);
        loginuser.setUsername(newstuinfo.getStuid());
        if(loginuserService.queryLoginuser(loginuser) != null){
            getloginuser = loginuserService.queryLoginuser(loginuser);
            getloginuser.setRole(9);
            loginuserService.updateLoginuser(getloginuser);
        }
        stuinfo.setSrole(10);
        if(stuService.queryByClassRole(stuinfo) != null){
            getstuinfo = stuService.queryByClassRole(stuinfo);
            if(!getstuinfo.getStuid().equals(sports)){
                getstuinfo.setSrole(13);
                stuService.updateStu(getstuinfo);
                loginuser.setUsername(getstuinfo.getStuid());
                if(loginuserService.queryLoginuser(loginuser) != null){
                    getloginuser = loginuserService.queryLoginuser(loginuser);
                    getloginuser.setRole(13);
                    loginuserService.updateLoginuser(getloginuser);
                }
            }
        }
        newstuinfo.setStuid(sports);
        newstuinfo = stuService.queryStu(newstuinfo);
        newstuinfo.setSrole(10);
        stuService.updateStu(newstuinfo);
        loginuser.setUsername(newstuinfo.getStuid());
        if(loginuserService.queryLoginuser(loginuser) != null){
            getloginuser = loginuserService.queryLoginuser(loginuser);
            getloginuser.setRole(10);
            loginuserService.updateLoginuser(getloginuser);
        }
        stuinfo.setSrole(11);
        if(stuService.queryByClassRole(stuinfo) != null){
            getstuinfo = stuService.queryByClassRole(stuinfo);
            if(!getstuinfo.getStuid().equals(life)){
                getstuinfo.setSrole(13);
                stuService.updateStu(getstuinfo);
                loginuser.setUsername(getstuinfo.getStuid());
                if(loginuserService.queryLoginuser(loginuser) != null){
                    getloginuser = loginuserService.queryLoginuser(loginuser);
                    getloginuser.setRole(13);
                    loginuserService.updateLoginuser(getloginuser);
                }
            }
        }
        newstuinfo.setStuid(life);
        newstuinfo = stuService.queryStu(newstuinfo);
        newstuinfo.setSrole(11);
        stuService.updateStu(newstuinfo);
        loginuser.setUsername(newstuinfo.getStuid());
        if(loginuserService.queryLoginuser(loginuser) != null){
            getloginuser = loginuserService.queryLoginuser(loginuser);
            getloginuser.setRole(11);
            loginuserService.updateLoginuser(getloginuser);
        }
        stuinfo.setSrole(12);
        if(stuService.queryByClassRole(stuinfo) != null){
            getstuinfo = stuService.queryByClassRole(stuinfo);
            if(!getstuinfo.getStuid().equals(psychological)){
                getstuinfo.setSrole(13);
                stuService.updateStu(getstuinfo);
                loginuser.setUsername(getstuinfo.getStuid());
                if(loginuserService.queryLoginuser(loginuser) != null){
                    getloginuser = loginuserService.queryLoginuser(loginuser);
                    getloginuser.setRole(13);
                    loginuserService.updateLoginuser(getloginuser);
                }
            }
        }
        newstuinfo.setStuid(psychological);
        newstuinfo = stuService.queryStu(newstuinfo);
        newstuinfo.setSrole(12);
        stuService.updateStu(newstuinfo);
        loginuser.setUsername(newstuinfo.getStuid());
        if(loginuserService.queryLoginuser(loginuser) != null){
            getloginuser = loginuserService.queryLoginuser(loginuser);
            getloginuser.setRole(12);
            loginuserService.updateLoginuser(getloginuser);
        }
        return R.ok();
    }


}
