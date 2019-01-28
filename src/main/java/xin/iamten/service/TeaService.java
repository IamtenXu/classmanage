package xin.iamten.service;

import xin.iamten.entity.Teainfo;

import java.util.List;

public interface TeaService {

    Teainfo queryTea(Teainfo teainfo);

    List<Teainfo> queryTeaList(Teainfo teainfo);

    boolean updateTea(Teainfo teainfo);

    Teainfo addTea(Teainfo teainfo);

    boolean deletTea(Teainfo teainfo);

}
