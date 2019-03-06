package xin.iamten.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.iamten.dao.HolidayMapper;
import xin.iamten.dao.HolidaycheckMapper;
import xin.iamten.entity.Holiday;
import xin.iamten.entity.Holidaycheck;
import xin.iamten.service.HolidayService;

import java.util.List;

@Service
public class HolidayServiceImpl implements HolidayService {

    @Autowired
    private HolidayMapper holidayMapper;

    @Autowired
    private HolidaycheckMapper holidaycheckMapper;

    @Override
    public Holiday queryIson() {
        return holidayMapper.selectIson();
    }

    @Override
    public Holiday queryByHolidayname(String holidayname) {
        return holidayMapper.selectByHolidayname(holidayname);
    }

    @Override
    public boolean insertHoliday(Holiday holiday) {
        if(holiday!=null){
            holidayMapper.insertSelective(holiday);
            return true;
        }
        return false;
    }

    @Override
    public boolean updateHoliday(Holiday holiday) {
        if(holiday!=null){
            holidayMapper.updateByPrimaryKeySelective(holiday);
            return true;
        }
        return false;
    }

    @Override
    public List<Holidaycheck> queryHCListByHolidayname(Holidaycheck holidaycheck) {
        return holidaycheckMapper.selectByHolidayname(holidaycheck);
    }

    @Override
    public Holidaycheck queryHCByHolidaynameAndStuid(Holidaycheck holidaycheck) {
        return holidaycheckMapper.selectByHolidaynameAndStuid(holidaycheck);
    }

    @Override
    public boolean insertHolidaycheck(Holidaycheck holidaycheck) {
        if(holidaycheck != null){
            holidaycheckMapper.insertSelective(holidaycheck);
            return true;
        }
        return false;
    }

    @Override
    public boolean updateHolidaycheck(Holidaycheck holidaycheck) {
        if(holidaycheck != null){
            holidaycheckMapper.updateByPrimaryKeySelective(holidaycheck);
            return true;
        }
        return false;
    }

}
