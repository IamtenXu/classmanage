package xin.iamten.service;

import xin.iamten.entity.Announcement;

import java.util.List;

public interface AnnouncementService {
    List<Announcement> queryByClass(String classid);

    List<Announcement> queryByTea(String classid);

    List<Announcement> queryBypublish(String publisher);
}
