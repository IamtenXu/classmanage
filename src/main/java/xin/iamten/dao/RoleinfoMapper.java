package xin.iamten.dao;

import xin.iamten.entity.Roleinfo;

public interface RoleinfoMapper {
    int deleteByPrimaryKey(Integer rcode);

    int insert(Roleinfo record);

    int insertSelective(Roleinfo record);

    Roleinfo selectByPrimaryKey(Integer rcode);

    int updateByPrimaryKeySelective(Roleinfo record);

    int updateByPrimaryKey(Roleinfo record);
}