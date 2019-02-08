package xin.iamten.dao;

import xin.iamten.entity.Classinfo;

public interface ClassinfoMapper {
    int deleteByPrimaryKey(String classid);

    int insert(Classinfo record);

    int insertSelective(Classinfo record);

    Classinfo selectByPrimaryKey(String classid);

    Classinfo selectByHeadmaster(String headmaster);

    int updateByPrimaryKeySelective(Classinfo record);

    int updateByPrimaryKey(Classinfo record);
}