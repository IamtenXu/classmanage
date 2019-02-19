package xin.iamten.entity;

public class Holiday {
    private Integer id;

    private String holidayname;

    private String starttime;

    private String endtime;

    private Boolean ison;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHolidayname() {
        return holidayname;
    }

    public void setHolidayname(String holidayname) {
        this.holidayname = holidayname;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public Boolean getIson() {
        return ison;
    }

    public void setIson(Boolean ison) {
        this.ison = ison;
    }
}