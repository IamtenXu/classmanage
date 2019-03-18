package xin.iamten.dao;

import xin.iamten.entity.Practice;

public interface PracticeMapper {
    int deleteByPrimaryKey(String stuid);

    int insert(Practice record);

    int insertSelective(Practice record);

    Practice selectByPrimaryKey(String stuid);

    int updateByPrimaryKeySelective(Practice record);

    int updateByPrimaryKey(Practice record);
}