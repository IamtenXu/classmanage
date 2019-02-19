package xin.iamten.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.iamten.dao.HolidayMapper;
import xin.iamten.entity.Holiday;
import xin.iamten.service.HolidayService;

@Service
public class HolidayServiceImpl implements HolidayService {

    @Autowired
    private HolidayMapper holidayMapper;

    @Override
    public Holiday queryIson() {
        return holidayMapper.selectIson();
    }

}
