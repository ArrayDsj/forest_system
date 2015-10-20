<%@ page import = "com.code.bean.ClassBean" %><%@ page import = "com.code.bean.AreaBean" %>
<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/10
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<%
    ClassBean classBean = (ClassBean)request.getAttribute("classBean");
    AreaBean areaBean = (AreaBean)request.getAttribute("areaBean");
%>

<!DOCTYPE html>
<html lang = "en" >
<head >
    <meta charset = "UTF-8" >
    <title >查看小班信息</title >
    <style type = "text/css" >
        span {
            font-size: 16px;
        }
    </style >
</head >
<body >
<div id = "classInfoDiv" >
    <div class = "container-fluid" >
        <!--标题-->
        <div class = "row-fluid" >
            <div class = "span12" >
                <h3 class = "text-center" >
                    查看小班信息
                </h3 >
            </div >
        </div >
        <!--内容-->
        <div style = "margin-left:50px;margin-top: 10px" >
            <div id = "left" style = "width: 370px;height: 390px;float: left" >
                <!--第一行-->
                <div class = "row" style = "margin-top: 20px" >
                    <span class = "col-lg-4  control-label " >名称:</span >
                    <span class = "col-lg-4  control-label " ><%=classBean.getName()%></span >
                </div >
                <!--第二行-->
                <div class = "row" style = "margin-top: 40px" >
                    <span class = "col-lg-4  control-label " >负责人电话:</span >
                    <span class = "col-lg-4  control-label " ><%=classBean.getPhone()%></span >
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
                <!--第一行-->
                <div class = "row" style = "margin-top: 20px" >
                    <span class = "col-lg-4  control-label " >负责人:</span >
                    <span class = "col-lg-4  control-label " ><%=classBean.getManager()%></span >
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
        </div >
        <!--foot-->
        <div id = "foot" >
            <div class = "row" >
                <div class = "form-group" >
                    <div class = "col-sm-offset-5 col-sm-5" style = "margin-top:10px" >
                        <button type = "submit" class = "btn btn-default" id="back">返回</button >
                    </div >
                </div >
            </div >
        </div >
    </div >
</div >

<script >
    $(function(){
        $("#back").click(function(){
            initData('#classInfoDiv', '../classPanel.av', {'pageNow': 1, 'option': 'init', 'query': 'f_name', 'str': ''});
        })
    });
</script >

</body >
</html >