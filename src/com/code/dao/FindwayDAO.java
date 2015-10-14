package com.code.dao;

import com.code.bean.FindwayBean;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/14.
 */
public interface FindwayDAO {
    public FindwayBean getFindwayById(int id);

    public ArrayList<FindwayBean> getAllFindways();
}
