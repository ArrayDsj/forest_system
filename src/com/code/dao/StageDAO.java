package com.code.dao;

import com.code.bean.StageBean;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/14.
 */
public interface StageDAO {
    public StageBean getStageById(int id);

    public ArrayList<StageBean> getAllStages();
}
