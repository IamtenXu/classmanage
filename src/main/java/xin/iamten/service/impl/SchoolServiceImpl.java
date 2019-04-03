package xin.iamten.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.iamten.dao.SchoolMapper;
import xin.iamten.entity.PracticeAnalysis;
import xin.iamten.entity.School;
import xin.iamten.service.SchoolService;

import java.util.List;

@Service
public class SchoolServiceImpl implements SchoolService {

    @Autowired
    private SchoolMapper schoolMapper;

    @Override
    public School queryOne(String stuid) {
        return schoolMapper.selectByPrimaryKey(stuid);
    }

    @Override
    public int insertOnr(School school) {
        return schoolMapper.insertSelective(school);
    }

    @Override
    public int updateOne(School school) {
        return schoolMapper.updateByPrimaryKeySelective(school);
    }

    @Override
    public List<School> queryList(String classid) {
        return schoolMapper.selectList(classid);
    }

    @Override
    public List<PracticeAnalysis> queryListPAnalysis(String classid) {
        return schoolMapper.selectSchoolAnalysis(classid);
    }
}
