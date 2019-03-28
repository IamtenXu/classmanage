package xin.iamten.dao;

import xin.iamten.entity.PracticeAnalysis;
import xin.iamten.entity.Work;

import java.util.List;

public interface WorkMapper {
    int deleteByPrimaryKey(String stuid);

    int insert(Work record);

    int insertSelective(Work record);

    Work selectByPrimaryKey(String stuid);

    int updateByPrimaryKeySelective(Work record);

    int updateByPrimaryKey(Work record);

    List<Work> selectByclassid(String classid);

    List<PracticeAnalysis> selectWorkAnalysis(String classid);
}