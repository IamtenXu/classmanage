package xin.iamten.dao;

import xin.iamten.entity.Teainfo;

import java.util.List;

public interface TeainfoMapper {
    int deleteByPrimaryKey(String teaid);

    int insert(Teainfo record);

    int insertSelective(Teainfo record);

    Teainfo selectByPrimaryKey(String teaid);

    int updateByPrimaryKeySelective(Teainfo record);

    int updateByPrimaryKey(Teainfo record);

    List<Teainfo> selectTeainfoByCollege(String tcollege);

    List<Teainfo> selectAllTeainfo();

    List<Teainfo> selectAllCollege();
}