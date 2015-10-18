<%@ page import = "com.code.bean.AreaBean" %><%@ page import = "com.code.bean.ClassBean" %>
<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/10
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<%
    ClassBean classBean = (ClassBean) request.getAttribute("classBean");
    AreaBean areaBean = (AreaBean) request.getAttribute("areaBean");
%>
<!DOCTYPE html>
<html lang = "en" >
<head >
    <meta charset = "UTF-8" >
    <title >修改小班信息</title >
    <style type = "text/css" >
        span {
            font-size: 16px;
        }
    </style >
</head >
<body >
<div id = "classUpdateDiv" >
    <div class = "container-fluid" >
        <!--标题-->
        <div class = "row-fluid" >
            <div class = "span12" >
                <h3 class = "text-center" >
                    修改小班信息
                </h3 >
            </div >
        </div >
        <!--内容-->
        <div style = "margin-left:50px;margin-top: 10px" >
            <%--<form class = "form-horizontal" role = "form" action = "javascript:void(0)" onsubmit = "jump(--%>
            <%--'#classUpdateDiv','disastercontrol/classPanel.jsp')" >--%>
                <div id = "left" style = "width: 370px;height: 390px;float: left" >
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <span class = "col-lg-4  control-label " >名称:</span >
                        <span class = "col-lg-4  control-label " ><%=classBean.getName()%></span >
                    </div >
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 40px" >
                        <label for = "phone" class = "col-lg-4 col-sm-4 control-label " >负责人电话:</label >
                        <div class = "col-lg-6 col-sm-6" >
                            <input type = "text" class = "form-control" id = "phone" value="<%=classBean.getPhone()%>">
                        </div >
                    </div >
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 40px" >
                        <span class = "col-lg-4  control-label " >负责区域:</span >
                        <span class = "col-lg-4  control-label " ><%=areaBean.getName()%></span >
                    </div >
                    <!--第四行-->
                    <div class = "row" style = "margin-top: 40px" >
                        <span class = "col-lg-4  control-label " >地类:</span >
                        <span class = "col-lg-4  control-label " ><%=areaBean.getLandType()%></span >
                    </div >
                    <!--第五行-->
                    <div class = "row" style = "margin-top: 40px" >
                        <span class = "col-lg-4  control-label " >创建时间:</span >
                        <span class = "col-lg-4  control-label " ><%=classBean.getFoundDay()%></span >
                    </div >
                </div >

                <div id = "right" style = "width: 370px;height: 390px;float: left;margin-left: 10px" >
                    <div class = "row" style = "margin-top: 20px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "manager" class = "col-lg-4 col-sm-4   control-label " >负责人:</label >
                            <div class = "col-lg-7 col-sm-7" >
                                <input type = "text" class = "form-control" id = "manager" value ="<%=classBean.getManager()%>">
                            </div >
                        </div >
                    </div >
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 40px" >
                        <span class = "col-lg-4  control-label " >人数:</span >
                        <span class = "col-lg-4  control-label " ><%=classBean.getNumber()%></span >
                    </div >
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 40px" >
                        <span class = "col-lg-4  control-label " >林种:</span >
                        <span class = "col-lg-4  control-label " ><%=areaBean.getForestType()%></span >
                    </div >
                    <!--第四行-->
                    <div class = "row" style = "margin-top: 40px" >
                        <span class = "col-lg-4  control-label " >优势树种:</span >
                        <span class = "col-lg-4  control-label " ><%=areaBean.getTreeType()%></span >
                    </div >
                </div >
                <!--foot-->
                <div id = "foot" >
                    <div class = "row" >
                        <div class = "form-group" >
                            <div class = "col-sm-offset-5 col-sm-5" style = "margin-top:10px" >
                                <button type = "button" class = "btn btn-default" id="confirmUpdate">修改</button >
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
    $(function () {
        $("#confirmUpdate").click(function () {
            var classID = ${requestScope.classBean.id};
            var manager = $("#manager").val();
            var phone = $("#phone").val();
            $("#classUpdateDiv").load('../classAdd.av',
                    {
                        "header": "confirmUpdate",
                        "classID": classID ,
                        "manager": manager,
                        "phone": phone
                    },
                    function (data) {
                        var jsonObj = eval("(" + data + ")");
                        if (jsonObj.msg == 'success') {
                            initData("#classUpdateDiv", '../classPanel.av', {'pageNow': 1, 'option': 'init'});
                        } else if (jsonObj.msg == 'defeat') {
                            alert("系统繁忙,请稍后再试");
                        } else alert("系统内部错误");
                    }
            );
        })
    });
</script >
</body >
</html >