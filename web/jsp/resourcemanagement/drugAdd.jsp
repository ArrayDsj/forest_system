<!DOCTYPE html>
<%@ page contentType = "text/html;charset=UTF-8" language = "java" pageEncoding = "UTF-8" %>

<html lang = "en">
<head>
    <meta charset = "UTF-8">
    <title>添加药剂</title>
    <style type = "text/css">
        #body {
            width: 370px;
            height: 390px;
        }
        td {
            font: normal 13px "Microsoft YaHei";
            font-family: "Microsoft YaHei", "微软雅黑", "sans-serif";
        }
    </style>
</head>
<body>
<div id = "drugAddDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    添加药剂
                </h3>
            </div>
        </div>
        <!--内容-->
        <div style = "margin-left:310px;margin-top: 10px">
            <!--表单-->
            <form class = "form-horizontal" role = "form" action = "javascript:void(0)" onsubmit = "jump(
            '#drugAddDiv','resourcemanagement/drugPanel.jsp')">
                <div id = "body">
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "name"
                                   class = "col-lg-4 col-sm-4   control-label ">名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "name">
                            </div>
                        </div>
                    </div>
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: 19px">
                        <div class = "form-group" style = "float: left">
                            <label class = " control-label ">防治类型:</label>
                            <div class = "btn-group" style="margin-left: 24px">
                                <button type = "button" class = "btn btn-default" style = "width: 120px">病害</button>
                                <button type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown" style="height:35px">
                                    <span class = "caret"></span>
                                    <span class = "sr-only">Toggle Dropdown</span>
                                </button>
                                <ul class = "dropdown-menu" role = "menu">
                                    <li><a href = "#">虫害</a></li>
                                    <li><a href = "#">鼠害</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: 5px">
                        <div class = "form-group" style = "float: left">
                            <label class = "control-label ">适合病虫害:</label>

                            <div class = "btn-group" style = "margin-left: 24px">
                                <button type = "button" class = "btn btn-default" style = "width: 120px">大叶杨白粉病</button>
                                <button type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown" style="height:35px">
                                    <span class = "caret"></span>
                                    <span class = "sr-only">Toggle Dropdown</span>
                                </button>
                                <ul class = "dropdown-menu" role = "menu">
                                    <li><a href = "#">枯萎病</a></li>
                                    <li><a href = "#">幼苗什么病</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!--第四行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "strType" class = "col-lg-4 col-sm-4   control-label ">适合树种:</label>
                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "strType">
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