package com.code.dao;

import com.code.bean.DisasterBean;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/14.
 */
public interface DisasterDAO {
    public DisasterBean getStageById(int id);

    public ArrayList<DisasterBean> getAllDisasterBean();
}
