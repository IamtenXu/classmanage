package xin.iamten.service;

import xin.iamten.entity.Area;
import xin.iamten.entity.City;
import xin.iamten.entity.Province;

import java.util.List;

public interface CityService {

    List<Province> queryAllProvince();

    List<City> queryCityByProvince(String provincecode);

    List<Area> queryAreaByCity(String citycode);
}
