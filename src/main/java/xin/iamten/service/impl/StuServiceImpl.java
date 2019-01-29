package xin.iamten.service.impl;

import org.springframework.stereotype.Service;
import xin.iamten.entity.Stuinfo;
import xin.iamten.service.StuService;

import java.util.List;

@Service
public class StuServiceImpl implements StuService {
    @Override
    public Stuinfo queryStu(Stuinfo stuinfo) {
        return null;
    }

    @Override
    public List<Stuinfo> queryStuList(Stuinfo stuinfo) {
        return null;
    }

    @Override
    public boolean updateStu(Stuinfo stuinfo) {
        return false;
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
