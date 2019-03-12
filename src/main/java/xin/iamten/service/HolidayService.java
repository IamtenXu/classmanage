package xin.iamten.service;

import xin.iamten.entity.Holiday;
import xin.iamten.entity.Holidaycheck;

import java.util.List;

public interface HolidayService {

    Holiday queryIson();

    Holiday queryByHolidayname(String holidayname);

    boolean insertHoliday(Holiday holiday);

    boolean updateHoliday(Holiday holiday);

    List<Holidaycheck> queryHCListByHolidayname(Holidaycheck holidaycheck);

    Holidaycheck queryHCByHolidaynameAndStuid(Holidaycheck holidaycheck);

    boolean insertHolidaycheck(Holidaycheck holidaycheck);

    boolean updateHolidaycheck(Holidaycheck holidaycheck);

    List<Holiday> queryAllHoliday();

}
