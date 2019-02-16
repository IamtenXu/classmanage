package xin.iamten.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.iamten.dao.StuinfoMapper;
import xin.iamten.entity.Stuinfo;
import xin.iamten.service.StuService;

import java.util.List;

@Service
public class StuServiceImpl implements StuService {

    @Autowired
    private StuinfoMapper stuinfoMapper;

    @Override
    public Stuinfo queryStu(Stuinfo stuinfo) {
        return stuinfoMapper.selectByPrimaryKey(stuinfo.getStuid());
    }

    @Override
    public List<Stuinfo> queryStuList(Stuinfo stuinfo) {
        return stuinfoMapper.selectclassmember(stuinfo);
    }

    @Override
    public List<Stuinfo> queryClassmanagerList(Stuinfo stuinfo) {
        return stuinfoMapper.selectclassmanager(stuinfo);
    }

    @Override
    public List<Stuinfo> queryStuListByOthers(Stuinfo stuinfo) {
        return stuinfoMapper.selectstuByOthers(stuinfo);
    }

    @Override
    public List<Stuinfo> queryManageListByOthers(Stuinfo stuinfo) {
        return stuinfoMapper.selectmanagerByOthers(stuinfo);
    }

    @Override
    public boolean updateStu(Stuinfo stuinfo) {
        if(stuinfo==null)
            return false;
        stuinfoMapper.updateByPrimaryKeySelective(stuinfo);
        return true;
    }

    @Override
    public Stuinfo addStu(Stuinfo stuinfo) {
        return null;
    }

    @Override
    public boolean deletStu(Stuinfo stuinfo) {
        return false;
    }
}
