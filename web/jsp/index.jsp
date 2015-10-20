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
                            <li ><a href = "#虫害一览" onclick = "return  jump('#otherHtml','./pestmage.av','-1')" >虫害一览</a ></li >
                            <li ><a href = "#病害一览" id="diseasePanel">病害一览</a ></li >
                            <li ><a href = "#鼠害一览" id="mousePanel">鼠害一览</a ></li >
                        </ul >
                    </li >
                    <li >
                        <div class = "link" ><i class = "glyphicon glyphicon-briefcase" ></i >灾情防治<i
                                class = "glyphicon glyphicon-chevron-down" style = "margin-left: 160px" ></i ></div >
                        <ul class = "submenu" >
                            <li ><a href = "#区域一览" id = "areaPanel">区域一览</a ></li >
                            <li ><a href = "#小班管理" id = "classPanel">小班管理</a ></li >
                            <li ><a href = "#事件记录" id = "thingPanel">事件记录</a ></li >
                        </ul >
                    </li >
                    <li >
                        <div class = "link" ><i class = "glyphicon glyphicon-user" ></i >专家会商<i class = "glyphicon glyphicon-chevron-down" style = "margin-left: 160px" ></i ></div >
                        <ul class = "submenu" >
                            <li ><a href = "#专家一览" onclick = "return jump('#otherHtml','./ProficientQueryServlet.av','-1')" >专家一览</a ></li >
                            <li ><a href = "#会商灾情"  id="conferPanel">会商灾情</a ></li >
                        </ul >
                    </li >
                    <li >
                        <div class = "link" ><i class = "glyphicon glyphicon-cutlery" ></i >药剂器械出库管理<i
                                class = "glyphicon glyphicon-chevron-down" style = "margin-left: 160px" ></i ></div >
                        <ul class = "submenu" >
                            <li ><a href = "#药剂管理" id="drugPanel">药剂管理</a ></li >
                            <li ><a href = "#器械管理"  id="apparPanel">器械管理</a ></li >
                            <li ><a href = "#出库管理" id="outwarehousePanel">出库管理</a ></li >
                        </ul >
                    </li >
                    <li >
                        <div class = "link" ><i class = "glyphicon glyphicon-comment" ></i >系统信息<i
                                class = "glyphicon glyphicon-chevron-down" style = "margin-left: 160px" ></i ></div >
                        <ul class = "submenu" >
                            <li ><a href = "#用户信息" onclick = "return jump('#otherHtml','./userPanel.av','-1')" >用户信息</a ></li >
                            <li ><a href = "#日志一览" onclick = "return jump('#otherHtml','./log.av','-1')" >日志一览</a ></li >
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

    <script type="text/javascript" src="../js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="../js/uploadPreview.min.js"></script >



<script >

    //初始化方法声明
    function initData(div, url, json) {
        $(div).load(url, json);
    }
//    //虫害一览
//    $("#wormPanel").click(function () {
//        initData('#otherHtml', '../wormPanel.av', {'pageNow': 1, 'option': 'init'});
//    });
    //病害一览
    $("#diseasePanel").click(function () {
        initData('#otherHtml', '../diseasePanel.av', {'pageNow': 1, 'option': 'init'});
    });
    //鼠害一览
    $("#mousePanel").click(function(){
        initData('#otherHtml', '../mousePanel.av', {'pageNow': 1, 'option': 'init'});
    });

    //区域一览初始化
    $("#areaPanel").click(function () {
        initData('#otherHtml', '../areaPanel.av', {'pageNow': 1, 'option': 'init'});
    });

    //小班管理初始化
    $("#classPanel").click(function () {
        initData('#otherHtml', '../classPanel.av', {'pageNow': 1, 'option': 'init'});
    });

    //事件记录初始化
    $("#thingPanel").click(function(){
        initData('#otherHtml', '../thingPanel.av', {'pageNow': 1, 'option': 'init'});
    });

    //会商灾情初始化
    $("#conferPanel").click(function () {
        initData('#otherHtml', '../conferPanel.av', {'pageNow': 1, 'option': 'init'});
    });


    $("#drugPanel").click(function () {
        $("#otherHtml").load("../drug.av", {"pageNow": 1});
    });

    $("#apparPanel").click(function () {
        $("#otherHtml").load("../apparatus.av", {"pageNow": 1});
    });

    $("#outwarehousePanel").click(function () {
        $("#otherHtml").load("../outwarehouse.av", {"pageNow": 1})
    });







    /***************************************************/

    /***************************************************/



</script >

</body >
</html >
