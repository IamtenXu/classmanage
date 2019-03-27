package xin.iamten.dao;

import xin.iamten.entity.Practice;
import xin.iamten.entity.PracticeAnalysis;

import java.util.List;

public interface PracticeMapper {
    int deleteByPrimaryKey(String stuid);

    int insert(Practice record);

    int insertSelective(Practice record);

    Practice selectByPrimaryKey(String stuid);

    int updateByPrimaryKeySelective(Practice record);

    int updateByPrimaryKey(Practice record);

    List<Practice> selectByClassid(String classid);

    List<PracticeAnalysis> selectPracticeAnalysis(String classid);
}