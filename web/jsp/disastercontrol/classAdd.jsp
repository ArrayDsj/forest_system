<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/10
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<!DOCTYPE html>
<html lang = "en" >
<head >
    <meta charset = "UTF-8" >
    <title >添加小班</title >
</head >
<body >
<div id = "classAddDiv" >
    <div class = "container-fluid" >
        <!--标题-->
        <div class = "row-fluid" >
            <div class = "span12" >
                <h3 class = "text-center" >
                    添加小班
                </h3 >
            </div >
        </div >
        <!--内容-->
        <div style = "margin-left:50px;margin-top: 10px" >
            <!--表单-->
            <form class = "form-horizontal" role = "form" action = "javascript:void(0)" onsubmit = "jump(
            '#classAddDiv','disastercontrol/classPanel.jsp')" >
                <!--左边-->
                <div id = "left" style = "width: 370px;height: 390px;float: left" >
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "name" class = "col-lg-4 col-sm-4   control-label " >名称:</label >

                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "name" >
                            </div >
                        </div >
                    </div >
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "phone" class = "col-lg-4 col-sm-4   control-label " >繁殖:</label >

                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "phone" >
                            </div >
                        </div >
                    </div >
                    <!--第四行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: 11px" >
                        <div class = "form-group" style = "float: left" >
                            <label class = " control-label " >负责区域:</label >
                            <div class = "btn-group" style = "margin-left: 24px" >
                                <button type = "button" class = "btn btn-default" style = "width: 120px" >一号地区</button >
                                <button type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown" >
                                    <span class = "caret" ></span >
                                    <span class = "sr-only" >Toggle Dropdown</span >
                                </button >
                                <ul class = "dropdown-menu" role = "menu" >
                                    <li ><a href = "#" >二号地区</a ></li >
                                    <li ><a href = "#" >三号地区</a ></li >
                                    <li ><a href = "#" >四号地区</a ></li >
                                </ul >
                            </div >
                        </div >
                    </div >


                </div >
                <!--右边-->
                <div id = "right" style = "width: 370px;height: 390px;float: left;margin-left: 10px" >
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "principal" class = "col-lg-4 col-sm-4   control-label " >负责人:</label >

                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "principal" >
                            </div >
                        </div >
                    </div >
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "num" class = "col-lg-4 col-sm-4   control-label " >人员数量:</label >

                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "num" >
                            </div >
                        </div >
                    </div >
                </div >
                <!--foot-->
                <div id = "foot" >
                    <div class = "row" >
                        <div class = "form-group" >
                            <div class = "col-sm-offset-5 col-sm-5" style = "margin-top:10px" >
                                <button type = "submit" class = "btn btn-default" >添加</button >
                            </div >
                        </div >
                    </div >
                </div >
            </form >
        </div >
    </div >
</div >
</body >
</html >