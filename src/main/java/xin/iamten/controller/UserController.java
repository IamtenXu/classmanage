package xin.iamten.controller;

import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import xin.iamten.entity.Classinfo;
import xin.iamten.entity.Loginuser;
import xin.iamten.entity.Stuinfo;
import xin.iamten.entity.Teainfo;
import xin.iamten.service.ClassService;
import xin.iamten.service.LoginuserService;
import xin.iamten.service.StuService;
import xin.iamten.service.TeaService;
import xin.iamten.utils.COSClientUtil;
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
                if(queryTea.getTrole()==3){
                    Classinfo classinfo = classService.queryClassinfoByHeadmaster(queryTea.getTeaid());
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
                }
                login.setUsername(queryTea.getTeaid());
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
                login.setUsername(queryStu.getStuid());
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
    
    //修改密码
    @RequestMapping(value = "/updateallpassword", method = RequestMethod.POST)
    @ResponseBody
    public R updateallpassword(@RequestParam String username, @RequestParam String password, @RequestParam String password2,HttpSession session) {
        Loginuser queryUser = new Loginuser();
        queryUser.setUsername(username);
        Loginuser qUsers = loginuserService.queryLoginuser(queryUser);
        if(!qUsers.getPassword().equals(password)) {
            return R.error("原密码错误，请重新输入");
        }
        else{
            qUsers.setPassword(password2);
            loginuserService.updateLoginuser(qUsers);
            return R.ok();
        }
    }

    //学生修改头像
    @RequestMapping(value = "/stuupload", method = RequestMethod.POST)
    @ResponseBody
    public R stuupload(@RequestParam MultipartFile file,HttpSession httpSession)throws Exception{
//        System.out.println(file.getSize());
        String filename=uploadMethod(file);
//        System.out.println(filename);
        Stuinfo stuinfo = (Stuinfo)httpSession.getAttribute("userinfo");
        stuinfo.setSphoto(filename);
        stuService.updateStu(stuinfo);
        httpSession.setAttribute("userinfo",stuinfo);
        return R.ok();
    }
    public String uploadMethod(MultipartFile file) throws Exception {
        COSClientUtil cosClientUtil = new COSClientUtil();
        String name = cosClientUtil.uploadFile2Cos(file);
        String imgUrl = cosClientUtil.getImgUrl(name);
        String[] split = imgUrl.split("\\?");
        return split[0];
    }
    //老师修改头像
    @RequestMapping(value = "/teaupload", method = RequestMethod.POST)
    @ResponseBody
    public R teaupload(@RequestParam MultipartFile file,HttpSession httpSession)throws Exception{
//        System.out.println(file.getSize());
        String filename=uploadMethod(file);
//        System.out.println(filename);
        Teainfo teainfo = (Teainfo)httpSession.getAttribute("userinfo");
        teainfo.setTphoto(filename);
        teaService.updateTea(teainfo);
        httpSession.setAttribute("userinfo",teainfo);
        return R.ok(filename);
    }
    //学生修改个人信息
    @RequestMapping(value = "/updatestu", method = RequestMethod.POST)
    @ResponseBody
    public R updatestu(@RequestParam String stuid, @RequestParam String sbirthday,@RequestParam String ssex, @RequestParam String students,@RequestParam String militarists,
                       @RequestParam String sphone,@RequestParam String semail,@RequestParam String dormitory,HttpSession session){
        Stuinfo stuinfo = new Stuinfo();
        stuinfo.setStuid(stuid);
        stuinfo=stuService.queryStu(stuinfo);
        stuinfo.setSbirthday(sbirthday);
        stuinfo.setSsex(ssex);
        stuinfo.setStudents(students);
        stuinfo.setSpolitical(militarists);
        stuinfo.setSphone(sphone);
        stuinfo.setSemail(semail);
        stuinfo.setSadress(dormitory);
        session.setAttribute("userinfo",stuinfo);
        stuService.updateStu(stuinfo);
        return R.ok("修改成功！");
    }
    //老师修改个人信息
    @RequestMapping(value = "/updatetea", method = RequestMethod.POST)
    @ResponseBody
    public R updatetea(@RequestParam String ttuid, @RequestParam String tbirthday,@RequestParam String tsex,@RequestParam String militarists,
                       @RequestParam String tphone,@RequestParam String temail,@RequestParam String taddress,HttpSession session){
        Teainfo teainfo = new Teainfo();
        teainfo.setTeaid(ttuid);
        teainfo=teaService.queryTea(teainfo);
        teainfo.setTbirthday(tbirthday);
        teainfo.setTsex(tsex);
        teainfo.setTpolitical(militarists);
        teainfo.setTphone(tphone);
        teainfo.setTemail(temail);
        teainfo.setTaddress(taddress);
        session.setAttribute("userinfo",teainfo);
        teaService.updateTea(teainfo);
        return R.ok("修改成功！");
    }


}
