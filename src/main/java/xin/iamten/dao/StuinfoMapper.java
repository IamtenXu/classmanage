package xin.iamten.dao;

import xin.iamten.entity.Stuinfo;

public interface StuinfoMapper {
    int deleteByPrimaryKey(String stuid);

    int insert(Stuinfo record);

    int insertSelective(Stuinfo record);

    Stuinfo selectByPrimaryKey(String stuid);

    int updateByPrimaryKeySelective(Stuinfo record);

    int updateByPrimaryKey(Stuinfo record);
}