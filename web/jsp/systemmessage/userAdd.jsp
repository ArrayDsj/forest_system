<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--<link rel="stylesheet" type="text/css" href="styles.css">-->
    <meta charset = "UTF-8">
    <title>添加用户</title>
    <style type = "text/css">
        #body {
            width: 370px;
            height: 390px;}
    </style>
  </head>
  
  <body>
    <div id = "userAddDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    添加用户
                </h3>
            </div>
        </div>
        <!--内容-->
        <div style = "margin-left:310px;margin-top: 10px">
            <!--表单-->
            <form class = "form-horizontal" role = "form" action = "javascript:void(0)" onsubmit = "jump(
            '#userAddDiv','systemmessage/userPanel.jsp')">
                <div id = "body">
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "name"
                                   class = "col-lg-4 col-sm-4   control-label ">用&nbsp;&nbsp;户&nbsp;&nbsp;名:</label>
                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "name">
                            </div>
                        </div>
                    </div>
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "password"
                                   class = "col-lg-4 col-sm-4   control-label ">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "password">
                            </div>
                        </div>
                    </div>
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "confirm"
                                   class = "col-lg-4 col-sm-4   control-label ">确认密码:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "confirm">
                            </div>
                        </div>
                    </div>
                    <!--第四行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "trueName"
                                   class = "col-lg-4 col-sm-4   control-label ">真实姓名:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "trueName">
                            </div>
                        </div>
                    </div>

                    <!--第五行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: 19px">
                        <div class = "form-group" style = "float: left">
                            <label class = " control-label ">用户等级:</label>

                            <div class = "btn-group" style = "margin-left: 24px">
                                <button type = "button" class = "btn btn-default" style = "width: 120px">病害</button>
                                <button type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown">
                                    <span class = "caret"></span>
                                    <span class = "sr-only">Toggle Dropdown</span>
                                </button>
                                <ul class = "dropdown-menu" role = "menu">
                                    <li><a href = "#">超级管理员</a></li>
                                    <li><a href = "#">灾情管理员</a></li>
                                    <li><a href = "#">专家管理员</a></li>
                                    <li><a href = "#">库房管理员</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>

                <div id = "foot">
                    <div class = "row">
                        <div class = "form-group">
                            <div class = "col-sm-offset-3 col-sm-5" style = "margin-top:-40px">
                                <button type = "submit" class = "btn btn-default">添加</button>
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
