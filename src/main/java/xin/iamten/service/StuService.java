package xin.iamten.service;

import xin.iamten.entity.Stuinfo;

import java.util.List;

public interface StuService {

    Stuinfo queryStu(Stuinfo stuinfo);

    List<Stuinfo> queryStuList(Stuinfo stuinfo);

    boolean updateStu(Stuinfo stuinfo);

    Stuinfo addStu(Stuinfo stuinfo);

    boolean deletStu(Stuinfo stuinfo);

}
