package xin.iamten.service;

import xin.iamten.entity.Loginuser;

public interface LoginuserService {

    Loginuser queryLoginuser(Loginuser loginuser);

    boolean updateLoginuser(Loginuser loginuser);

    boolean insertLoginuser(Loginuser loginuser);

}
