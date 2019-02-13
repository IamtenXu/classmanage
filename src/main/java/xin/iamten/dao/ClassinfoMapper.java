package xin.iamten.dao;

import org.apache.ibatis.annotations.Param;
import xin.iamten.entity.Classinfo;

import java.util.List;

public interface ClassinfoMapper {
    int deleteByPrimaryKey(String classid);

    int insert(Classinfo record);

    int insertSelective(Classinfo record);

    Classinfo selectByPrimaryKey(String classid);

    Classinfo selectByHeadmaster(String headmaster);

    List<Classinfo> selectByInstructor(String instructor);

    int updateByPrimaryKeySelective(Classinfo record);

    int updateByPrimaryKey(Classinfo record);

    List<Classinfo> selectAllCollege();
    List<Classinfo> selectMajorByCollege(String college);
    List<Classinfo> selectGradeByMajor(String major);
    List<Classinfo> selectClassByGradeAndMajor(@Param("cgrade")String cgrade,@Param("major")String major);


}