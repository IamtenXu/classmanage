package xin.iamten.dao;

import xin.iamten.entity.Holiday;

import java.util.List;

public interface HolidayMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Holiday record);

    int insertSelective(Holiday record);

    Holiday selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Holiday record);

    int updateByPrimaryKey(Holiday record);

    Holiday selectIson();

    Holiday selectByHolidayname(String holidayname);

    List<Holiday> selectAllHoliday();
}