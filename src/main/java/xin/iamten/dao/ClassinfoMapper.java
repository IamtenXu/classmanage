package xin.iamten.dao;

import xin.iamten.entity.Classinfo;

import java.util.List;

public interface ClassinfoMapper {
    int deleteByPrimaryKey(String classid);

    int insert(Classinfo record);

    int insertSelective(Classinfo record);

    Classinfo selectByPrimaryKey(String classid);

    Classinfo selectByHeadmaster(String headmaster);

    List<Classinfo> selectByInstructor(String instructor);

    int updateByPrimaryKeySelective(Classinfo record);

    int updateByPrimaryKey(Classinfo record);


}