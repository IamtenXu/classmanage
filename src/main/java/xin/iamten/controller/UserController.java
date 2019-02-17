package xin.iamten.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import xin.iamten.entity.*;
import xin.iamten.service.*;
import xin.iamten.utils.COSClientUtil;
import xin.iamten.utils.ClassTea;
import xin.iamten.utils.Login;
import xin.iamten.utils.R;

import javax.servlet.http.HttpSession;
import java.util.List;

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

    @Autowired
    private ClassTeaService classTeaService;

    @Autowired
    private HomeService homeService;

    @Autowired
    private AnnouncementService announcementService;

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
                    classTea=classTeaService.setClassTea(classinfo,instructor,headmaster);
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
                classTea=classTeaService.setClassTea(classinfo,instructor,headmaster);
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
    //注册
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public R register(@RequestParam String username, @RequestParam String password) {
        if (password.equals("")) {
            return R.error("请输入正确格式的密码，不能为空！");
        }
        if(username.length()==8) {
            Stuinfo stuinfo = new Stuinfo();
            stuinfo.setStuid(username);
            if (stuService.queryStu(stuinfo) == null) {
                return R.error("请确认输入的学号是否正确，如果正确请联系辅导员，重新导入您的信息！");
            } else {
                stuinfo = stuService.queryStu(stuinfo);
                Loginuser loginuser = new Loginuser();
                loginuser.setUsername(username);
                loginuser.setPassword(password);
                loginuser.setRole(stuinfo.getSrole());
                if (loginuserService.queryLoginuser(loginuser) != null) {
                    return R.error("你的学号已被注册，如是本人注册请直接登录，如不是本人注册则尽快联系辅导员！");
                } else {
                    loginuserService.insertLoginuser(loginuser);
                    return R.ok("注册成功！");
                }
            }
        }else if(username.length()==5) {
            Teainfo teainfo = new Teainfo();
            teainfo.setTeaid(username);
            if (teaService.queryTea(teainfo) == null) {
                return R.error("请确认输入的工号是否正确，如果正确请联系人事处，重新导入您的信息！");
            } else {
                teainfo = teaService.queryTea(teainfo);
                Loginuser loginuser = new Loginuser();
                loginuser.setUsername(username);
                loginuser.setPassword(password);
                loginuser.setRole(teainfo.getTrole());
                if (loginuserService.queryLoginuser(loginuser) != null) {
                    return R.error("你的工号已被注册，如是本人注册请直接登录，如不是本人注册则尽快联系人事处！");
                } else {
                    loginuserService.insertLoginuser(loginuser);
                    return R.ok("注册成功！");
                }
            }
        }else{
            return R.error("请重新确认您的工号/学号格式！");
        }
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
        return R.ok("上传成功！");
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
        return R.ok("上传成功！");
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
    //班委信息
    @RequestMapping(value = "/classmanager", method = RequestMethod.GET)
    @ResponseBody
    public R classmanager(@RequestParam(value = "sclass",required=false,defaultValue="") String sclass) {
        Stuinfo getuser = new Stuinfo();
        if(sclass.equals("")){
            sclass = null;
        }
        getuser.setSclass(sclass);
        List<Stuinfo> userList = stuService.queryClassmanagerList(getuser);
        int count = userList.size();
        return R.ok().put("data", userList).put("count",count);
    }
    //成员列表
    @RequestMapping(value = "/classmember", method = RequestMethod.GET)
    @ResponseBody
    public R classmember(@RequestParam(value = "sclass",required=false,defaultValue="") String sclass) {
        Stuinfo getuser = new Stuinfo();
        if(sclass.equals("")){
            sclass = null;
        }
        getuser.setSclass(sclass);
        List<Stuinfo> userList = stuService.queryStuList(getuser);
        int count = userList.size();
        return R.ok().put("data", userList).put("count",count);
    }
    //个人家庭信息
    @RequestMapping(value = "/stuhomeinfo", method = RequestMethod.POST)
    @ResponseBody
    public R stuhomeinfo(@RequestParam(value = "stuid",required=false,defaultValue="") String stuid) {
        Homeinfo homeinfo = homeService.queryHomeinfoByStuid(stuid);
        return R.ok().put("homeinfo", homeinfo);
    }
    //班级家庭信息
    @RequestMapping(value = "/classhome", method = RequestMethod.GET)
    @ResponseBody
    public R classhome(@RequestParam String sclass) {
        Classinfo classinfo = new Classinfo();
        classinfo.setClassid(sclass);
        Stuinfo stuinfo = new Stuinfo();
        stuinfo.setClassinfo(classinfo);
        Homeinfo homeinfo = new Homeinfo();
        homeinfo.setStuinfo(stuinfo);
        List<Homeinfo> homeinfos = homeService.querhomelistByOthers(homeinfo);
        int count = homeinfos.size();
        return R.ok().put("data", homeinfos).put("count",count);
    }
    //个人家庭信息修改
    @RequestMapping(value = "/updatehome", method = RequestMethod.POST)
    @ResponseBody
    public R updatehome(@RequestParam String stuid,
                        @RequestParam(value = "fname",required=false,defaultValue="") String fname,
                        @RequestParam(value = "fphone",required=false,defaultValue="") String fphone,
                        @RequestParam(value = "mname",required=false,defaultValue="") String mname,
                        @RequestParam(value = "mphone",required=false,defaultValue="") String mphone,
                        @RequestParam String emergencyname,
                        @RequestParam String emergencyphone,
                        @RequestParam(value = "hadress",required=false,defaultValue="") String hadress,
                        HttpSession httpSession) {
        if(stuid.equals("")){
            Stuinfo stuinfo =(Stuinfo)httpSession.getAttribute("userinfo");
            stuid= stuinfo.getStuid();
        }
        if(homeService.queryHomeinfoByStuid(stuid)==null){
            if(fname.equals("")){
                fname= null;
            }
            if(fphone.equals("")){
                fphone=null;
            }
            if(mname.equals("")){
                mname=null;
            }
            if(mphone.equals("")){
                mphone=null;
            }
            if(hadress.equals("")){
                hadress=null;
            }
            homeService.insertHomeinfo(stuid,fname,fphone,mname,mphone,emergencyname,emergencyphone,hadress);
        }else{
            homeService.updateHomeinfo(stuid,fname,fphone,mname,mphone,emergencyname,emergencyphone,hadress);
        }
        return R.ok("修改成功！");
    }
    //班级通知
    @RequestMapping(value = "/announcementClass", method = RequestMethod.GET)
    @ResponseBody
    public R announcementList(@RequestParam String sclass) {
        List<Announcement> announcements = announcementService.queryByClass(sclass);
        return R.ok().put("data",announcements);
    }
    //单个通知
    @RequestMapping(value = "/announcementById", method = RequestMethod.POST)
    @ResponseBody
    public R announcementById(@RequestParam Integer id) {
        Announcement announcement = announcementService.queryByid(id);
        return R.ok().put("announcement",announcement);
    }
    //辅导员/班主任通知
    @RequestMapping(value = "/announcementTea", method = RequestMethod.GET)
    @ResponseBody
    public R announcementTea(@RequestParam String sclass) {
        List<Announcement> announcements = announcementService.queryByTea(sclass);
        return R.ok().put("data",announcements);
    }
    //班主任通知
    @RequestMapping(value = "/announcementHead", method = RequestMethod.GET)
    @ResponseBody
    public R announcementHead(@RequestParam String sclass) {
        List<Announcement> announcements = announcementService.queryByHead(sclass);
        return R.ok().put("data",announcements);
    }
    //辅导员已发布通知deletAnnouncement
    @RequestMapping(value = "/Teaannouncement", method = RequestMethod.GET)
    @ResponseBody
    public R Teaannouncement(@RequestParam String publisher) {
        List<Announcement> announcements = announcementService.queryBypublish(publisher);
        return R.ok().put("data",announcements);
    }
    //辅导员删除已发布的通知
    @RequestMapping(value = "/deletAnnouncement", method = RequestMethod.POST)
    @ResponseBody
    public R deletAnnouncement(@RequestParam Integer id) {
        announcementService.delById(id);
        return R.ok();
    }
    //辅导员修改已发布的通知
    @RequestMapping(value = "/updateAnnouncement", method = RequestMethod.POST)
    @ResponseBody
    public R updateAnnouncement(@RequestParam Integer id,@RequestParam String title,@RequestParam String text,@RequestParam String atime) {
        Announcement announcement = new Announcement();
        announcement.setId(id);
        announcement.setTitle(title);
        announcement.setText(text);
        announcement.setAtime(atime);
        announcementService.update(announcement);
        return R.ok();
    }

}
