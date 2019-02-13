package xin.iamten.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.iamten.dao.ClassinfoMapper;
import xin.iamten.entity.Classinfo;
import xin.iamten.service.ClassService;

import java.util.List;

@Service
public class ClassServiceImpl implements ClassService {

    @Autowired
    private ClassinfoMapper classinfoMapper;

    @Override
    public Classinfo queryClassinfo(String classsid) {
        return classinfoMapper.selectByPrimaryKey(classsid);
    }

    @Override
    public Classinfo queryClassinfoByHeadmaster(String headmaster) {
        return classinfoMapper.selectByHeadmaster(headmaster);
    }

    @Override
    public List<Classinfo> queryClassinfoByInstructor(String instructor) {
        return classinfoMapper.selectByInstructor(instructor);
    }

    @Override
    public List<Classinfo> queryAllcollege() {
        return classinfoMapper.selectAllCollege();
    }

    @Override
    public List<Classinfo> queryMajorByCollege(String college) {
        return classinfoMapper.selectMajorByCollege(college);
    }

    @Override
    public List<Classinfo> queryGradeByMajor(String major) {
        return classinfoMapper.selectGradeByMajor(major);
    }

    @Override
    public List<Classinfo> queryClassByGrade(String grade,String major) {
        return classinfoMapper.selectClassByGradeAndMajor(grade,major);
    }
}
