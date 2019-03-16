package xin.iamten.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.iamten.entity.Classinfo;
import xin.iamten.entity.Classmanage;
import xin.iamten.entity.Stuinfo;
import xin.iamten.entity.Teainfo;
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
    //辅导员查询班级信息
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


}
