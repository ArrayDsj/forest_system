<!DOCTYPE html>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<html>
<head>
    <meta charset = "UTF-8">
    <title>修改专家信息</title>
    <style type = "text/css">
        span {
            font-size: 16px;
        }
    </style>
</head>
<body>
<div id = "proficientUpdateDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    修改专家信息
                </h3>
            </div>
        </div>
        <!--内容-->
        <div style = "margin-left:50px;margin-top: 10px">
            <form class = "form-horizontal" role = "form" action = "javascript:void(0)" onsubmit = "jump(
            '#proficientUpdateDiv','html/proficientPanel.html')">
                <div id = "left" style = "width: 370px;height: 390px;float: left">
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px">
                        <span class = "col-lg-4  control-label ">姓名:</span>
                        <span class = "col-lg-4  control-label ">李鹏</span>
                    </div>
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 40px">
                        <span class = "col-lg-4  control-label ">出生年月:</span>
                        <span class = "col-lg-4  control-label ">XXXX-XX-XX</span>
                    </div>
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 40px">
                        <span class = "col-lg-4  control-label ">性别:</span>
                        <span class = "col-lg-4  control-label ">男</span>
                    </div>

                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "phone" class = "col-lg-4 col-sm-4   control-label ">电话:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "phone">
                            </div>
                        </div>
                    </div>

                    <!--第五行-->
                    <div class = "row" style = "margin-top: 40px">
                        <span class = "col-lg-4  control-label ">电话:</span>
                        <span class = "col-lg-4  control-label ">13952468120</span>
                    </div>
                    <!--第六行-->
                    <div class = "row" style = "margin-top: 40px">
                        <span class = "col-lg-4  control-label ">通讯地址:</span>
                        <span class = "col-lg-4  control-label ">XXXXXXXXXXXXX</span>
                    </div>
                </div>
                <div id = "right" style = "width: 370px;height: 390px;float: left;margin-left: 10px">
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px">
                        <span class = "col-lg-4  control-label ">照片:</span>
                        <img src = "image/8.jpg" />
                    </div>
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "position" class = "col-lg-4 col-sm-4   control-label ">职务:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "position">
                            </div>
                        </div>
                    </div>
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "unit" class = "col-lg-4 col-sm-4   control-label ">单位:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "unit">
                            </div>
                        </div>
                    </div>
                    <!--第四行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "email" class = "col-lg-4 col-sm-4   control-label ">邮箱:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "email">
                            </div>
                        </div>
                    </div>
                </div>
            <!--foot-->
            <div id = "foot">
                <div class = "row">
                    <div class = "form-group">
                        <div class = "col-sm-offset-5 col-sm-5" style = "margin-top:10px">
                            <button type = "submit" class = "btn btn-default">修改</button>
                        </div>
                    </div>
                </div>
            </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>