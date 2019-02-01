package xin.iamten.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.iamten.dao.ClassinfoMapper;
import xin.iamten.entity.Classinfo;
import xin.iamten.service.ClassService;

@Service
public class ClassServiceImpl implements ClassService {

    @Autowired
    private ClassinfoMapper classinfoMapper;

    @Override
    public Classinfo queryClassinfo(String classsid) {
        return classinfoMapper.selectByPrimaryKey(classsid);
    }
}