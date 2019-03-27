package xin.iamten.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.iamten.entity.Work;
import xin.iamten.entity.PracticeAnalysis;
import xin.iamten.entity.Stuinfo;
import xin.iamten.service.WorkService;
import xin.iamten.service.StuService;
import xin.iamten.utils.R;

import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/work")
public class WorkController {

    @Autowired
    private WorkService workService;
    @Autowired
    private StuService stuService;

    //获取某学生实习信息
    @RequestMapping(value = "/findwork", method = RequestMethod.POST)
    @ResponseBody
    public R findwork(@RequestParam String stuid) {
        Work work = new Work();
        if(workService.queryOne(stuid)!=null){
            work = workService.queryOne(stuid);
            return R.ok().put("is",1).put("work",work);
        }
        return R.ok();
    }

    //修改实习信息
    @RequestMapping(value = "/workcheck", method = RequestMethod.POST)
    @ResponseBody
    public R workcheck(@RequestParam String stuid,@RequestParam short status,@RequestParam String company) {
        Work work = new Work();
        work.setStuid(stuid);
        work.setCompany(company);
        work.setStatus(status);

        if(workService.queryOne(stuid)!=null){
            workService.updateOne(work);
            return R.ok("更新成功！");
        }else {
            workService.insertOnr(work);
            return R.ok("登记成功！");
        }
    }

    //获取所有学生实习信息
    @RequestMapping(value = "/worklist", method = RequestMethod.GET)
    @ResponseBody
    public R worklist(@RequestParam String classid) {
        List<Work> works = workService.queryList(classid);
        return R.ok().put("data",works);
    }

    //获取所有学生实习公司统计
    @RequestMapping(value = "/analysislist", method = RequestMethod.POST)
    @ResponseBody
    public R analysislist(@RequestParam String classid) {
        Stuinfo stuinfo = new Stuinfo();
        stuinfo.setSclass(classid);
        List<PracticeAnalysis> workAnalyses = workService.queryListPAnalysis(classid);
        List<Stuinfo> stuinfos = stuService.queryStuList(stuinfo);
        int all=stuinfos.size();
        int sum=0;
        for(int i=0;i<workAnalyses.size();i++){
            sum += workAnalyses.get(i).getNum();
        }
        float workPercent = ((float) sum/all)*100;
        if(all==0||sum==0){
            workPercent=0;
        }
        BigDecimal workPercent2 = new BigDecimal(workPercent);
        workPercent = workPercent2.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
        String workpercent = workPercent+"%";
        for(int i=0;i<workAnalyses.size();i++){
            float percent = ((float) workAnalyses.get(i).getNum() / sum) * 100;
            BigDecimal percent2 = new BigDecimal(percent);
            percent = percent2.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
            String percentSring = percent+"%";
            workAnalyses.get(i).setPercent(percentSring);
        }
        return R.ok().put("workAnalyses",workAnalyses).put("sum",sum).put("workpercent",workpercent).put("all",all);
    }


}
