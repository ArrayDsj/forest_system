<%--
  Created by IntelliJ IDEA.
  User: CodeA
  Date: 2015/10/1
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" language = "java" pageEncoding = "UTF-8" %>
<html lang = "en" >
<head >
    <meta charset = "UTF-8" >
    <meta name = "viewport" content = "width=device-width, initial-scale=1" >
    <title >森林病虫害防治系统</title >

    <link rel = "stylesheet" href = "../bootstrap/css/bootstrap.min.css" />
    <link href = "../bootstrap/css/bootstrap-datetimepicker.css" rel = "stylesheet" >
    <%--<link rel = "stylesheet" href = "../bootstrap/css/bootstrap-table.css" />--%>
    <link rel = "stylesheet" href = "../css/index.css" />

</head >
<body >
    <!--整个页面-->
    <div class = "container" >
        <div id = "header" >
            <h3 >森林病虫害防治系统</h3 >
        </div >
        <div id = "main" >
            <!--左边的导航-->
            <div id = "navigate" >
                <ul id = "accordion" class = "accordion" >
                    <li style = "font-size: 18px;text-align: center" >森林病虫害防治系统</li >
                    <li >
                        <div class = "link" ><i class = "glyphicon glyphicon-book" ></i >资料管理<i class = "glyphicon glyphicon-chevron-down" style = "margin-left: 160px" ></i >
                        </div >
                        <ul class = "submenu" >
                            <li ><a href = "#wormPanel" onclick = "jump('#otherHtml','datamanagement/wormPanel.jsp')" >虫害一览</a ></li >
                            <li ><a href = "#diseasePanel" onclick = "jump('#otherHtml','datamanagement/diseasePanel.jsp')" >病害一览</a ></li >
                            <li ><a href = "#mousePanel" onclick = "jump('#otherHtml','datamanagement/mousePanel.jsp')" >鼠害一览</a ></li >
                        </ul >
                    </li >
                    <li >
                        <div class = "link" ><i class = "glyphicon glyphicon-briefcase" ></i >灾情防治<i
                                class = "glyphicon glyphicon-chevron-down" style = "margin-left: 160px" ></i ></div >
                        <ul class = "submenu" >
                            <li ><a href = "#区域一览" onclick = "jump('#otherHtml','../areaPanel.av','1')">区域一览</a ></li >
                            <li ><a href = "#小班管理" onclick = "jump('#otherHtml','../classPanel.av','1')" >小班管理</a ></li >
                            <li ><a href = "#事件记录" onclick = "jump('#otherHtml','../thingPanel.av','1')" >事件记录</a ></li >
                        </ul >
                    </li >
                    <li >
                        <div class = "link" ><i class = "glyphicon glyphicon-user" ></i >专家会商<i class = "glyphicon glyphicon-chevron-down" style = "margin-left: 160px" ></i ></div >
                        <ul class = "submenu" >
                            <li ><a href = "#proficientPanel" onclick = "jump('#otherHtml','expertconsultation/proficientPanel.jsp')" >专家一览</a ></li >
                            <li ><a href = "#conferPanel" onclick = "jump('#otherHtml','expertconsultation/conferPanel.jsp')" >会商灾情</a ></li >
                        </ul >
                    </li >
                    <li >
                        <div class = "link" ><i class = "glyphicon glyphicon-cutlery" ></i >药剂器械出库管理<i
                                class = "glyphicon glyphicon-chevron-down" style = "margin-left: 160px" ></i ></div >
                        <ul class = "submenu" >
                            <li ><a href = "#drugPanel" onclick = "jump('#otherHtml','resourcemanagement/drugPanel.jsp')" >药剂管理</a ></li >
                            <li ><a href = "#apparatusPanel" onclick = "jump('#otherHtml','resourcemanagement/apparatusPanel.jsp')" >器械管理</a ></li >
                            <li ><a href = "#outwarehousePanel"
                                    onclick = "jump('#otherHtml','resourcemanagement/outwarehousePanel.jsp')" >出库管理</a ></li >
                        </ul >
                    </li >
                    <li >
                        <div class = "link" ><i class = "glyphicon glyphicon-comment" ></i >系统信息<i
                                class = "glyphicon glyphicon-chevron-down" style = "margin-left: 160px" ></i ></div >
                        <ul class = "submenu" >
                            <li ><a href = "#userPanel" onclick = "jump('#otherHtml','systemmessage/userPanel.jsp')" >用户信息</a ></li >
                            <li ><a href = "#logs" onclick = "jump('#otherHtml','systemmessage/logs.jsp')" >日志一览</a ></li >
                        </ul >
                    </li >
                </ul >
            </div >

            <!--添加网页的地方-->
            <div id = "otherHtml" >
                <div style = "float: left;height: 470px;width: 450px;margin-top: 10px;margin-left: 10px" >
                    <img src = "../image/2.jpg" width = "380" height = "220" style = "margin-top: 10px;margin-left: 60px" />
                    <img src = "../image/4.jpg" width = "380" height = "220" style = "margin-top: 10px;margin-left: 60px" />
                </div >
                <div style = "float: left;height: 470px;width: 450px;margin-top: 10px" >
                    <img src = "../image/2.jpg" width = "380" height = "220" style = "margin-top: 10px;margin-left: 30px" />
                    <img src = "../image/4.jpg" width = "380" height = "220" style = "margin-top: 10px;margin-left: 30px" />
                </div >
            </div >

        </div >
    </div >
    <script type = "text/javascript" src = "../js/jquery-1.11.3.min.js" ></script >
    <script type = "text/javascript" src = "../bootstrap/js/bootstrap.min.js" ></script >
    <script type = "text/javascript" src = "../bootstrap/js/bootstrap-table.js" ></script >
    <script type = "text/javascript" src = "../bootstrap/js/bootstrap-datetimepicker.js" charset = "UTF-8" ></script >
    <script type = "text/javascript" src = "../bootstrap/js/locales/bootstrap-datetimepicker.zh-CN.js" charset = "UTF-8" ></script >
    <script type = "text/javascript" src = "../js/index.js" ></script >

<script >
    $(function(){
        var showPage = '${requestScope.showPage}';
        if(showPage == 'areaPanel'){
           jump('#otherHtml', '../areaPanel.av', '1');
        }
        if (showPage == 'classPanel') {
            jump('#otherHtml', '../classPanel.av', '1');
        }
    })
</script >

</body >
</html >
