package xin.iamten.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.iamten.entity.Area;
import xin.iamten.entity.City;
import xin.iamten.entity.Province;
import xin.iamten.service.CityService;
import xin.iamten.utils.R;

import java.util.List;

@Controller
@RequestMapping("/city")
public class CityController {

    @Autowired
    private CityService cityService;

    //省
    @RequestMapping(value = "/provinceselect", method = RequestMethod.POST)
    @ResponseBody
    public R provinceselect(){
        List<Province> provinceList = cityService.queryAllProvince();
        return R.ok().put("province",provinceList);
    }
    //市
    @RequestMapping(value = "/cityselect", method = RequestMethod.POST)
    @ResponseBody
    public R cityselect(@RequestParam String provincecode){
        List<City> cityList = cityService.queryCityByProvince(provincecode);
        return R.ok().put("city",cityList);
    }
    //县
    @RequestMapping(value = "/areaselect", method = RequestMethod.POST)
    @ResponseBody
    public R areaselect(@RequestParam String citycode){
        List<Area> areaList = cityService.queryAreaByCity(citycode);
        return R.ok().put("area",areaList);
    }

}
