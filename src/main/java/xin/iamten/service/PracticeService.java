package xin.iamten.service;

import org.springframework.beans.factory.annotation.Autowired;
import xin.iamten.entity.Practice;
import xin.iamten.entity.PracticeAnalysis;

import java.util.List;

public interface PracticeService {

    int insertOneP(Practice practice);

    Practice queryOneP(String stuid);

    boolean updateOneP(Practice practice);

    List<Practice> queryListP(String classid);

    List<PracticeAnalysis> queryListPAnalysis(String classid);
}
