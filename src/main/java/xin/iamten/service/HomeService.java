package xin.iamten.service;

import xin.iamten.entity.Homeinfo;

import java.util.List;

public interface HomeService {

    Homeinfo queryHomeinfoByStuid(String stuid);

    List<Homeinfo> querhomelistByOthers(Homeinfo homeinfo);

    boolean updateHomeinfo(Homeinfo homeinfo);

    boolean insertHomeinfo(Homeinfo homeinfo);

}
