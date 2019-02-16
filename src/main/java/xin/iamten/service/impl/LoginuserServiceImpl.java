package xin.iamten.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.iamten.dao.LoginuserMapper;
import xin.iamten.entity.Loginuser;
import xin.iamten.service.LoginuserService;

@Service
public class LoginuserServiceImpl implements LoginuserService {

    @Autowired
    private LoginuserMapper loginuserMapper;


    @Override
    public Loginuser queryLoginuser(Loginuser loginuser) {
        return loginuserMapper.selectByPrimaryKey(loginuser.getUsername());
    }

    @Override
    public boolean updateLoginuser(Loginuser loginuser) {
        if(loginuser==null)
            return false;
        loginuserMapper.updateByPrimaryKeySelective(loginuser);
        return true;
    }

    @Override
    public boolean insertLoginuser(Loginuser loginuser) {
        if(loginuser==null)
            return false;
        loginuserMapper.insertSelective(loginuser);
        return true;
    }
}
