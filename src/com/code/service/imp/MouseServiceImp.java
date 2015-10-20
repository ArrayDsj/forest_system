package com.code.service.imp;

import com.code.bean.MouseBean;
import com.code.dao.MouseDAO;
import com.code.dao.imp.MouseDAOImp;
import com.code.service.MouseService;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/20.
 */
public class MouseServiceImp implements MouseService {
    MouseDAO mouseDAO = new MouseDAOImp();

    @Override
    public int getCounts() {

        return mouseDAO.getCounts();
    }

    @Override
    public ArrayList<MouseBean> getAllMouses(int pageNow, int pageSize) {
        return mouseDAO.getAllMouses(pageNow,pageSize);
    }


    @Override
    public int getCountsByCondtion(String query, String str) {
        return mouseDAO.getCountsByCondtion(query,str);
    }

    @Override
    public ArrayList<MouseBean> getAllMousesByCondtion(String query, String str, int pageNow, int pageSize) {
        return mouseDAO.getAllMousesByCondtion(query,str,pageNow,pageSize);
    }

    @Override
    public boolean addMouses(MouseBean mouseBean) {
        return mouseDAO.addMouses(mouseBean);
    }

    @Override
    public MouseBean getMouseBeanByID(int id) {
        return mouseDAO.getMouseBeanByID(id);
    }


}
