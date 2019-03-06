package xin.iamten.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.iamten.dao.HolidaycheckMapper;
import xin.iamten.entity.Holiday;
import xin.iamten.entity.Holidaycheck;
import xin.iamten.service.HolidayService;
import xin.iamten.utils.R;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/holiday")
public class HolidayController {

    @Autowired
    private HolidayService holidayService;

    @RequestMapping(value = "/holidayison", method = RequestMethod.POST)
    @ResponseBody
    public R holidayison() {
        Holiday holiday = holidayService.queryIson();
        return R.ok().put("holiday",holiday);
    }
    @RequestMapping(value = "/holidayset", method = RequestMethod.POST)
    @ResponseBody
    public R holidayset(@RequestParam String year,
                        @RequestParam String holidayname,
                        @RequestParam String starttime,
                        @RequestParam String endtime) {
        holidayname = year + holidayname;
        Holiday  holiday = new Holiday();
        if(holidayService.queryByHolidayname(holidayname)!=null){
            if(holidayService.queryIson()!=null){
                Holiday holidayison = holidayService.queryIson();
                holidayison.setIson(false);
                holidayService.updateHoliday(holidayison);
            }
            holiday = holidayService.queryByHolidayname(holidayname);
            holiday.setHolidayname(holidayname);
            holiday.setStarttime(starttime);
            holiday.setEndtime(endtime);
            holiday.setIson(true);
            holidayService.updateHoliday(holiday);
            return R.ok();
        }
        if(holidayService.queryIson()!=null){
            Holiday holidayison = holidayService.queryIson();
            holidayison.setIson(false);
            holidayService.updateHoliday(holidayison);
        }
        holiday.setHolidayname(holidayname);
        holiday.setStarttime(starttime);
        holiday.setEndtime(endtime);
        holiday.setIson(true);
        holidayService.insertHoliday(holiday);
        return R.ok();
    }
    //节假日离校登记holidaychecked
    @RequestMapping(value = "/holidaycheck", method = RequestMethod.POST)
    @ResponseBody
    public R holidaycheck(@RequestParam String holidayname, @RequestParam String leavetime, @RequestParam String backtime,
                          @RequestParam String classid, @RequestParam String stuid, @RequestParam String name,@RequestParam String phone,
                          @RequestParam String gotowhere, @RequestParam String province, @RequestParam String city,@RequestParam String area,
                          @RequestParam String emergencyname, @RequestParam String emergencyphone,
                          @RequestParam String note){
        Holidaycheck holidaycheck = new Holidaycheck();
        holidaycheck.setHolidayname(holidayname);
        holidaycheck.setStuid(stuid);
        if(holidayService.queryHCByHolidaynameAndStuid(holidaycheck)!=null){
            holidaycheck = (holidayService.queryHCByHolidaynameAndStuid(holidaycheck));
            holidaycheck.setLeavetime(leavetime);
            holidaycheck.setBacktime(backtime);
            holidaycheck.setPhone(phone);
            holidaycheck.setGotowhere(gotowhere);
            holidaycheck.setProvince(province);
            holidaycheck.setCity(city);
            holidaycheck.setArea(area);
            holidaycheck.setEmergencyname(emergencyname);
            holidaycheck.setEmergencyphone(emergencyphone);
            holidaycheck.setNote(note);
            holidayService.updateHolidaycheck(holidaycheck);
            return R.ok();
        }
        holidaycheck.setLeavetime(leavetime);
        holidaycheck.setBacktime(backtime);
        holidaycheck.setClassid(classid);
        holidaycheck.setName(name);
        holidaycheck.setPhone(phone);
        holidaycheck.setGotowhere(gotowhere);
        holidaycheck.setProvince(province);
        holidaycheck.setCity(city);
        holidaycheck.setArea(area);
        holidaycheck.setEmergencyname(emergencyname);
        holidaycheck.setEmergencyphone(emergencyphone);
        holidaycheck.setNote(note);
        holidayService.insertHolidaycheck(holidaycheck);
        return R.ok();
    }
    //节假日离校登记
    @RequestMapping(value = "/holidaychecked", method = RequestMethod.POST)
    @ResponseBody
    public R holidaychecked(@RequestParam String holidayname,@RequestParam String stuid){
        Holidaycheck holidaycheck = new Holidaycheck();
        holidaycheck.setHolidayname(holidayname);
        holidaycheck.setStuid(stuid);
        if(holidayService.queryHCByHolidaynameAndStuid(holidaycheck)!=null){
            holidaycheck = (holidayService.queryHCByHolidaynameAndStuid(holidaycheck));
            return R.ok().put("holidaycheck",holidaycheck).put("checked",1);
        }else{
            return R.ok();
        }
    }

    //节假日离校登记
    @RequestMapping(value = "/holidaymanage", method = RequestMethod.GET)
    @ResponseBody
    public R holidaymanage(@RequestParam String classid,@RequestParam String holidayname){
        Holidaycheck holidaycheck = new Holidaycheck();
        holidaycheck.setClassid(classid);
        Holiday holiday = holidayService.queryIson();
        holidaycheck.setHolidayname(holiday.getHolidayname());
        List<Holidaycheck> holidaycheckList = holidayService.queryHCListByHolidayname(holidaycheck);
        return R.ok().put("data",holidaycheckList);
    }

}
