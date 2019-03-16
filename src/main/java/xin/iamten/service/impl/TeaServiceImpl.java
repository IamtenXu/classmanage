package xin.iamten.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.iamten.dao.TeainfoMapper;
import xin.iamten.entity.Teainfo;
import xin.iamten.service.TeaService;

import java.util.List;

@Service
public class TeaServiceImpl implements TeaService {

    @Autowired
    private TeainfoMapper teainfoMapper;

    @Override
    public int insertforeach(List<Teainfo> list) {
        return teainfoMapper.insertforeach(list);
    }

    @Override
    public Teainfo queryTea(Teainfo teainfo) {
        return teainfoMapper.selectByPrimaryKey(teainfo.getTeaid());
    }

    @Override
    public List<Teainfo> queryTeaList() {
        return teainfoMapper.selectAllTeainfo();
    }

    @Override
    public boolean updateTea(Teainfo teainfo) {
        if(teainfo==null)
            return false;
        teainfoMapper.updateByPrimaryKeySelective(teainfo);
        return true;
    }

    @Override
    public Teainfo addTea(Teainfo teainfo) {
        return null;
    }

    @Override
    public boolean deletTea(Teainfo teainfo) {
        return false;
    }

    @Override
    public List<Teainfo> queryTeaListByCollege(Teainfo teainfo) {
        return teainfoMapper.selectTeainfoByCollege(teainfo.getTcollege());
    }

    @Override
    public List<Teainfo> queryAllcollege() {
        return teainfoMapper.selectAllCollege();
    }
}
