package com.code.service;

import com.code.bean.ConferBean;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/17.
 */
public interface ConferService {
    public ArrayList<ConferBean> getConferById(int id);
    public boolean addConfer(ConferBean conferBean);
}
