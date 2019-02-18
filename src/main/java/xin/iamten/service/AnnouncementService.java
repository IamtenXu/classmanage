package xin.iamten.service;

import xin.iamten.entity.Announcement;

import java.util.List;

public interface AnnouncementService {
    List<Announcement> queryByClass(String classid);

    List<Announcement> queryByTea(String classid);

    List<Announcement> queryBypublishTea(String publisher);

    List<Announcement> queryBypublishStu(String publisher);


    List<Announcement> queryByHead(String sclass);

    boolean delById(Integer id);

    boolean update(Announcement announcement);

    Announcement queryByid(Integer id);

    boolean publish(Announcement announcement);
}
