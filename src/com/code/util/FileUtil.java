package com.code.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 * Created by CodeA on 2015/10/13.
 */
public class FileUtil {
    private String path;
    private File   file;
    private static Properties pro;

    public FileUtil() {
        pro = new Properties();
        try {
            pro.load(new FileInputStream(path));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static int getPageSize(){
        int pageSize = Integer.parseInt(pro.getProperty("pageSize"));
        return pageSize;
    }
}
