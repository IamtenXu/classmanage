package xin.iamten.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.iamten.dao.WorkMapper;
import xin.iamten.entity.PracticeAnalysis;
import xin.iamten.entity.Work;
import xin.iamten.service.WorkService;

import java.util.List;

@Service
public class WorkServiceImpl implements WorkService {

    @Autowired
    private WorkMapper workMapper;

    @Override
    public Work queryOne(String stuid) {
        return workMapper.selectByPrimaryKey(stuid);
    }

    @Override
    public int insertOnr(Work work) {
        return workMapper.insertSelective(work);
    }

    @Override
    public int updateOne(Work work) {
        return workMapper.updateByPrimaryKeySelective(work);
    }

    @Override
    public List<Work> queryList(String classid) {
        return workMapper.selectByclassid(classid);
    }

    @Override
    public List<PracticeAnalysis> queryListPAnalysis(String classid) {
        return workMapper.selectWorkAnalysis(classid);
    }
}
