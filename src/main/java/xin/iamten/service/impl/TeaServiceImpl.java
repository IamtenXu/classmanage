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
    public Teainfo queryTea(Teainfo teainfo) {
        return teainfoMapper.selectByPrimaryKey(teainfo.getTeaid());
    }

    @Override
    public List<Teainfo> queryTeaList(Teainfo teainfo) {
        return null;
    }

    @Override
    public boolean updateTea(Teainfo teainfo) {
        return false;
    }

    @Override
    public Teainfo addTea(Teainfo teainfo) {
        return null;
    }

    @Override
    public boolean deletTea(Teainfo teainfo) {
        return false;
    }
}
