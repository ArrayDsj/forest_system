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

    @Override
    public ArrayList<AreaBean> getLimitData(String queryType, String queryStr, int pageNow) {
        AreaDAO areaDao = new AreaDAOImp();
        //得到满足条件的总个数
        int counts = areaDao.getAreasByCondition(queryType, queryStr);
        ArrayList<AreaBean> all = areaDao.getAreasByCondition(queryType, queryStr, pageNow);
        AreaBean areaBean = new AreaBean();
        areaBean.setId(counts);
        all.add(areaBean);
        //这个集合的最后一个对象的中id就是总个数
        return all;
    }
}
