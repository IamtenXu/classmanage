package xin.iamten.service;

import org.springframework.beans.factory.annotation.Autowired;
import xin.iamten.entity.Practice;

public interface PracticeService {

    int insertOne(Practice practice);

    Practice queryOne(String stuid);

    boolean updateOne(Practice practice);
}
