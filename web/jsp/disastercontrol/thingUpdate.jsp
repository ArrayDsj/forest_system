<%@ page import = "com.code.bean.StageBean" %><%@ page import = "com.code.bean.ThingBean" %><%@ page import = "java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/10
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<%
    ThingBean thingBean = (ThingBean) request.getAttribute("thingBean");
    ArrayList<StageBean> stageData = (ArrayList<StageBean>) request.getAttribute("stageData");
%>


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
            <%--<form class = "form-horizontal" role = "form" action = "javascript:void(0)" onsubmit = "jump(--%>
            <%--'#thingUpdateDiv','disastercontrol/thingPanel.jsp')" >--%>
                <!--left-->
                <div id = "left" style = "width: 370px;height: 390px;float: left" >
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <span class = "col-lg-3  col-sm-3 control-label " >事件名称:</span >
                        <span class = "col-lg-3 col-sm-3 control-label " ><%=thingBean.getName()%></span >
                    </div >
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 15px" >
                        <span class = "col-lg-3  col-sm-3 control-label " >时间:</span >
                        <span class = "col-lg-3  col-sm-3 control-label " ><%=thingBean.getFoundDay()%></span >
                    </div >

                    <!--第三行-->
                    <div class = "row" style = "margin-top: 5px;margin-left: 11px" >
                        <div class = "form-group" style = "float: left" >
                            <label class = " control-label " >灾情阶段:</label >
                            <div class = "btn-group" style = "margin-left: 24px" >
                                <button id = "stageDataSelect" value = "<%=stageData.get(0).getId()%>" type = "button"
                                        class = "btn btn-default"
                                        style = "width: 120px" ><%=stageData.get(0).getName()%></button >
                                <button type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown" style = "width:
                                27px;height: 34px" >
                                    <span class = "caret" ></span >
                                    <span class = "sr-only" >Toggle Dropdown</span >
                                </button >
                                <ul class = "dropdown-menu" role = "menu" >
                                <%
                                    for (int i = 1; i < stageData.size(); i++) {
                                %>
                                    <li ><a href = "#" value = "<%=stageData.get(i).getId()%>"
                                            onclick = "return selectOption(this,'#stageDataSelect','#stageDataHidden')" ><%=stageData.get(i).getName()%></a ></li >
                                <%
                                    }
                                %>
                                </ul >
                                <input id = "stageDataHidden" name = "hidden" type = "hidden" value = "<%=stageData.get(0).getId()%>" />

                            </div >
                        </div >
                    </div >

                    <!--第四行-->
                    <div class = "row" style = "margin-top: 15px" >
                        <span class = "col-lg-3 col-sm-3 control-label " >灾情描述:</span >
                        <span class = "col-lg-6  col-sm-6 control-label " ><%=thingBean.getDescription()%></span >
                    </div >
                    <!--第五行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <span class = "col-lg-3 col-sm-3 control-label " >灾情类型:</span >
                        <span class = "col-lg-2 col-sm-1 control-label " ><%=thingBean.getDisasterType().getName()%></span >
                    </div >
                    <!--第六行-->
                    <div class = "row" style = "margin-top: 15px" >
                        <span class = "col-lg-3 col-sm-3 control-label " >初步损失:</span >
                        <span class = "col-lg-2 col-sm-1 control-label " ><%=thingBean.getLoss()%></span >
                    </div >
                    <!--第七行-->
                    <div class = "row" style = "margin-top: 15px" >
                        <span class = "col-lg-3 col-sm-3 control-label " >专家建议:</span >
                        <span class = "col-lg-2 col-sm-1 control-label " ><%=thingBean.getResult()%></span >
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
                        <span class = "col-lg-6   control-label " ><%=thingBean.getFindWay().getName()%></span >
                    </div >
                    <div class = "row" style = "margin-top: 10px" >
                        <span class = "col-lg-4 col-sm-4 control-label " >发现位置:</span >
                        <span class = "col-lg-6   control-label " ><%=thingBean.getAreaBean().getName()%></span >
                    </div >
                    <div class = "row" style = "margin-top: 10px" >
                        <span class = "col-lg-4 col-sm-4 control-label " >所在小班:</span >
                        <span class = "col-lg-6   control-label " ><%=thingBean.getClass().getName()%></span >
                    </div >
                    <div class = "row" style = "margin-top: 10px" >
                        <span class = "col-lg-4 col-sm-4 control-label " >影响面积:</span >
                        <span class = "col-lg-6   control-label " ><%=thingBean.getProportion()%></span >
                    </div >
                    <!--第六行-->
                    <div class = "row" style = "margin-top: 20px ;margin-left: 25px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "scheme" class = "col-lg-4 col-sm-4   control-label " >防治方案:</label >
                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "scheme" value="<%=thingBean.getScheme()%>">
                            </div >
                        </div >
                    </div >
                </div >
                <!--foot-->
                <div id = "foot" >
                    <div class = "row" >
                        <div class = "form-group" >
                            <div class = "col-sm-offset-5 col-sm-5" style = "margin-top:10px" >
                                <button type = "button" class = "btn btn-default" onclick="thingUpdate()">修改</button >
                            </div >
                        </div >
                    </div >
                </div >
            <%--</form >--%>
        </div >
    </div >
</div >

<script >
    //点击 修改 按钮事件
    //请求 thingAdd.av 然后成功就跳转到
    function thingUpdate(){
        $("#thingUpdateDiv").load('../thingAdd.av',
                {   "thingID": <%=thingBean.getId()%>,
                    "stageDataHidden": $("#stageDataHidden").val(),
                    "scheme":$("#scheme").val()
                },
                function(data){
            //如果成功
            alert("成功");
            jump('#thingUpdateDiv', '../thingPanel.av', '1');
        });
    }
</script >


</body >
</html >
