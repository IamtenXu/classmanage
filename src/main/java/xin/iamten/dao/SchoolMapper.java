package xin.iamten.dao;

import xin.iamten.entity.PracticeAnalysis;
import xin.iamten.entity.School;

import java.util.List;

public interface SchoolMapper {
    int deleteByPrimaryKey(String stuid);

    int insert(School record);

    int insertSelective(School record);

    School selectByPrimaryKey(String stuid);

    int updateByPrimaryKeySelective(School record);

    int updateByPrimaryKey(School record);

    List<School> selectList(String classid);

    List<PracticeAnalysis> selectSchoolAnalysis(String classid);

    List<PracticeAnalysis> selectSchoolfirstAnalysis(String classid);

    List<PracticeAnalysis> selectSchoolsecondAnalysis(String classid);
}