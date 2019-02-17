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

    @Override
    public List<Announcement> queryByHead(String sclass) {
        return announcementMapper.selectByHead(sclass);
    }

    @Override
    public boolean delById(Integer id) {
        announcementMapper.deleteByPrimaryKey(id);
        return true;
    }

    @Override
    public boolean update(Announcement announcement) {
        announcementMapper.updateByPrimaryKeySelective(announcement);
        return true;
    }

    @Override
    public Announcement queryByid(Integer id) {
        return announcementMapper.selectByPrimaryKey(id);
    }
}
