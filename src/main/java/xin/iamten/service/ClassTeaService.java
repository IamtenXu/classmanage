package xin.iamten.service;

import xin.iamten.entity.Classinfo;
import xin.iamten.entity.Teainfo;
import xin.iamten.utils.ClassTea;

public interface ClassTeaService {

    ClassTea setClassTea(Classinfo classinfo, Teainfo instructor,Teainfo headmaster);

}
