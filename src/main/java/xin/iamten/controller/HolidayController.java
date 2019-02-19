package xin.iamten.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.iamten.entity.Holiday;
import xin.iamten.service.HolidayService;
import xin.iamten.utils.R;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/holiday")
public class HolidayController {

    @Autowired
    private HolidayService holidayService;

    @RequestMapping(value = "/holidayison", method = RequestMethod.POST)
    @ResponseBody
    public R login() {
        Holiday holiday = holidayService.queryIson();
        return R.ok().put("holiday",holiday);
    }

}
