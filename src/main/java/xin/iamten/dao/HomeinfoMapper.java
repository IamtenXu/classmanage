package xin.iamten.dao;

import xin.iamten.entity.Homeinfo;

import java.util.List;

public interface HomeinfoMapper {
    int deleteByPrimaryKey(String stuid);

    int insert(Homeinfo record);

    int insertSelective(Homeinfo record);

    Homeinfo selectByPrimaryKey(String stuid);

    int updateByPrimaryKeySelective(Homeinfo record);

    int updateByPrimaryKey(Homeinfo record);

    List<Homeinfo> selecthomeByOthers(Homeinfo record);
}