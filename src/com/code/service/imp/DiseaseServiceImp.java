package com.code.service.imp;

import com.code.bean.DiseaseBean;
import com.code.dao.DiseaseDAO;
import com.code.dao.imp.DiseaseDAOImp;
import com.code.service.DiseaseService;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/20.
 */
public class DiseaseServiceImp implements DiseaseService {
    DiseaseDAO diseaseDAO = new DiseaseDAOImp();

    @Override
    public int getCounts() {
        return diseaseDAO.getCounts();
    }

    @Override
    public ArrayList<DiseaseBean> getAllDiseases(int pageNow, int pageSize) {
        return diseaseDAO.getAllDiseases(pageNow, pageSize);
    }

    @Override
    public int getCountsByCondtion(String query, String str) {
        return diseaseDAO.getCountsByCondtion(query, str);
    }

    @Override
    public ArrayList<DiseaseBean> getAllDiseasesByCondtion(String query, String str, int pageNow, int pageSize) {
        return diseaseDAO.getAllDiseasesByCondtion(query, str, pageNow, pageSize);
    }

    @Override
    public boolean addDisease(DiseaseBean diseaseBean) {

        return diseaseDAO.addDisease(diseaseBean);
    }

    @Override
    public DiseaseBean getDiseaseBeanByID(int id) {

        return diseaseDAO.getDiseaseBeanByID(id);
    }
}
