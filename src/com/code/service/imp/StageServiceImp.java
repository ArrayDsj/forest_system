package com.code.service.imp;

import com.code.bean.StageBean;
import com.code.dao.StageDAO;
import com.code.dao.imp.StageDAOImp;
import com.code.service.StageService;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/15.
 */
public class StageServiceImp implements StageService {
    @Override
    public ArrayList<StageBean> getAllStages() {
        StageDAO stageDAO = new StageDAOImp();
        return stageDAO.getAllStages();
    }
}
