package com.code.service.imp;

import com.code.bean.DisasterBean;
import com.code.dao.DisasterDAO;
import com.code.dao.imp.DisasterDAOImp;
import com.code.service.DisasterService;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/15.
 */
public class DisasterServiceImp implements DisasterService {
    @Override
    public ArrayList<DisasterBean> getAllDisasterBean() {
        DisasterDAO disasterDAO = new DisasterDAOImp();

        return disasterDAO.getAllDisasterBean();
    }
}
