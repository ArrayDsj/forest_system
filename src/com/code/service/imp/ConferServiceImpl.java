package com.code.service.imp;

import com.code.bean.ConferBean;
import com.code.dao.ConferDAO;
import com.code.dao.imp.ConferDAOImp;
import com.code.service.ConferService;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/17.
 */
public class ConferServiceImpl implements ConferService {
    @Override
    public ArrayList<ConferBean> getConferById(int id) {
        ConferDAO conferDAO = new ConferDAOImp();

        return conferDAO.getConferById(id);
    }

    @Override
    public boolean addConfer(ConferBean conferBean) {
        ConferDAO conferDAO = new ConferDAOImp();

        return conferDAO.addConfer(conferBean);
    }
}
