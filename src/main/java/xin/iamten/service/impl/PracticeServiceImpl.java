package xin.iamten.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.iamten.dao.PracticeMapper;
import xin.iamten.entity.Practice;
import xin.iamten.entity.PracticeAnalysis;
import xin.iamten.service.PracticeService;

import java.util.List;

@Service
public class PracticeServiceImpl implements PracticeService {

    @Autowired
    private PracticeMapper practiceMapper;

    @Override
    public int insertOneP(Practice practice) {
        return practiceMapper.insertSelective(practice);
    }

    @Override
    public Practice queryOneP(String stuid) {
        return practiceMapper.selectByPrimaryKey(stuid);
    }

    @Override
    public boolean updateOneP(Practice practice) {
        if(practice == null){
            return false;
        }
        practiceMapper.updateByPrimaryKeySelective(practice);
        return true;
    }
    @Override
    public List<Practice> queryListP(String classid){
        return practiceMapper.selectByClassid(classid);
    }

    @Override
    public List<PracticeAnalysis> queryListPAnalysis(String classid) {
        return practiceMapper.selectPracticeAnalysis(classid);
    }
}
