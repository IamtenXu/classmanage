package xin.iamten.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.iamten.entity.Practice;
import xin.iamten.entity.PracticeAnalysis;
import xin.iamten.service.PracticeService;
import xin.iamten.utils.R;

import java.util.List;

@Controller
@RequestMapping("/practice")
public class PracticeController {

    @Autowired
    private PracticeService practiceService;

    //获取某学生实习信息
    @RequestMapping(value = "/findpractice", method = RequestMethod.POST)
    @ResponseBody
    public R findpractice(@RequestParam String stuid) {
        Practice practice = new Practice();
        if(practiceService.queryOneP(stuid)!=null){
            practice = practiceService.queryOneP(stuid);
            return R.ok().put("is",1).put("practice",practice);
        }
        return R.ok();
    }

    //修改实习信息
    @RequestMapping(value = "/practicecheck", method = RequestMethod.POST)
    @ResponseBody
    public R practicecheck(@RequestParam String stuid,@RequestParam String isrent,@RequestParam String company,@RequestParam String starttime,
                           @RequestParam String endtime,@RequestParam String address) {
        Practice practice = new Practice();
        practice.setStuid(stuid);
        practice.setIsrent(isrent);
        practice.setCompany(company);
        practice.setStarttime(starttime);
        practice.setEndtime(endtime);
        practice.setAddress(address);
        if(practiceService.queryOneP(stuid)!=null){
            practiceService.updateOneP(practice);
            return R.ok("更新成功！");
        }else {
            practiceService.insertOneP(practice);
            return R.ok("登记成功！");
        }
    }

    //获取所有学生实习信息
    @RequestMapping(value = "/practicelist", method = RequestMethod.GET)
    @ResponseBody
    public R practicelist(@RequestParam String classid) {
        List<Practice> practices = practiceService.queryListP(classid);
        return R.ok().put("data",practices);
    }

    //获取所有学生实习公司统计
    @RequestMapping(value = "/analysislist", method = RequestMethod.POST)
    @ResponseBody
    public R analysislist(@RequestParam String classid) {
        List<PracticeAnalysis> practiceAnalyses = practiceService.queryListPAnalysis(classid);
        int sum=0;
        for(int i=0;i<practiceAnalyses.size();i++){
            sum += practiceAnalyses.get(i).getNum();
        }
        for(int i=0;i<practiceAnalyses.size();i++){
            float percent = ((float) practiceAnalyses.get(i).getNum() / sum) * 100;
            String percentSring = percent+"%";
            practiceAnalyses.get(i).setPercent(percentSring);
        }
        return R.ok().put("practiceAnalyses",practiceAnalyses).put("sum",sum);
    }


}
