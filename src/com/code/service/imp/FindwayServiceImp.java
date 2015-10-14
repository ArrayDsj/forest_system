package com.code.service.imp;

import com.code.bean.FindwayBean;
import com.code.dao.FindwayDAO;
import com.code.dao.imp.FindwayDAOImp;
import com.code.service.FindwayService;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/15.
 */
public class FindwayServiceImp implements FindwayService {
    @Override
    public ArrayList<FindwayBean> getAllFindways() {
        FindwayDAO findwayDAO = new FindwayDAOImp();

        return findwayDAO.getAllFindways();
    }
}
