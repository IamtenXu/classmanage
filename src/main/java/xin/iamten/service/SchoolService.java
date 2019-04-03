package xin.iamten.service;

import xin.iamten.entity.PracticeAnalysis;
import xin.iamten.entity.School;

import java.util.List;

public interface SchoolService {

    School queryOne(String stuid);

    int insertOnr(School school);

    int updateOne(School school);

    List<School> queryList(String classid);

    List<PracticeAnalysis> queryListPAnalysis(String classid);

}
