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
    public boolean updateHomeinfo(Homeinfo homeinfo) {
        if(homeinfo==null){
            return false;
        }
        homeinfoMapper.updateByPrimaryKeySelective(homeinfo);
        return true;
    }

    @Override
    public boolean insertHomeinfo(Homeinfo homeinfo) {
        if(homeinfo==null){
            return false;
        }
        homeinfoMapper.insertSelective(homeinfo);
        return true;
    }
}
