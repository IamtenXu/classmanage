package xin.iamten.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.iamten.entity.Classinfo;
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


}
