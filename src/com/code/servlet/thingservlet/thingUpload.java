package com.code.servlet.thingservlet;

import com.code.bean.*;
import com.code.dao.ThingDAO;
import com.code.dao.imp.ThingDAOImp;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by CodeA on 2015/10/19.
 *
 */
public class thingUpload extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    //@Override
    //protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    //    resp.setContentType("text/html");
    //    resp.setCharacterEncoding("UTF-8");
    //
    //    /*****************************************************************************************/
    //    String realDir  = req.getSession().getServletContext().getRealPath("");
    //    String contextpath = req.getContextPath();
    //    String basePath = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + contextpath + "/";
    //
    //    try {
    //        String filePath = "uploadfiles";
    //        String realPath = realDir + "\\" + filePath;
    //        //判断路径是否存在，不存在则创建
    //        File dir = new File(realPath);
    //        if (!dir.isDirectory()) dir.mkdir();
    //
    //        if (ServletFileUpload.isMultipartContent(req)) {
    //
    //            DiskFileItemFactory dff = new DiskFileItemFactory();
    //            dff.setRepository(dir);
    //            dff.setSizeThreshold(1024000);
    //            ServletFileUpload sfu = new ServletFileUpload(dff);
    //            FileItemIterator fii = null;
    //            fii = sfu.getItemIterator(req);
    //            String title = "";   //图片标题
    //            String url = "";    //图片地址
    //            String fileName = "";
    //            String state = "SUCCESS";
    //            String realFileName = "";
    //            while (fii.hasNext()) {
    //                FileItemStream fis = fii.next();
    //
    //                try {
    //                    if (!fis.isFormField() && fis.getName().length() > 0) {
    //                        fileName = fis.getName();
    //                        Pattern reg = Pattern.compile("[.]jpg|png|jpeg|gif$");
    //                        Matcher matcher = reg.matcher(fileName);
    //                        if (!matcher.find()) {
    //                            state = "文件类型不允许！";
    //                            break;
    //                        }
    //                        realFileName = new Date().getTime() + fileName.substring(fileName.lastIndexOf("."), fileName.length());
    //                        url = realPath + "\\" + realFileName;
    //
    //                        BufferedInputStream in = new BufferedInputStream(fis.openStream());//获得文件输入流
    //                        FileOutputStream a = new FileOutputStream(new File(url));
    //                        BufferedOutputStream output = new BufferedOutputStream(a);
    //                        Streams.copy(in, output, true);//开始把文件写到你指定的上传文件夹
    //                    } else {
    //                        String fname = fis.getFieldName();
    //
    //                        if (fname.indexOf("pictitle") != -1) {
    //                            BufferedInputStream in = new BufferedInputStream(fis.openStream());
    //                            byte c[] = new byte[10];
    //                            int n = 0;
    //                            while ((n = in.read(c)) != -1) {
    //                                title = new String(c, 0, n);
    //                                break;
    //                            }
    //                        }
    //                    }
    //
    //                } catch (Exception e) {
    //                    e.printStackTrace();
    //                }
    //            }
    //            resp.setStatus(200);
    //            String retxt = "{src:'" + basePath + filePath + "/" + realFileName + "',status:success}";
    //            resp.getWriter().print(retxt);
    //        }
    //    } catch (Exception ee) {
    //        ee.printStackTrace();
    //    }
    //
    //    ////返回结果
    //    //JSONObject obj = new JSONObject();
    //    //obj.put("fileName", fileName);
    //    //resp.getWriter().print(obj.toJSONString());
    //}


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //// TODO Auto-generated method stub
        SmartUpload su = new SmartUpload();
        //初始化上传(必须)
        su.initialize(this.getServletConfig(), req, resp);
        //定义允许上传文件类型
        su.setAllowedFilesList("gif,jpg,JPG,png");
        //不允许上传文件类型
        //su.setDeniedFilesList("jsp,asp,php,aspx,html.htm");
        //单个文件最大限制(-1代表不限制)
        //su.setMaxFileSize(1024000);
        //总共上传文件限制
        //su.setTotalMaxFileSize(5000000);
        try {
            su.upload();
        } catch (SmartUploadException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String filename = null;
        for (int i = 0; i < su.getFiles().getCount(); i++) {
            com.jspsmart.upload.File file = su.getFiles().getFile(i);
            if (file.isMissing()) continue;
            //定义上传后另存为的文件名
             filename = Math.random()*100 + "." + file.getFileExt();
            //文件另存为
            try {
                file.saveAs("/upload/images/thing/" + filename);
            } catch (SmartUploadException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        //    //添加数据
            ThingBean thingBean = new ThingBean();
            String name = URLDecoder.decode(su.getRequest().getParameter("name"),"utf-8");
            thingBean.setName(name);
            thingBean.setPhotoPath(filename);

        //    //添加时间
            String foundDay = su.getRequest().getParameter("foundDay");
            //字符串转Date
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟
            Date date = new Date();
            try {
                date = sdf.parse(foundDay);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            thingBean.setFoundDay(date);


            String descript = URLDecoder.decode(su.getRequest().getParameter("descript"), "utf-8");
            System.out.println(descript);
            thingBean.setDescription(descript);
            String loss = URLDecoder.decode(su.getRequest().getParameter("loss"), "utf-8");
            thingBean.setLoss(loss);
            String proportion = URLDecoder.decode(su.getRequest().getParameter("proportion"), "utf-8");
            thingBean.setProportion(proportion);
            String scheme = URLDecoder.decode(su.getRequest().getParameter("scheme"), "utf-8");

            thingBean.setScheme(scheme);

            int stageID = Integer.parseInt(su.getRequest().getParameter("stageDataHidden"));
            StageBean stageBean = new StageBean();
            stageBean.setId(stageID);

            //转换
            String str = su.getRequest().getParameter("areaDataHidden");
            String[] strArr = str.split("&");
            str = strArr[0];
            int areaDataID = Integer.parseInt(str);

            AreaBean areaBean = new AreaBean();
            areaBean.setId(areaDataID);
            int findwayDataID = Integer.parseInt(su.getRequest().getParameter("findwayDataHidden"));
            FindwayBean findwayBean = new FindwayBean();
            findwayBean.setId(findwayDataID);
            int disasterDataID = Integer.parseInt(su.getRequest().getParameter("disasterDataHidden"));
            DisasterBean disasterBean = new DisasterBean();
            disasterBean.setId(disasterDataID);
            thingBean.setStage(stageBean);
            thingBean.setAreaBean(areaBean);
            thingBean.setDisasterType(disasterBean);
            thingBean.setFindWay(findwayBean);
            //写数据库
            System.out.println("写数据库");
            ThingDAO thingDAO = new ThingDAOImp();
            thingDAO.addThing(thingBean);



        //在thingAdd.jsp中点击确认添加按钮时调用
        //    System.out.println("添加方法");
        //    SmartUpload su = new SmartUpload();
        //    //初始化上传(必须)
        //    su.initialize(this.getServletConfig(), req, resp);
        //    //定义允许上传文件类型
        //    su.setAllowedFilesList("gif,jpg,JPG");
        //    //不允许上传文件类型
        //    //su.setDeniedFilesList("jsp,asp,php,aspx,html.htm");
        //    //单个文件最大限制(-1代表不限制)
        //    //su.setMaxFileSize(1024000);
        //    //总共上传文件限制
        //    //su.setTotalMaxFileSize(5000000);
        //    try {
        //        su.upload();
        //    } catch (SmartUploadException e) {
        //        // TODO Auto-generated catch block
        //        e.printStackTrace();
        //    }
        //    //添加数据
        //    ThingBean thingBean = new ThingBean();
        //    String name = su.getRequest().getParameter("name");
        //    thingBean.setName(name);
        //
        //    //添加时间
        //    String foundDay = su.getRequest().getParameter("foundDay");
        //    //字符串转Date
        //    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟
        //    Date date = new Date();
        //    try {
        //        date = sdf.parse(foundDay);
        //    } catch (ParseException e) {
        //        e.printStackTrace();
        //    }
        //    thingBean.setFoundDay(date);
        //
        //    /*************************************************************/
        //    //上传后保存在数据库中的路径
        //    String inputImgPath = "";
        //    String filename = null;
        //    //文件上传
        //    for (int i = 0; i < su.getFiles().getCount(); i++) {
        //        com.jspsmart.upload.File file = su.getFiles().getFile(i);
        //        if (file.isMissing()) continue;
        //        //定义上传后另存为的文件名
        //        filename = i + "." + file.getFileExt();
        //        //文件另存为
        //        try {
        //            file.saveAs("/upload1/" + filename);
        //            filename += "&";
        //        } catch (SmartUploadException e) {
        //            // TODO Auto-generated catch block
        //            e.printStackTrace();
        //        }
        //    }
        //    inputImgPath = "/upload/" + filename;
        //    thingBean.setPhotoPath(inputImgPath);
        //
        //    /*************************************************************/
        //
        //    String descript = su.getRequest().getParameter("descript");
        //    System.out.println(descript);
        //    thingBean.setDescription(descript);
        //    String loss = su.getRequest().getParameter("loss");
        //    thingBean.setLoss(loss);
        //    String proportion = su.getRequest().getParameter("proportion");
        //    thingBean.setProportion(proportion);
        //    String scheme = su.getRequest().getParameter("scheme");
        //    thingBean.setScheme(scheme);
        //
        //    int stageID = Integer.parseInt(su.getRequest().getParameter("stageDataHidden"));
        //    StageBean stageBean = new StageBean();
        //    stageBean.setId(stageID);
        //
        //    //转换
        //    String str = su.getRequest().getParameter("areaDataHidden");
        //    String[] strArr = str.split("&");
        //    str = strArr[0];
        //    int areaDataID = Integer.parseInt(str);
        //
        //    AreaBean areaBean = new AreaBean();
        //    areaBean.setId(areaDataID);
        //    int findwayDataID = Integer.parseInt(su.getRequest().getParameter("findwayDataHidden"));
        //    FindwayBean findwayBean = new FindwayBean();
        //    findwayBean.setId(findwayDataID);
        //    int disasterDataID = Integer.parseInt(su.getRequest().getParameter("disasterDataHidden"));
        //    DisasterBean disasterBean = new DisasterBean();
        //    disasterBean.setId(disasterDataID);
        //    thingBean.setStage(stageBean);
        //    thingBean.setAreaBean(areaBean);
        //    thingBean.setDisasterType(disasterBean);
        //    thingBean.setFindWay(findwayBean);
        //    //写数据库
        //    System.out.println("写数据库");
        //    ThingDAO thingDAO = new ThingDAOImp();
        //    thingDAO.addThing(thingBean);

    }
}
