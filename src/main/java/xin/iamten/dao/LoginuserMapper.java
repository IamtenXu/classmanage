package xin.iamten.dao;

import xin.iamten.entity.Loginuser;

public interface LoginuserMapper {
    int deleteByPrimaryKey(String username);

    int insert(Loginuser record);

    int insertSelective(Loginuser record);

    Loginuser selectByPrimaryKey(String username);

    int updateByPrimaryKeySelective(Loginuser record);

    int updateByPrimaryKey(Loginuser record);
}