package xin.iamten.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.iamten.dao.AnnouncementMapper;
import xin.iamten.entity.Announcement;
import xin.iamten.service.AnnouncementService;

import java.util.List;

@Service
public class AnnouncementServiceImpl implements AnnouncementService {

    @Autowired
    private AnnouncementMapper announcementMapper;

    @Override
    public List<Announcement> queryByClass(String classid) {
        return announcementMapper.selectByClass(classid);
    }

    @Override
    public List<Announcement> queryByTea(String classid) {
        return announcementMapper.selectByTea(classid);
    }

    @Override
    public List<Announcement> queryBypublish(String publisher) {
        return announcementMapper.selectByPublisher(publisher);
    }
}
