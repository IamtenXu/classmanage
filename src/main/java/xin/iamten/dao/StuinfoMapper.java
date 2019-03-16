package xin.iamten.dao;

import xin.iamten.entity.Stuinfo;

import java.util.List;

public interface StuinfoMapper {
    int deleteByPrimaryKey(String stuid);

    int insert(Stuinfo record);

    int insertforeach(List<Stuinfo> list);

    int insertSelective(Stuinfo record);

    Stuinfo selectByPrimaryKey(String stuid);

    Stuinfo selectByClassRole(Stuinfo stuinfo);

    int updateByPrimaryKeySelective(Stuinfo record);

    int updateByPrimaryKey(Stuinfo record);

    List<Stuinfo> selectclassmanager(Stuinfo record);

    List<Stuinfo> selectclassmember(Stuinfo record);

    List<Stuinfo> selectstuByOthers(Stuinfo record);

    List<Stuinfo> selectmanagerByOthers(Stuinfo record);

    List<Stuinfo> selectAll();


}