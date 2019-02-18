package xin.iamten.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xin.iamten.entity.Announcement;
import xin.iamten.service.AnnouncementService;
import xin.iamten.utils.R;

import java.util.List;

@Controller
@RequestMapping("/announcement")
public class AnnouncementController {

    @Autowired
    private AnnouncementService announcementService;

    //班级通知
    @RequestMapping(value = "/announcementClass", method = RequestMethod.GET)
    @ResponseBody
    public R announcementList(@RequestParam String sclass) {
        List<Announcement> announcements = announcementService.queryByClass(sclass);
        return R.ok().put("data",announcements);
    }
    //单个通知
    @RequestMapping(value = "/announcementById", method = RequestMethod.POST)
    @ResponseBody
    public R announcementById(@RequestParam Integer id) {
        Announcement announcement = announcementService.queryByid(id);
        return R.ok().put("announcement",announcement);
    }
    //辅导员/班主任通知
    @RequestMapping(value = "/announcementTea", method = RequestMethod.GET)
    @ResponseBody
    public R announcementTea(@RequestParam String sclass) {
        List<Announcement> announcements = announcementService.queryByTea(sclass);
        return R.ok().put("data",announcements);
    }
    //班主任通知
    @RequestMapping(value = "/announcementHead", method = RequestMethod.GET)
    @ResponseBody
    public R announcementHead(@RequestParam String sclass) {
        List<Announcement> announcements = announcementService.queryByHead(sclass);
        return R.ok().put("data",announcements);
    }
    //辅导员已发布通知
    @RequestMapping(value = "/Teaannouncement", method = RequestMethod.GET)
    @ResponseBody
    public R Teaannouncement(@RequestParam String publisher) {
        List<Announcement> announcements = announcementService.queryBypublishTea(publisher);
        return R.ok().put("data",announcements);
    }
    //辅导员已发布通知
    @RequestMapping(value = "/Stuannouncement", method = RequestMethod.GET)
    @ResponseBody
    public R Stuannouncement(@RequestParam String publisher) {
        List<Announcement> announcements = announcementService.queryBypublishStu(publisher);
        return R.ok().put("data",announcements);
    }
    //辅导员删除已发布的通知
    @RequestMapping(value = "/deletAnnouncement", method = RequestMethod.POST)
    @ResponseBody
    public R deletAnnouncement(@RequestParam Integer id) {
        announcementService.delById(id);
        return R.ok();
    }
    //辅导员修改已发布的通知
    @RequestMapping(value = "/updateAnnouncement", method = RequestMethod.POST)
    @ResponseBody
    public R updateAnnouncement(@RequestParam Integer id,@RequestParam String title,@RequestParam String text,@RequestParam String atime) {
        Announcement announcement = new Announcement();
        announcement.setId(id);
        announcement.setTitle(title);
        announcement.setText(text);
        announcement.setAtime(atime);
        announcementService.update(announcement);
        return R.ok();
    }
    //发布通知
    @RequestMapping(value = "/publishAnnouncement", method = RequestMethod.POST)
    @ResponseBody
    public R publishAnnouncement(@RequestParam String title,@RequestParam String text,@RequestParam String atime,@RequestParam String publisher) {
        Announcement announcement = new Announcement();
        announcement.setTitle(title);
        announcement.setText(text);
        announcement.setAtime(atime);
        announcement.setPublisher(publisher);
        if (publisher.length()==8){
            announcement.setAtype("2");
        }else if(publisher.length()==5){
            announcement.setAtype("1");
        }
        if(announcementService.publish(announcement)){
            return R.ok();
        }else{
            return R.error();
        }
    }


}
