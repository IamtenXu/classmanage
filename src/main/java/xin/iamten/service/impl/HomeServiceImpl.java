package xin.iamten.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.iamten.dao.HomeinfoMapper;
import xin.iamten.entity.Homeinfo;
import xin.iamten.service.HomeService;

import java.util.List;

@Service
public class HomeServiceImpl implements HomeService {

    @Autowired
    private HomeinfoMapper homeinfoMapper;

    @Override
    public Homeinfo queryHomeinfoByStuid(String stuid) {
        return homeinfoMapper.selectByPrimaryKey(stuid);
    }

    @Override
    public List<Homeinfo> querhomelistByOthers(Homeinfo homeinfo) {
        return homeinfoMapper.selecthomeByOthers(homeinfo);
    }

    @Override
    public boolean updateHomeinfo(String stuid,String fname,String fphone,String mname,String mphone,String emergencyname,String emergencyphone,String hadress) {
        Homeinfo homeinfo = new Homeinfo();
        if(stuid!=null){
            homeinfo.setStuid(stuid);
        }else {
            return false;
        }
        if(fname!=null){
            homeinfo.setFname(fname);
        }
        if(fphone!=null){
            homeinfo.setFphone(fphone);
        }
        if(mname!=null){
            homeinfo.setMname(mname);
        }
        if(mphone!=null){
            homeinfo.setMphone(mphone);
        }
        if(hadress!=null){
            homeinfo.setHadress(hadress);
        }
        homeinfo.setEmergencyname(emergencyname);
        homeinfo.setEmergencyphone(emergencyphone);
        homeinfoMapper.updateByPrimaryKeySelective(homeinfo);
        return true;
    }

    @Override
    public boolean insertHomeinfo(String stuid,String fname,String fphone,String mname,String mphone,String emergencyname,String emergencyphone,String hadress) {
        Homeinfo homeinfo = new Homeinfo();
        if(stuid!=null){
            homeinfo.setStuid(stuid);
        }else {
            return false;
        }
        if(fname!=null){
            homeinfo.setFname(fname);
        }
        if(fphone!=null){
            homeinfo.setFphone(fphone);
        }
        if(mname!=null){
            homeinfo.setMname(mname);
        }
        if(mphone!=null){
            homeinfo.setMname(mphone);
        }
        if(hadress!=null){
            homeinfo.setHadress(hadress);
        }
        homeinfo.setEmergencyname(emergencyname);
        homeinfo.setEmergencyphone(emergencyphone);
        homeinfoMapper.insertSelective(homeinfo);
        return true;
    }
}
