package xin.iamten.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.iamten.entity.PracticeAnalysis;
import xin.iamten.entity.Stuinfo;
import xin.iamten.entity.School;
import xin.iamten.service.StuService;
import xin.iamten.service.SchoolService;
import xin.iamten.utils.R;

import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/school")
public class SchoolController {

    @Autowired
    private SchoolService schoolService;
    @Autowired
    private StuService stuService;

    //获取某学生实习信息
    @RequestMapping(value = "/findschool", method = RequestMethod.POST)
    @ResponseBody
    public R findschool(@RequestParam String stuid) {
        School school = new School();
        if(schoolService.queryOne(stuid)!=null){
            school = schoolService.queryOne(stuid);
            return R.ok().put("is",1).put("school",school);
        }
        return R.ok();
    }

    //修改实习信息
    @RequestMapping(value = "/schoolcheck", method = RequestMethod.POST)
    @ResponseBody
    public R schoolcheck(@RequestParam String stuid,@RequestParam String status,@RequestParam String schoolname) {
        School school = new School();
        school.setStuid(stuid);
        school.setSchool(schoolname);
        school.setStatus(status);

        if(schoolService.queryOne(stuid)!=null){
            schoolService.updateOne(school);
            return R.ok("更新成功！");
        }else {
            schoolService.insertOnr(school);
            return R.ok("登记成功！");
        }
    }

    //获取所有学生实习信息
    @RequestMapping(value = "/schoollist", method = RequestMethod.GET)
    @ResponseBody
    public R schoollist(@RequestParam String classid) {
        List<School> schools = schoolService.queryList(classid);
        return R.ok().put("data",schools);
    }

    //获取所有学生实习公司统计
    @RequestMapping(value = "/analysislist", method = RequestMethod.POST)
    @ResponseBody
    public R analysislist(@RequestParam String classid) {
        Stuinfo stuinfo = new Stuinfo();
        stuinfo.setSclass(classid);
        List<PracticeAnalysis> schoolAnalyses = schoolService.queryListPAnalysis(classid);
        List<Stuinfo> stuinfos = stuService.queryStuList(stuinfo);
        int all=stuinfos.size();
        int sum=0;
        for(int i=0;i<schoolAnalyses.size();i++){
            sum += schoolAnalyses.get(i).getNum();
        }
        float schoolPercent = ((float) sum/all)*100;
        if(all==0||sum==0){
            schoolPercent=0;
        }
        BigDecimal schoolPercent2 = new BigDecimal(schoolPercent);
        schoolPercent = schoolPercent2.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
        String schoolpercent = schoolPercent+"%";
        for(int i=0;i<schoolAnalyses.size();i++){
            float percent = ((float) schoolAnalyses.get(i).getNum() / sum) * 100;
            BigDecimal percent2 = new BigDecimal(percent);
            percent = percent2.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
            String percentSring = percent+"%";
            schoolAnalyses.get(i).setPercent(percentSring);
        }
        return R.ok().put("schoolAnalyses",schoolAnalyses).put("sum",sum).put("schoolpercent",schoolpercent).put("all",all);
    }

    //获取所有学生实习公司统计
    @RequestMapping(value = "/analysislistfirst", method = RequestMethod.POST)
    @ResponseBody
    public R analysislistfirst(@RequestParam String classid) {
        Stuinfo stuinfo = new Stuinfo();
        stuinfo.setSclass(classid);
        List<PracticeAnalysis> schoolAnalyses = schoolService.queryListPAnalysisFirst(classid);
        List<PracticeAnalysis> stuinfos = schoolService.queryListPAnalysis(classid);
        int all=0;
        for(int i=0;i<stuinfos.size();i++){
            all += stuinfos.get(i).getNum();
        }
        int sum=0;
        for(int i=0;i<schoolAnalyses.size();i++){
            sum += schoolAnalyses.get(i).getNum();
        }
        float schoolPercent = ((float) sum/all)*100;
        if(all==0||sum==0){
            schoolPercent=0;
        }
        BigDecimal schoolPercent2 = new BigDecimal(schoolPercent);
        schoolPercent = schoolPercent2.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
        String schoolpercent = schoolPercent+"%";
        for(int i=0;i<schoolAnalyses.size();i++){
            float percent = ((float) schoolAnalyses.get(i).getNum() / sum) * 100;
            BigDecimal percent2 = new BigDecimal(percent);
            percent = percent2.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
            String percentSring = percent+"%";
            schoolAnalyses.get(i).setPercent(percentSring);
        }
        return R.ok().put("schoolAnalyses",schoolAnalyses).put("sum",sum).put("schoolpercent",schoolpercent).put("all",all);
    }

    //获取所有学生实习公司统计
    @RequestMapping(value = "/analysislistsecond", method = RequestMethod.POST)
    @ResponseBody
    public R analysislistsecond(@RequestParam String classid) {
        Stuinfo stuinfo = new Stuinfo();
        stuinfo.setSclass(classid);
        List<PracticeAnalysis> schoolAnalyses = schoolService.queryListPAnalysisSecond(classid);
        List<PracticeAnalysis> stuinfos = schoolService.queryListPAnalysisFirst(classid);
        int all=0;
        for(int i=0;i<stuinfos.size();i++){
            all += stuinfos.get(i).getNum();
        }
        int sum=0;
        for(int i=0;i<schoolAnalyses.size();i++){
            sum += schoolAnalyses.get(i).getNum();
        }
        float schoolPercent = ((float) sum/all)*100;
        if(all==0||sum==0){
            schoolPercent=0;
        }
        BigDecimal schoolPercent2 = new BigDecimal(schoolPercent);
        schoolPercent = schoolPercent2.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
        String schoolpercent = schoolPercent+"%";
        for(int i=0;i<schoolAnalyses.size();i++){
            float percent = ((float) schoolAnalyses.get(i).getNum() / sum) * 100;
            BigDecimal percent2 = new BigDecimal(percent);
            percent = percent2.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
            String percentSring = percent+"%";
            schoolAnalyses.get(i).setPercent(percentSring);
        }
        return R.ok().put("schoolAnalyses",schoolAnalyses).put("sum",sum).put("schoolpercent",schoolpercent).put("all",all);
    }


}
