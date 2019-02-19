package xin.iamten.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xin.iamten.dao.AreaMapper;
import xin.iamten.dao.CityMapper;
import xin.iamten.dao.ProvinceMapper;
import xin.iamten.entity.Area;
import xin.iamten.entity.City;
import xin.iamten.entity.Province;
import xin.iamten.service.CityService;

import java.util.List;
@Service
public class CityServiceImpl implements CityService {

    @Autowired
    private ProvinceMapper provinceMapper;

    @Autowired
    private CityMapper cityMapper;

    @Autowired
    private AreaMapper areaMapper;


    @Override
    public List<Province> queryAllProvince() {
        return provinceMapper.selectAll();
    }

    @Override
    public List<City> queryCityByProvince(String provincecode) {
        return cityMapper.selectByProvince(provincecode);
    }

    @Override
    public List<Area> queryAreaByCity(String citycode) {
        return areaMapper.selectByCity(citycode);
    }
}
