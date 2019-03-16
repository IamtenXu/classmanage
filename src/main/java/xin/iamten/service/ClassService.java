package xin.iamten.service;

import xin.iamten.entity.Classinfo;

import java.util.List;

public interface ClassService {

    int insertforeach(List<Classinfo> list);

    Classinfo queryClassinfo(String classsid);

    Classinfo queryClassinfoByHeadmaster(String headmaster);

    List<Classinfo> queryClassinfoByInstructor(String instructor);

    List<Classinfo> queryAllcollege();
    List<Classinfo> queryMajorByCollege(String college);
    List<Classinfo> queryGradeByMajor(String major);
    List<Classinfo> queryClassByGrade(String grade,String major);
    List<Classinfo> queryAll();

}
