package xin.iamten.service;

import xin.iamten.entity.PracticeAnalysis;
import xin.iamten.entity.Work;

import java.util.List;

public interface WorkService {

    Work queryOne(String stuid);

    int insertOnr(Work work);

    int updateOne(Work work);

    List<Work> queryList(String classid);

    List<PracticeAnalysis> queryListPAnalysis(String classid);

}
