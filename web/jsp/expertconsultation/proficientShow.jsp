<!DOCTYPE html>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <meta charset = "UTF-8">
    <title>查看专家信息</title>
    <style type = "text/css">
        span {
            font-size: 16px;
        }
    </style>
</head>
<body>
<div id = "proficientInfoDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    查看专家信息
                </h3>
            </div>
        </div>
        <!--内容-->
        <div style = "margin-left:50px;margin-top: 10px">
            <div id = "left" style = "width: 370px;height: 390px;float: left">
                <!--第一行-->
                <div class = "row" style = "margin-top: 20px">
                    <span class = "col-lg-4  control-label ">姓名:</span>
                    <span class = "col-lg-4  control-label ">${pro.name}</span>
                </div>
                <!--第二行-->
                <div class = "row" style = "margin-top: 40px">
                    <span class = "col-lg-4  control-label ">出生年月:</span>
                    <span class = "col-lg-4  control-label ">${pro.birthday}</span>
                </div>
                <!--第三行-->
                <div class = "row" style = "margin-top: 40px">
                    <span class = "col-lg-4  control-label ">性别:</span>
                    <span class = "col-lg-4  control-label ">${pro.gender}</span>
                </div>
                <!--第四行-->
                <div class = "row" style = "margin-top: 40px">
                    <span class = "col-lg-4  control-label ">专长:</span>
                    <span class = "col-lg-4  control-label ">${pro.speciality}</span>
                </div>
                <!--第五行-->
                <div class = "row" style = "margin-top: 40px">
                    <span class = "col-lg-4  control-label ">电话:</span>
                    <span class = "col-lg-4  control-label ">${pro.phoneNumber}</span>
                </div>
                <!--第六行-->
                <div class = "row" style = "margin-top: 40px">
                    <span class = "col-lg-4  control-label ">通讯地址:</span>
                    <span class = "col-lg-4  control-label ">${pro.address}</span>
                </div>
            </div>
            <div id = "right" style = "width: 370px;height: 390px;float: left;margin-left: 10px">
                <!--第一行-->
                <div class = "row" style = "margin-top: 20px">
                    <span class = "col-lg-4  control-label ">照片:</span>
                    <img src = "image/8.jpg" />
                </div>
                <!--第二行-->
                <div class = "row" style = "margin-top: 40px">
                    <span class = "col-lg-4  control-label ">职务:</span>
                    <span class = "col-lg-4  control-label ">${pro.degree}</span>
                </div>
                <!--第三行-->
                <div class = "row" style = "margin-top: 40px">
                    <span class = "col-lg-4  control-label ">工作单位:</span>
                    <span class = "col-lg-4  control-label ">${pro.workUnit}</span>
                </div>
                <!--第四行-->
                <div class = "row" style = "margin-top: 40px">
                    <span class = "col-lg-4  control-label ">邮箱:</span>
                    <span class = "col-lg-4  control-label ">${pro.email}</span>
                </div>
            </div>
        </div>
        <!--foot-->
        <div id = "foot">
            <div class = "row">
                <div class = "form-group">
                    <div class = "col-sm-offset-5 col-sm-5" style = "margin-top:10px">
                        <button type = "submit" class = "btn btn-default" onclick = "return jump('#otherHtml','./ProficientQueryServlet.av','-1')">返回</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>