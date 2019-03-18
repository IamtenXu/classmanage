package xin.iamten.entity;

public class Practice {
    private String stuid;

    private String company;

    private String starttime;

    private String endtime;

    private String isrent;

    private String address;

    private Stuinfo stuinfo;

    public Stuinfo getStuinfo() {
        return stuinfo;
    }

    public void setStuinfo(Stuinfo stuinfo) {
        this.stuinfo = stuinfo;
    }

    public String getStuid() {
        return stuid;
    }

    public void setStuid(String stuid) {
        this.stuid = stuid;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
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

    public String getIsrent() {
        return isrent;
    }

    public void setIsrent(String isrent) {
        this.isrent = isrent;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}