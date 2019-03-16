package xin.iamten.service;

import xin.iamten.entity.Stuinfo;

import java.util.List;

public interface StuService {

    Stuinfo queryStu(Stuinfo stuinfo);

    List<Stuinfo> queryStuList(Stuinfo stuinfo);

    List<Stuinfo> queryClassmanagerList(Stuinfo stuinfo);

    List<Stuinfo> queryStuListByOthers(Stuinfo stuinfo);

    List<Stuinfo> queryManageListByOthers(Stuinfo stuinfo);

    boolean updateStu(Stuinfo stuinfo);

    Stuinfo addStu(Stuinfo stuinfo);

    boolean deletStu(Stuinfo stuinfo);

    int insertforeach(List<Stuinfo> list);

    Stuinfo queryByClassRole(Stuinfo stuinfo);

}
