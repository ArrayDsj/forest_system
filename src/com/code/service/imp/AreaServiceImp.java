package com.code.service.imp;

import com.code.bean.AreaBean;
import com.code.dao.AreaDAO;
import com.code.dao.imp.AreaDAOImp;
import com.code.service.AreaService;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/11.
 */
public class AreaServiceImp implements AreaService{
    @Override
    public boolean addArea(AreaBean areaBean) {
        AreaDAO areaDao = new AreaDAOImp();
        return areaDao.addArea(areaBean);
    }

    //得到条件分页数据
    @Override
    public ArrayList<AreaBean> getLimitData(String queryType, String queryStr, int pageNow, int pageSize) {
        AreaDAO areaDao = new AreaDAOImp();
        return areaDao.getAreasByCondition(queryType, queryStr, pageNow, pageSize);
    }

    //得到初始分页数据
    @Override
    public ArrayList<AreaBean> getInitData(int pageNow, int pageSize){
        AreaDAO areaDao = new AreaDAOImp();
        return areaDao.getAreas(pageNow, pageSize);
    }

    @Override
    public int getCounts() {
        AreaDAO areaDao = new AreaDAOImp();
        return areaDao.getCounts();
    }

    @Override
    public int getCountsByCondition(String queryType, String queryStr) {
        AreaDAO areaDao = new AreaDAOImp();
        return areaDao.getCountsByCondition(queryType, queryStr);
    }

    @Override
    public ArrayList<AreaBean> getAreas() {
        AreaDAO areaDao = new AreaDAOImp();
        return areaDao.getAreasByClass();
    }

    @Override
    public ArrayList<AreaBean> getAllAreas(){
        AreaDAO areaDao = new AreaDAOImp();
        return areaDao.getAllAreas();
    }

    @Override
    public AreaBean getAreaById(int fk_class) {
        AreaDAO areaDao = new AreaDAOImp();
        return areaDao.getAreaById(fk_class);
    }

}
