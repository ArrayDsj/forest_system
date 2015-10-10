<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/10
  Time: 3:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<!DOCTYPE html>
<html lang = "en" >
<head >
    <meta charset = "UTF-8" >
    <title >查看详细信息</title >
    <style type = "text/css" >
        span {
            font-size: 16px;
        }
    </style >
</head >
<body >
    <div id = "mouseInfoDiv" >
        <div class = "container-fluid" >
            <!--标题-->
            <div class = "row-fluid" >
                <div class = "span12" >
                    <h3 class = "text-center" >
                        鼠害详细信息
                    </h3 >
                </div >
            </div >

            <!--内容-->
            <div style = "margin-left:50px;margin-top: 10px" >
                <div id = "left" style = "width: 370px;height: 390px;float: left" >
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <span class = "col-lg-4  control-label " >名称:</span >
                        <span class = "col-lg-4  control-label " >xxxxxx</span >
                    </div >
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 40px" >
                        <span class = "col-lg-4  control-label " >繁殖:</span >
                        <span class = "col-lg-4  control-label " >XXXXXXXXX</span >
                    </div >
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 40px" >
                        <span class = "col-lg-4  control-label " >食物:</span >
                        <span class = "col-lg-4  control-label " >SXXXXXXXX</span >
                    </div >
                    <!--第四行-->
                    <div class = "row" style = "margin-top: 40px" >
                        <span class = "col-lg-4  control-label " >天敌:</span >
                        <span class = "col-lg-4  control-label " >XXXXXXXXX</span >
                    </div >
                    <!--第五行-->
                    <div class = "row" style = "margin-top: 40px" >
                        <span class = "col-lg-4   control-label " >防治措施:</span >
                        <span class = "col-lg-6 col-sm-10 control-label " >晚饭后未合格文革后为何过去我就给彭荣华排污管</span >
                    </div >
                </div >
                <div id = "right" style = "width: 370px;height: 390px;float: left;margin-left: 10px" >
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <span class = "col-lg-4  control-label " >图片:</span >
                        <img src = "../../image/hmouse.jpg" />
                    </div >
                    <div class = "row" style = "margin-top: 40px" >
                        <span class = "col-lg-4  control-label " >主要危害:</span >
                        <span class = "col-lg-6 col-sm-10  control-label " >xxxxxxxxxxxxxxxxxxxxx</span >
                    </div >
                </div >
            </div >
            <!--foot-->
            <div id = "foot" >
                <div class = "row" >
                    <div class = "form-group" >
                        <div class = "col-sm-offset-5 col-sm-5" style = "margin-top:10px" >
                            <button type = "submit" class = "btn btn-default" onclick = "jump(
            '#mouseInfoDiv','datamanagement/mousePanel.jsp')" >返回</button >
                        </div >
                    </div >
                </div >
            </div >
        </div >
    </div >
</body >
</html >