package xin.iamten.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.iamten.dao.PracticeMapper;
import xin.iamten.entity.Practice;
import xin.iamten.service.PracticeService;

@Service
public class PracticeServiceImpl implements PracticeService {

    @Autowired
    private PracticeMapper practiceMapper;

    @Override
    public int insertOne(Practice practice) {
        return practiceMapper.insertSelective(practice);
    }

    @Override
    public Practice queryOne(String stuid) {
        return practiceMapper.selectByPrimaryKey(stuid);
    }

    @Override
    public boolean updateOne(Practice practice) {
        if(practice == null){
            return false;
        }
        practiceMapper.updateByPrimaryKeySelective(practice);
        return true;
    }
}
