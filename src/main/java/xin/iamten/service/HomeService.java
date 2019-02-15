package xin.iamten.service;

import xin.iamten.entity.Homeinfo;

import java.util.List;

public interface HomeService {

    Homeinfo queryHomeinfoByStuid(String stuid);

    List<Homeinfo> querhomelistByOthers(Homeinfo homeinfo);

    boolean updateHomeinfo(String stuid,String fname,String fphone,String mname,String mphone,String emergencyname,String emergencyphone,String hadress);

    boolean insertHomeinfo(String stuid,String fname,String fphone,String mname,String mphone,String emergencyname,String emergencyphone,String hadress);

}
