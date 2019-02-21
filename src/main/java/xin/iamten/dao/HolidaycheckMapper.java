package xin.iamten.dao;

import xin.iamten.entity.Holidaycheck;

import java.util.List;

public interface HolidaycheckMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Holidaycheck record);

    int insertSelective(Holidaycheck record);

    Holidaycheck selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Holidaycheck record);

    int updateByPrimaryKey(Holidaycheck record);

    List<Holidaycheck> selectByHolidayname(String holidayname);

    Holidaycheck selectByHolidaynameAndStuid(Holidaycheck holidaycheck);
}