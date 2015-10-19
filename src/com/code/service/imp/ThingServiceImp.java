package com.code.service.imp;

import com.code.bean.ThingBean;
import com.code.dao.ThingDAO;
import com.code.dao.imp.ThingDAOImp;
import com.code.service.ThingService;

import java.util.ArrayList;
import java.util.Date;

/**
 * Created by CodeA on 2015/10/14.
 */
public class ThingServiceImp implements ThingService {
    @Override
    public int getCounts() {
        ThingDAO thingDAO = new ThingDAOImp();
        return thingDAO.getCounts();
    }

    @Override
    public ArrayList<ThingBean> getInitData(int pageNow, int pageSize) {
        ThingDAO thingDAO = new ThingDAOImp();
        return thingDAO.getThings(pageNow,pageSize);
    }

    @Override
    public int getCountsByCondtion(String queryType, String queryStr) {
        ThingDAO thingDAO = new ThingDAOImp();
        return thingDAO.getCountsByCondtion(queryType,queryStr);
    }

    @Override
    public ArrayList<ThingBean> getLimitData(String queryType, String queryStr, int pageNow, int pageSize) {
        ThingDAO thingDAO = new ThingDAOImp();
        return thingDAO.getThingsByCondtion(queryType, queryStr, pageNow, pageSize);
    }

    @Override
    public ThingBean getThingById(int id) {
        ThingDAO thingDAO = new ThingDAOImp();
        return thingDAO.getThingById(id);
    }

    @Override
    public boolean updateThing(ThingBean thingBean) {
        ThingDAO thingDAO = new ThingDAOImp();
        return thingDAO.updateThing(thingBean) == 1;
    }

    @Override
    public ArrayList<ThingBean> getAreasByTime(Date start, Date end, int pageNow, int pageSize) {
        ThingDAO thingDAO = new ThingDAOImp();
        return thingDAO.getAreaByTime(start, end,pageNow,pageSize);
    }

    @Override
    public int getCountsByTime(Date start, Date end) {
        ThingDAO thingDAO = new ThingDAOImp();
        return thingDAO.getCountsByTime(start, end);
    }
}
