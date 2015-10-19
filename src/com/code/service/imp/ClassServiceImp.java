package com.code.service.imp;

import com.code.bean.ClassBean;
import com.code.dao.ClassDAO;
import com.code.dao.imp.ClassDAOImp;
import com.code.service.ClassService;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/13.
 */
public class ClassServiceImp implements ClassService {
    @Override
    public boolean addClass(ClassBean classBean) {
        ClassDAO classDAO = new ClassDAOImp();

        return classDAO.addClass(classBean);
    }

    @Override
    public ClassBean showClass(ClassBean classBean) {
        ClassDAO classDAO = new ClassDAOImp();
        return classDAO.showClass(classBean);
    }

    @Override
    public boolean updateClass(ClassBean classBean) {
        ClassDAO classDAO = new ClassDAOImp();
        return classDAO.updateClass(classBean);
    }

    @Override
    public int getCounts() {
        ClassDAO classDAO = new ClassDAOImp();

        return classDAO.getCounts();
    }

    @Override
    public int getCountsByCondition(String queryType, String queryStr) {
        ClassDAO classDAO = new ClassDAOImp();
        return classDAO.getCountsByCondition(queryType, queryStr);
    }

    //得到条件分页数据
    @Override
    public ArrayList<ClassBean> getLimitData(String queryType, String queryStr, int pageNow, int pageSize) {
        ClassDAO classDAO = new ClassDAOImp();
        //得到满足条件的总个数
        int counts = classDAO.getCountsByCondition(queryType, queryStr);
        if (counts != -1) {
            //得到满足条件的集合
            ArrayList<ClassBean> all = classDAO.getClassesByCondition(queryType, queryStr, pageNow, pageSize);
            //ClassBean classBean = new ClassBean();
            //classBean.setId(counts);
            //all.add(classBean);
            //这个集合的最后一个对象的中id就是总个数
            return all;
        }
        return null;
    }

    //得到初始分页数据
    @Override
    public ArrayList<ClassBean> getInitData(int pageNow, int pageSize) {
        ClassDAO classDAO = new ClassDAOImp();
        //1. 得到总记录数
        int counts = classDAO.getCounts();
        if (counts != 0) {
            //得到分页数据
            ArrayList<ClassBean> all = classDAO.getClasses(pageNow, pageSize);
            //最后一个是总记录条数
            //ClassBean classBean = new ClassBean();
            //classBean.setId(counts);
            //all.add(classBean);
            return all;
        }
        return null;
    }
}
