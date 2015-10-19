package com.code.servlet.thingservlet;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by CodeA on 2015/10/19.
 */
public class thingUpload extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");

        /*****************************************************************************************/
        String realDir  = req.getSession().getServletContext().getRealPath("");
        String contextpath = req.getContextPath();
        String basePath = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + contextpath + "/";

        try {
            String filePath = "uploadfiles";
            String realPath = realDir + "\\" + filePath;
            //判断路径是否存在，不存在则创建
            File dir = new File(realPath);
            if (!dir.isDirectory()) dir.mkdir();

            if (ServletFileUpload.isMultipartContent(req)) {

                DiskFileItemFactory dff = new DiskFileItemFactory();
                dff.setRepository(dir);
                dff.setSizeThreshold(1024000);
                ServletFileUpload sfu = new ServletFileUpload(dff);
                FileItemIterator fii = null;
                fii = sfu.getItemIterator(req);
                String title = "";   //图片标题
                String url = "";    //图片地址
                String fileName = "";
                String state = "SUCCESS";
                String realFileName = "";
                while (fii.hasNext()) {
                    FileItemStream fis = fii.next();

                    try {
                        if (!fis.isFormField() && fis.getName().length() > 0) {
                            fileName = fis.getName();
                            Pattern reg = Pattern.compile("[.]jpg|png|jpeg|gif$");
                            Matcher matcher = reg.matcher(fileName);
                            if (!matcher.find()) {
                                state = "文件类型不允许！";
                                break;
                            }
                            realFileName = new Date().getTime() + fileName.substring(fileName.lastIndexOf("."), fileName.length());
                            url = realPath + "\\" + realFileName;

                            BufferedInputStream in = new BufferedInputStream(fis.openStream());//获得文件输入流
                            FileOutputStream a = new FileOutputStream(new File(url));
                            BufferedOutputStream output = new BufferedOutputStream(a);
                            Streams.copy(in, output, true);//开始把文件写到你指定的上传文件夹
                        } else {
                            String fname = fis.getFieldName();

                            if (fname.indexOf("pictitle") != -1) {
                                BufferedInputStream in = new BufferedInputStream(fis.openStream());
                                byte c[] = new byte[10];
                                int n = 0;
                                while ((n = in.read(c)) != -1) {
                                    title = new String(c, 0, n);
                                    break;
                                }
                            }
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                resp.setStatus(200);
                String retxt = "{src:'" + basePath + filePath + "/" + realFileName + "',status:success}";
                resp.getWriter().print(retxt);
            }
        } catch (Exception ee) {
            ee.printStackTrace();
        }

        ////返回结果
        //JSONObject obj = new JSONObject();
        //obj.put("fileName", fileName);
        //resp.getWriter().print(obj.toJSONString());
    }


    //@Override
    //protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    //    // TODO Auto-generated method stub
    //    SmartUpload su = new SmartUpload();
    //    //初始化上传(必须)
    //    su.initialize(this.getServletConfig(), req, resp);
    //
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
    //    String name2 = new String(su.getRequest().getParameter("flag").getBytes(), "utf-8");
    //    System.out.println(name2);
    //
    //    for (int i = 0; i < su.getFiles().getCount(); i++) {
    //        com.jspsmart.upload.File file = su.getFiles().getFile(i);
    //        if (file.isMissing()) continue;
    //        //定义上传后另存为的文件名
    //        String filename = i + "." + file.getFileExt();
    //        //文件另存为
    //        try {
    //            file.saveAs("/upload1/" + filename);
    //        } catch (SmartUploadException e) {
    //            // TODO Auto-generated catch block
    //            e.printStackTrace();
    //        }
    //    }
    //}
}
