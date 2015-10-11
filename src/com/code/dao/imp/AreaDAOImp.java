package com.code.dao.imp;

import com.code.bean.AreaBean;
import com.code.dao.AreaDAO;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/11.
 */
public class AreaDAOImp implements AreaDAO{
    @Override
    public boolean addArea(AreaBean areaBean) {
        return false;
    }

    @Override
    public ArrayList<AreaBean> getAllAreas() {
        return null;
    }

    @Override
    public ArrayList<AreaBean> getAreasByCondition(String queryType, String queryStr, int pageNow) {
        return null;
    }

    @Override
    public int getAreasByCondition(String queryType, String queryStr) {
        return 0;
    }
}
