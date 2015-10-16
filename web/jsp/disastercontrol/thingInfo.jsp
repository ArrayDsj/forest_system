<%@ page import = "com.code.bean.ThingBean" %>
<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/10
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<!DOCTYPE html>
<% ThingBean thingBean = (ThingBean)request.getAttribute("thingBean");%>
<html lang = "en" >
<head >
    <meta charset = "UTF-8" >
    <title >查看事件信息</title >
    <style type = "text/css" >
        span {
            font-size: 16px;
        }
    </style >
</head >
<body >
<div id = "thingInfoDiv" >
    <div class = "container-fluid" >
        <!--标题-->
        <div class = "row-fluid" >
            <div class = "span12" >
                <h3 class = "text-center" >
                    查看事件信息
                </h3 >
            </div >
        </div >

        <!--内容-->
        <div style = "margin-left:50px;margin-top: 10px" >
            <!--left-->
            <div id = "left" style = "width: 370px;height: 390px;float: left" >
                <!--第一行-->
                <div class = "row" style = "margin-top: 20px" >
                    <span class = "col-lg-4  control-label " >事件名称:</span >
                    <span class = "col-lg-4  control-label " ><%=thingBean.getName()%></span >
                </div >
                <!--第二行-->
                <div class = "row" style = "margin-top: 15px" >
                    <span class = "col-lg-4  control-label " >时间:</span >
                    <span class = "col-lg-4  control-label " ><%=thingBean.getFoundDay()%></span >
                </div >
                <!--第三行-->
                <div class = "row" style = "margin-top: 15px" >
                    <span class = "col-lg-4  control-label " >灾情阶段:</span >
                    <span class = "col-lg-4  control-label " ><%=thingBean.getStage().getName()%></span >
                </div >
                <!--第四行-->
                <div class = "row" style = "margin-top: 15px" >
                    <span class = "col-lg-4  control-label " >灾情描述:</span >
                    <span class = "col-lg-6 col-sm-10 control-label " ><%=thingBean.getDescription()%></span >
                </div >
                <!--第五行-->
                <div class = "row" style = "margin-top: 20px" >
                    <span class = "col-lg-4  control-label " >灾情类型:</span >
                    <span class = "col-lg-4 control-label " ><%=thingBean.getDisasterType().getName()%></span >
                </div >
                <!--第六行-->
                <div class = "row" style = "margin-top: 15px" >
                    <span class = "col-lg-4  control-label " >初步损失:</span >
                    <span class = "col-lg-4 control-label " ><%=thingBean.getLoss()%></span >
                </div >
                <!--第七行-->
                <div class = "row" style = "margin-top: 15px" >
                    <span class = "col-lg-4  control-label " >专家建议:</span >
                    <span class = "col-lg-4 control-label " ><%=thingBean.getResult()%></span >
                </div >
            </div >
            <div id = "right" style = "width: 370px;height: 390px;float: left;margin-left: 10px" >
                <!--第一行-->
                <div class = "row" style = "margin-top: 15px" >
                    <span class = "col-lg-4  control-label " >灾区图片:</span >
                    <img src = "../../image/2.jpg" style = "width: 200px" />
                </div >

                <div class = "row" style = "margin-top: 10px" >
                    <span class = "col-lg-4  control-label " >发现途径:</span >
                    <span class = "col-lg-6   control-label " ><%=thingBean.getFindWay().getName()%></span >
                </div ><div class = "row" style = "margin-top: 10px" >
                    <span class = "col-lg-4  control-label " >发现位置:</span >
                    <span class = "col-lg-6   control-label " ><%=thingBean.getAreaBean().getName()%></span >
                </div ><div class = "row" style = "margin-top: 10px" >
                    <span class = "col-lg-4  control-label " >所在小班:</span >
                    <span class = "col-lg-6   control-label " ><%=thingBean.getAreaBean().getClassBean().getName()%></span >
                </div ><div class = "row" style = "margin-top: 10px" >
                    <span class = "col-lg-4  control-label " >影响面积:</span >
                    <span class = "col-lg-6   control-label " ><%=thingBean.getProportion()%></span >
                </div ><div class = "row" style = "margin-top: 10px" >
                    <span class = "col-lg-4  control-label " >防治方案:</span >
                    <span class = "col-lg-6   control-label " ><%=thingBean.getScheme()%></span >
                </div >
            </div >
        </div >
        <!--foot-->
        <div id = "foot" >
            <div class = "row" >
                <div class = "form-group" >
                    <div class = "col-sm-offset-5 col-sm-5" style = "margin-top:10px" >
                        <button type = "submit" class = "btn btn-default" onclick = "back()" >返回</button >
                    </div >
                </div >
            </div >
        </div >
    </div >
</div >

<script >
    //点击返回,初始化表格数据
    function back(){
        jump('#thingInfoDiv', '../thingPanel.av', '1');
    }
</script >


</body >
</html >
