package xin.iamten.entity;

public class Homeinfo {
    private String stuid;

    private String fname;

    private String fphone;

    private String mname;

    private String mphone;

    private String hadress;

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

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getFphone() {
        return fphone;
    }

    public void setFphone(String fphone) {
        this.fphone = fphone;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getMphone() {
        return mphone;
    }

    public void setMphone(String mphone) {
        this.mphone = mphone;
    }

    public String getHadress() {
        return hadress;
    }

    public void setHadress(String hadress) {
        this.hadress = hadress;
    }
}