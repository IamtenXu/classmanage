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

    //教务处学院select赋值
    @RequestMapping(value = "/collegeselect", method = RequestMethod.GET)
    @ResponseBody
    public R collegeselect()throws Exception{
        List<Teainfo> college=teaService.queryAllcollege();
        return R.ok().put("college",college);
    }

    //教务处查看所有教师
    @RequestMapping(value = "/allteainfo", method = RequestMethod.POST)
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


}
