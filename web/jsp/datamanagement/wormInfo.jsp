<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/10
  Time: 3:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<!DOCTYPE html>
<html lang = "en" >
<head >
    <meta charset = "UTF-8" >
    <title >查看详细信息</title >
    <%--<!--<style type = "text/css">-->
        <!--#wormInfoDiv {-->
            <!--background-color: coral;-->
            <!--width: 920px;-->
            <!--height: 500px;-->
            <!--margin-left: 0px;-->
            <!--margin-top: 0px;-->
            <!--/*圆角*/-->
            <!-&#45;&#45;webkit-border-radius: 4px;-->
            <!-&#45;&#45;moz-border-radius: 4px;-->
            <!--border-radius: 4px;-->
        <!--}-->
    <!--</style>-->--%>
    <style type = "text/css" >
         span {
             font-size: 16px;
         }


    </style >
</head >
<body >
    <div id = "wormInfoDiv" >
        <div class = "container-fluid" >
        <!--标题-->
            <div class = "row-fluid" >
                <div class = "span12" >
                    <h3 class = "text-center" >
                        虫害详细信息
                    </h3 >
                </div >
            </div >
            <!--内容-->
            <div style = "margin-left:50px;margin-top: 10px" >
                <div id = "left" style = "width: 370px;height: 390px;float: left" >
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <span class = "col-lg-4  control-label " >名称:</span >
                        <span class = "col-lg-4  control-label " >黄杨娟野螟</span >
                    </div >
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <span class = "col-lg-4  control-label " >繁殖:</span >
                        <span class = "col-lg-4  control-label " >一年6~8胎,每胎7~10只</span >
                    </div >
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <span class = "col-lg-4  control-label " >寄主:</span >
                        <span class = "col-lg-4  control-label " >小叶黄杨</span >
                    </div >
                    <!--第四行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <span class = "col-lg-4  control-label " >天敌:</span >
                        <span class = "col-lg-4  control-label " >啄木鸟,凹眼蜂,跳小蜂</span >
                    </div >
                    <!--第五行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <span class = "col-lg-4  control-label " >主要危害:</span >
                        <span class = "col-lg-4  control-label " >幼虫食叶片,造成数目枯死</span >
                    </div >
                    <!--第六行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <span class = "col-lg-4  control-label " >防治措施:</span >
                        <span class = "col-lg-6 col-sm-10 control-label " >修剪清除枯叶危害,结茧的幼虫在成虫发生期用黑光灯诱杀,25%灭有说赶紧上课金额嗡嗡</span >
                    </div >
                </div >
                <div id = "right" style = "width: 370px;height: 390px;float: left;margin-left: 10px" >
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <span class = "col-lg-4  control-label " >幼虫图片:</span >
                        <img src = "image/yworm.jpg" />
                    </div >
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <span class = "col-lg-4  control-label " >成虫图片:</span >
                        <img src = "image/worm.jpg" />
                    </div >
                </div >
            </div >
            <!--foot-->
            <div id = "foot" >
                <div class = "row" >
                    <div class = "form-group" >
                        <div class = "col-sm-offset-5 col-sm-5" style = "margin-top:10px" >
                            <button type = "submit" class = "btn btn-default" onclick = "jump(
                            '#wormPanelDiv','datamanagement/wormPanel.jsp')" >返回</button >
                        </div >
                    </div >
                </div >
            </div >
        </div >
    </div >
</body >
</html >