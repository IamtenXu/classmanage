package xin.iamten.dao;

import xin.iamten.entity.Teainfo;

public interface TeainfoMapper {
    int deleteByPrimaryKey(String teaid);

    int insert(Teainfo record);

    int insertSelective(Teainfo record);

    Teainfo selectByPrimaryKey(String teaid);

    int updateByPrimaryKeySelective(Teainfo record);

    int updateByPrimaryKey(Teainfo record);
}