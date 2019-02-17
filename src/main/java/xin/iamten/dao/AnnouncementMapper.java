package xin.iamten.dao;

import xin.iamten.entity.Announcement;

import java.util.List;

public interface AnnouncementMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Announcement record);

    int insertSelective(Announcement record);

    Announcement selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Announcement record);

    int updateByPrimaryKey(Announcement record);

    List<Announcement> selectByClass(String sclass);

    List<Announcement> selectByTea(String sclass);

    List<Announcement> selectByPublisher(String publisher);

    List<Announcement> selectByHead(String sclass);
}