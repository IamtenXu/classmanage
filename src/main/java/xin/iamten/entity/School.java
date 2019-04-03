package xin.iamten.entity;

public class School {
    private String stuid;

    private String status;

    private String school;

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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }
}