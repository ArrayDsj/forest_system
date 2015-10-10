<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/10
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<!DOCTYPE html>
<html lang = "en" >
<head >
    <meta charset = "UTF-8" >
    <title >修改事件信息</title >
    <style type = "text/css" >
        span label {
            font-size: 16px;
        }
    </style >
</head >
<body >
<div id = "thingUpdateDiv" >
    <div class = "container-fluid" >
        <!--标题-->
        <div class = "row-fluid" >
            <div class = "span12" >
                <h3 class = "text-center" >
                    修改事件信息
                </h3 >
            </div >
        </div >

        <!--内容-->
        <div style = "margin-left:50px;margin-top: 10px" >
            <form class = "form-horizontal" role = "form" action = "javascript:void(0)" onsubmit = "jump(
            '#thingUpdateDiv','disastercontrol/thingPanel.jsp')" >
                <!--left-->
                <div id = "left" style = "width: 370px;height: 390px;float: left" >
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <span class = "col-lg-3  col-sm-3 control-label " >事件名称:</span >
                        <span class = "col-lg-3 col-sm-3 control-label " >XXXXXXX</span >
                    </div >
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 15px" >
                        <span class = "col-lg-3  col-sm-3 control-label " >时间:</span >
                        <span class = "col-lg-3  col-sm-3 control-label " >xxxx-xx-xx</span >
                    </div >

                    <!--第三行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: 23px" >
                        <div class = "form-group " style = "float: left" >
                            <label class = " control-label " >灾情阶段:</label >
                            <div class = "btn-group" style = "margin-left: 24px" >
                                <button type = "button" class = "btn btn-default" style = "width: 120px" >已经得到控制</button >
                                <button type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown" >
                                    <span class = "caret" ></span >
                                    <span class = "sr-only" >Toggle Dropdown</span >
                                </button >
                                <ul class = "dropdown-menu" role = "menu" >
                                    <li ><a href = "#" >防治中</a ></li >
                                    <li ><a href = "#" >无法解决,申请专家会商</a ></li >
                                </ul >
                            </div >
                        </div >
                    </div >

                    <!--第四行-->
                    <div class = "row" style = "margin-top: 15px" >
                        <span class = "col-lg-3 col-sm-3 control-label " >灾情描述:</span >
                        <span class = "col-lg-6  col-sm-6 control-label " >修剪清除枯叶危害,结茧的幼虫在成虫发生期用黑光灯诱杀,25%灭有说赶紧上课金额嗡嗡</span >
                    </div >
                    <!--第五行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <span class = "col-lg-3 col-sm-3 control-label " >灾情类型:</span >
                        <span class = "col-lg-2 col-sm-1 control-label " >xxx</span >
                    </div >
                    <!--第六行-->
                    <div class = "row" style = "margin-top: 15px" >
                        <span class = "col-lg-3 col-sm-3 control-label " >初步损失:</span >
                        <span class = "col-lg-2 col-sm-1 control-label " >xxx</span >
                    </div >
                    <!--第七行-->
                    <div class = "row" style = "margin-top: 15px" >
                        <span class = "col-lg-3 col-sm-3 control-label " >专家建议:</span >
                        <span class = "col-lg-2 col-sm-1 control-label " >xxxxxxxxxxxxxxxx</span >
                    </div >
                </div >

                <!--right-->
                <div id = "right" style = "width: 370px;height: 390px;float: left;margin-left: 10px" >
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 15px" >
                        <span class = "col-lg-4 col-sm-4 control-label " >灾区图片:</span >
                        <img src = "../../image/2.jpg" style = "width: 200px" />
                    </div >
                    <div class = "row" style = "margin-top: 10px" >
                        <span class = "col-lg-4 col-sm-4 control-label " >发现途径:</span >
                        <span class = "col-lg-6   control-label " >xxxxxxxxxxxxxxxxxxxxxxxx</span >
                    </div >
                    <div class = "row" style = "margin-top: 10px" >
                        <span class = "col-lg-4 col-sm-4 control-label " >发现位置:</span >
                        <span class = "col-lg-6   control-label " >xxxxxxxxxxxxxxxxxxxxxxxx</span >
                    </div >
                    <div class = "row" style = "margin-top: 10px" >
                        <span class = "col-lg-4 col-sm-4 control-label " >所在小班:</span >
                        <span class = "col-lg-6   control-label " >xxxxxxxxxxxxxxxxxxxxxxxx</span >
                    </div >
                    <div class = "row" style = "margin-top: 10px" >
                        <span class = "col-lg-4 col-sm-4 control-label " >影响面积:</span >
                        <span class = "col-lg-6   control-label " >xxxxxxxxxxxxxxxxxxxxxxxx</span >
                    </div >
                    <!--第六行-->
                    <div class = "row" style = "margin-top: 20px ;margin-left: 25px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "plan" class = "col-lg-4 col-sm-4   control-label " >防治方案:</label >
                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "plan" >
                            </div >
                        </div >
                    </div >
                </div >
                <!--foot-->
                <div id = "foot" >
                    <div class = "row" >
                        <div class = "form-group" >
                            <div class = "col-sm-offset-5 col-sm-5" style = "margin-top:10px" >
                                <button type = "submit" class = "btn btn-default" >修改</button >
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
