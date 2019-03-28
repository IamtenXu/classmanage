package xin.iamten.entity;

public class Work {
    private String stuid;

    private Short status;

    private String company;

    private Stuinfo stuinfo;

    public String getStuid() {
        return stuid;
    }

    public void setStuid(String stuid) {
        this.stuid = stuid;
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public Stuinfo getStuinfo() {
        return stuinfo;
    }

    public void setStuinfo(Stuinfo stuinfo) {
        this.stuinfo = stuinfo;
    }
}