package xin.iamten.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.iamten.entity.Classinfo;
import xin.iamten.entity.Teainfo;
import xin.iamten.service.ClassTeaService;
import xin.iamten.utils.ClassTea;

@Service
public class ClassTeaServiceImpl implements ClassTeaService {

    @Override
    public ClassTea setClassTea(Classinfo classinfo, Teainfo instructor, Teainfo headmaster) {
        ClassTea classTea = new ClassTea();
        classTea.setClassid(classinfo.getClassid());
        classTea.setCcollege(classinfo.getCcollege());
        classTea.setMajor(classinfo.getMajor());
        classTea.setCgrade(classinfo.getCgrade());
        classTea.setInstructor(classinfo.getInstructor());
        classTea.setInstructorname(instructor.getTname());
        classTea.setInstructorphone(instructor.getTphone());
        classTea.setInstructoraddress(instructor.getTaddress());
        classTea.setHeadmaster(classinfo.getHeadmaster());
        classTea.setHeadmastername(headmaster.getTname());
        classTea.setHeadmasterphone(headmaster.getTphone());
        classTea.setHeadmasteraddress(headmaster.getTaddress());
        return classTea;
    }
}
