<%@ page import = "com.code.bean.StageBean" %><%@ page import = "java.util.ArrayList" %><%@ page import = "com.code.bean.DisasterBean" %><%@ page
        import = "com.code.bean.FindwayBean" %><%@ page import = "com.code.bean.AreaBean" %>
<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/10
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<%
    ArrayList<StageBean> stageData = (ArrayList<StageBean>)request.getAttribute("stageData");
    ArrayList<DisasterBean> disasterData = (ArrayList<DisasterBean>)request.getAttribute("disasterData");
    ArrayList<FindwayBean> findwayData = (ArrayList<FindwayBean>)request.getAttribute("findwayData");
    ArrayList<AreaBean> areaData = (ArrayList<AreaBean>)request.getAttribute("areaData");
%>
<!DOCTYPE html>
<html lang = "en" >
<head >
    <meta charset = "UTF-8" >
    <title >添加事件</title >
</head >
<body >
<div id = "thingAddDiv" >
    <div class = "container-fluid" >
        <!--标题-->
        <div class = "row-fluid" >
            <div class = "span12" >
                <h3 class = "text-center" >
                    添加事件信息
                </h3 >
            </div >
        </div >

        <div style = "margin-left:50px;margin-top: 10px" >
            <%--<form class = "form-horizontal" role = "form" action = "javascript:void(0)" onsubmit = "jump(--%>
            <%--'#thingAddDiv','disastercontrol/thingPanel.jsp')" >--%>
                <!--left-->
                <div id = "left" style = "width: 370px;height: 390px;float: left;" >
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 10px;margin-left: -25px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "thingName" class = "col-lg-4 col-sm-4   control-label " >事件名称:</label >
                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "thingName" >
                            </div >
                        </div >
                    </div >
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 5px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "time" class = "col-lg-4 col-sm-4   control-label " >时间:</label >
                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "time" >
                            </div >
                        </div >
                    </div >
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 5px;margin-left: 11px" >
                        <div class = "form-group" style = "float: left" >
                            <label class = " control-label " >灾情阶段:</label >
                            <div class = "btn-group" style = "margin-left: 24px" >


                                <button id = "stageDataSelect" value = "<%=stageData.get(0).getId()%>" type = "button" class = "btn btn-default"
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
                    <div class = "row" style = "margin-top: 5px;margin-left:-45px;" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "describe" class = "col-lg-4 col-sm-4  control-label " >灾情描述:</label >
                            <div class = "col-lg-8 col-sm-6" >
                                <textarea id = "describe" rows = "3" cols = "30" class = "form-control" id = "rules" ></textarea >
                            </div >
                        </div >
                    </div >

                    <!--第五行-->
                    <div class = "row" style = "margin-top: 5px;margin-left: 11px" >
                        <div class = "form-group" style = "float: left" >
                            <label class = " control-label " >发生位置:</label >

                            <div class = "btn-group" style = "margin-left: 24px" >
                                <button id = "areaDataselect"
                                        value = "<%=areaData.get(0).getId() + "&" + areaData.get(0).getClassBean().getName()%>"
                                        type = "button" class = "btn btn-default" style = "width: 120px" >
                                    <%=areaData.get(0).getName()%>
                                </button >
                                <button type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown" style = "width:
                                27px;height: 34px" >
                                    <span class = "caret" ></span >
                                    <span class = "sr-only" >Toggle Dropdown</span >
                                </button >
                                <ul class = "dropdown-menu" role = "menu" >
                                <%
                                    for (int i = 1; i < areaData.size(); i++) {
                                %>
                                    <li ><a href = "#"
                                            value = "<%=areaData.get(i).getId() + "&" + areaData.get(i).getClassBean().getName()%>"
                                            onclick = "return selectArea(this,'#areaDataselect','#areaDataHidden')" ><%=areaData.get(i).getName()%></a ></li >
                                <%
                                    }
                                %>
                                </ul >
                                <input id = "areaDataHidden" name = "hidden" type = "hidden"
                                       value = "<%=areaData.get(0).getId() + "&" + areaData.get(0).getClassBean().getName()%>" />

                            </div >
                        </div >
                    </div >

                    <!--第六行-->
                    <div class = "row" style = "margin-top: 5px;margin-left: -25px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "loss" class = "col-lg-4 col-sm-4   control-label " >初步损失:</label >
                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "loss" >
                            </div >
                        </div >
                    </div >
                    <!--第七行-->
                    <div class = "row" style = "margin-top: 5px;margin-left: -25px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "opinion" class = "col-lg-4 col-sm-4   control-label " >专家建议:</label >
                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "opinion" >
                            </div >
                        </div >
                    </div >
                </div >

                <!--right-->
                <div id = "right" style = "width: 370px;height: 390px;float: left;margin-left: 10px" >
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 10px" >
                        <div class = "form-group" >
                            <div class = "col-lg-4 col-sm-4" style = "float: left;margin-left: 6px" >
                                <label for = "img" class = " control-label " >灾区图片:</label >
                            </div >
                            <div class = "col-lg-4 col-sm-4" style = "float: left;margin-left: -50px" >
                                <input type = "file" class = "form-control" id = "img" style = "display: none" >
                                <input id = "inputImg" type = "text" class = "form-control" style = "width: 150px" />
                            </div >
                            <div class = "col-lg-4 col-sm-4" style = "float: left;margin-left: 10px" >
                                <button class = "btn btn-default" onclick = "browse('#img','#inputImg')" >浏览</button >
                            </div >
                        </div >
                    </div >


                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: 11px" >
                        <div class = "form-group" style = "float: left" >
                            <label class = " control-label " >灾情类型:</label >

                            <div class = "btn-group" style = "margin-left: 24px" >
                                <button id = "disasterDataSelected" value = "<%=disasterData.get(0).getId()%>" type = "button" class = "btn btn-default"
                                        style = "width: 120px" ><%=disasterData.get(0).getName()%></button >
                                <button type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown" style = "width:
                                27px;height: 34px" >
                                    <span class = "caret" ></span >
                                    <span class = "sr-only" >Toggle Dropdown</span >
                                </button >
                                <ul class = "dropdown-menu" role = "menu" >
                                <%
                                    for (int i = 1; i < disasterData.size(); i++) {
                                %>
                                    <li ><a href = "#" value = "<%=disasterData.get(i).getId()%>"
                                            onclick = "return selectOption(this,'#disasterDataSelected','#disasterDataHidden')" ><%=disasterData.get(i).getName()%></a ></li >
                                <%
                                    }
                                %>
                                </ul >
                                <input id = "disasterDataHidden" name = "hidden" type = "hidden" value =
                                        "<%=disasterData.get(0).getId()%>" />
                            </div >
                        </div >
                    </div >

                    <!--第三行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: 11px" >
                        <div class = "form-group" style = "float: left" >
                            <label class = " control-label " >发现途径:</label >

                            <div class = "btn-group" style = "margin-left: 24px" >



                                <button id = "selected" value= "<%=findwayData.get(0).getId()%>" type = "button" class = "btn btn-default" style = "width: 120px" ><%=findwayData.get(0).getName()%></button >
                                <button type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown" style = "width:
                                27px;height: 34px">
                                    <span class = "caret" ></span >
                                    <span class = "sr-only" >Toggle Dropdown</span >
                                </button >
                                <ul class = "dropdown-menu" role = "menu" >
                                <%
                                    for (int i = 1; i < findwayData.size(); i++) {
                                %>
                                    <li ><a href = "#" value = "<%=findwayData.get(i).getId()%>"
                                            onclick = "return selectOption(this,'#selected','#hidden')"><%=findwayData.get(i).getName()%></a ></li >
                                <%
                                    }
                                %>
                                </ul >
                                <input id = "hidden" name = "hidden" type = "hidden" value = "<%=findwayData.get(0).getId()%>" />

                            </div >
                        </div >
                    </div >

                    <!--第四行-->
                    <div class = "row" style = "margin-top: 10px;margin-left: -25px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "thingName" class = "col-lg-4 col-sm-4   control-label " >所在班级:</label >
                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "className" disabled = "disabled"
                                       value="<%=areaData.get(0).getClassBean().getName()%>"/>
                            </div >
                        </div >
                    </div >

                    <!--第五行-->
                    <div class = "row" style = "margin-top:5px;margin-left: -25px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "area" class = "col-lg-4 col-sm-4   control-label " >影响面积:</label >
                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "area" >
                            </div >
                        </div >
                    </div >

                    <!--第六行-->
                    <div class = "row" style = "margin-top: 5px ;margin-left: -25px" >
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
                                <button type = "button" class = "btn btn-default" >添加</button >
                            </div >
                        </div >
                    </div >
                </div >
            <%--</form >--%>
        </div >
    </div >
</div >


<script type = "text/javascript" >

function selectArea(liObj, btnId, hidden){
    //下拉列表被选中的选项
    var liText = liObj.text;
    //得到选中的下拉列表中的value
    var liValue = liObj.getAttribute("value");
    //原来的文本
    var btnText = $(btnId).text();
    //原来的value
    var btnValue = $(btnId).val();
    //交换
    $(btnId).text(liText);
    $(btnId).val(liValue);
    liObj.text = btnText;
    liObj.setAttribute("value", btnValue);
    $(hidden).val($(btnId).val());


    //设置班级
    var strArray = $(hidden).val().split("&");
    var className = strArray[1];
    className = isNull(className);
    $("#className").val(className);
    return false;
}





</script >
</body >
</html >