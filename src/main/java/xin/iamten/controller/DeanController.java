package xin.iamten.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.iamten.entity.Classinfo;
import xin.iamten.entity.Stuinfo;
import xin.iamten.entity.Teainfo;
import xin.iamten.service.*;
import xin.iamten.utils.R;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/dean")
public class DeanController {
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

    //教务处教师学院select赋值
    @RequestMapping(value = "/collegeselect", method = RequestMethod.GET)
    @ResponseBody
    public R collegeselect()throws Exception{
        List<Teainfo> college=teaService.queryAllcollege();
        return R.ok().put("college",college);
    }
    //教务处班级学院select赋值
    @RequestMapping(value = "/collegeclassselect", method = RequestMethod.GET)
    @ResponseBody
    public R collegeclassselect()throws Exception{
        List<Classinfo> college=classService.queryAllcollege();
        return R.ok().put("college",college);
    }
    //教务处专业select赋值
    @RequestMapping(value = "/majorselect", method = RequestMethod.GET)
    @ResponseBody
    public R majorselect(@RequestParam(value = "college",required=false,defaultValue="") String ccollege)throws Exception{
        List<Classinfo> major=classService.queryMajorByCollege(ccollege);
        return R.ok().put("major",major);
    }
    //教务处年级select赋值
    @RequestMapping(value = "/gradeselect", method = RequestMethod.GET)
    @ResponseBody
    public R gradeselect(@RequestParam(value = "major",required=false,defaultValue="") String major)throws Exception{
        List<Classinfo> cgrade = classService.queryGradeByMajor(major);
        return R.ok().put("cgrade",cgrade);
    }
    //教务处班级select赋值
    @RequestMapping(value = "/classselect", method = RequestMethod.GET)
    @ResponseBody
    public R classselect(@RequestParam(value = "cgrade",required=false,defaultValue="") String cgrade,
                         @RequestParam(value = "major",required=false,defaultValue="") String major)throws Exception{
        List<Classinfo> classid = classService.queryClassByGrade(cgrade,major);
        return R.ok().put("classid",classid);
    }

    //教务处查看所有教师
    @RequestMapping(value = "/allteainfo", method = RequestMethod.GET)
    @ResponseBody
    public R allteainfo(@RequestParam(value = "college",required=false,defaultValue="") String ccollege)throws Exception{
        if(ccollege.equals("")){
            List<Teainfo> teainfos=teaService.queryTeaList();
            int count = teainfos.size();
            return R.ok().put("data",teainfos).put("count",count);
        }else {
            Teainfo teainfo = new Teainfo();
            teainfo.setTcollege(ccollege);
            List<Teainfo> teainfos = teaService.queryTeaListByCollege(teainfo);
            int count = teainfos.size();
            return R.ok().put("data", teainfos).put("count",count);
        }
    }

    //教务处查看所有学生
    @RequestMapping(value = "/allstuinfo", method = RequestMethod.GET)
    @ResponseBody
    public R allstuinfo(@RequestParam(value = "college",required=false,defaultValue="") String ccollege,
                        @RequestParam(value = "major",required=false,defaultValue="") String major,
                        @RequestParam(value = "cgrade",required=false,defaultValue="") String cgrade,
                        @RequestParam(value = "classid",required=false,defaultValue="") String classid)throws Exception{
        if(ccollege.equals("")){ ccollege = null; }
        if(major.equals("")){ major = null; }
        if(cgrade.equals("")){ cgrade = null; }
        if(classid.equals("")){ classid = null; }
        Classinfo classinfo = new Classinfo();
        classinfo.setCcollege(ccollege);
        classinfo.setMajor(major);
        classinfo.setCgrade(cgrade);
        classinfo.setClassid(classid);
        Stuinfo stuinfo = new Stuinfo();
        stuinfo.setClassinfo(classinfo);
        List<Stuinfo> stuinfos=stuService.queryStuListByOthers(stuinfo);
        int count = stuinfos.size();
        return R.ok().put("data", stuinfos).put("count",count);
    }
    //教务处查看班委
    @RequestMapping(value = "/classmanageinfo", method = RequestMethod.GET)
    @ResponseBody
    public R classmanageinfo(@RequestParam(value = "college",required=false,defaultValue="") String ccollege,
                        @RequestParam(value = "major",required=false,defaultValue="") String major,
                        @RequestParam(value = "cgrade",required=false,defaultValue="") String cgrade,
                        @RequestParam(value = "classid",required=false,defaultValue="") String classid)throws Exception{
        if(ccollege.equals("")){ ccollege = null; }
        if(major.equals("")){ major = null; }
        if(cgrade.equals("")){ cgrade = null; }
        if(classid.equals("")){ classid = null; }
        Classinfo classinfo = new Classinfo();
        classinfo.setCcollege(ccollege);
        classinfo.setMajor(major);
        classinfo.setCgrade(cgrade);
        classinfo.setClassid(classid);
        Stuinfo stuinfo = new Stuinfo();
        stuinfo.setClassinfo(classinfo);
        List<Stuinfo> stuinfos=stuService.queryManageListByOthers(stuinfo);
        int count = stuinfos.size();
        return R.ok().put("data", stuinfos).put("count",count);
    }


}
