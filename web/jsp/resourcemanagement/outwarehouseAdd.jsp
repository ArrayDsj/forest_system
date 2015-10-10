<!DOCTYPE html>
<%@ page contentType = "text/html;charset=UTF-8" language = "java" pageEncoding = "UTF-8" %>

<html lang = "en">
<head>
    <meta charset = "UTF-8">
    <title>添加出库信息</title>
    <style type = "text/css">
        span {
            font-size: 16px;
        }
    </style>
</head>
<body>
<div id = "outwarehouseAddDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    添加出库信息
                </h3>
            </div>
        </div>
        <!--内容-->
        <!--内容-->
        <div style = "margin-left:50px;margin-top: 10px">
            <form class = "form-horizontal" role = "form" action = "javascript:void(0)" onsubmit = "jump(
            '#outwarehouseAddDiv','resourcemanagement/outwarehousePanel.jsp')">
                <!--left-->
                <div id = "left" style = "width: 370px;height: 390px;float: left">
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: 19px">
                        <div class = "form-group" style = "float: left">
                            <label class = " control-label ">类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型:</label>

                            <div class = "btn-group" style = "margin-left: 24px">
                                <button type = "button" class = "btn btn-default" style = "width: 120px">药剂</button>
                                <button type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown" style="height:35px">
                                    <span class = "caret"></span>
                                    <span class = "sr-only">Toggle Dropdown</span>
                                </button>
                                <ul class = "dropdown-menu" role = "menu">
                                    <li><a href = "#">器械</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: 19px">
                        <div class = "form-group" style = "float: left">
                            <label class = " control-label ">物品名称:</label>

                            <div class = "btn-group" style = "margin-left: 24px">
                                <button type = "button" class = "btn btn-default" style = "width: 120px">xxxxxx</button>
                                <button type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown" style="height:35px">
                                    <span class = "caret"></span>
                                    <span class = "sr-only">Toggle Dropdown</span>
                                </button>
                                <ul class = "dropdown-menu" role = "menu">
                                    <li><a href = "#">XXXXXXX</a></li>
                                    <li><a href = "#">XXXXXXX</a></li>
                                    <li><a href = "#">XXXXXXX</a></li>
                                    <li><a href = "#">XXXXXXX</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: 19px">
                        <div class = "form-group" style = "float: left">
                            <label class = " control-label ">领用小班:</label>

                            <div class = "btn-group" style = "margin-left: 24px">
                                <button type = "button" class = "btn btn-default" style = "width: 120px">XXXXX</button>
                                <button type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown" style="height:35px">
                                    <span class = "caret"></span>
                                    <span class = "sr-only">Toggle Dropdown</span>
                                </button>
                                <ul class = "dropdown-menu" role = "menu">
                                    <li><a href = "#">XXXXX</a></li>
                                    <li><a href = "#">XXXXX</a></li>
                                    <li><a href = "#">XXXXX</a></li>
                                    <li><a href = "#">XXXXX</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!--第四行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: 19px">
                        <div class = "form-group" style = "float: left">
                            <label class = " control-label ">出&nbsp;&nbsp;库&nbsp;&nbsp;人:</label>

                            <div class = "btn-group" style = "margin-left: 24px">
                                <button type = "button" class = "btn btn-default" style = "width: 120px">XXXXX</button>
                                <button type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown" style="height:35px">
                                    <span class = "caret"></span>
                                    <span class = "sr-only">Toggle Dropdown</span>
                                </button>
                                <ul class = "dropdown-menu" role = "menu">
                                    <li><a href = "#">XXXXX</a></li>
                                    <li><a href = "#">XXXXX</a></li>
                                    <li><a href = "#">XXXXX</a></li>
                                    <li><a href = "#">XXXXX</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!--right-->
                <div id = "right" style = "width: 370px;height: 390px;float: left;margin-left: 10px">
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: 19px">
                        <div class = "form-group" style = "float: left">
                            <label class = " control-label ">防治类型:</label>
                            <div class = "btn-group" style = "margin-left: 24px">
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

                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "name"
                                   class = "col-lg-4 col-sm-4   control-label ">领用数量:</label>
                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "name">
                            </div>
                        </div>
                    </div>
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 20px;margin-left:-35px;">
                        <div class = "form-group" style = "float: left">
                            <label for = "status" class = "col-lg-4 col-sm-4  control-label ">主要用途:</label>
                            <div class = "col-lg-8 col-sm-6">
                                <textarea rows = "5" cols = "30" class = "form-control" id = "status"></textarea>
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