<%@ page import = "java.util.ArrayList" %><%@ page import = "com.code.bean.AreaBean" %>
<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/10
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%--<%--%>
<%--ArrayList<AreaBean> areasNoClass = (ArrayList<AreaBean>)request.getAttribute("areasNoClass");--%>
<%--int counts = areasNoClass.size();--%>
<%--%>--%>
<!DOCTYPE html>
<html lang = "en" >
<head >
    <meta charset = "UTF-8" >
    <title >小班管理</title >
    <style >
        #classPanelDiv {
            /*圆角*/
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
        }

        td {
            font: normal 13px "Microsoft YaHei";
            font-family: "Microsoft YaHei", "微软雅黑", "sans-serif";
        }
    </style >
</head >
<body >
<div id = "classPanelDiv" >
    <div class = "container-fluid" >
        <!--标题-->
        <div class = "row-fluid" >
            <div class = "span12" >
                <h3 class = "text-center" >
                    小班管理
                </h3 >
            </div >
        </div >
        <div class = "row-fluid table-responsive" style = "border: solid" >
            <table class = "table table-hover active table-striped table-bordered" >
                <tr >
                    <th class = "col-md-3" >小班名称</th >
                    <th class = "col-md-3" >负责人</th >
                    <th class = "col-md-3" >负责人电话</th >
                    <th class = "col-md-3" >负责区域</th >
                </tr >
            </table >
            <div id = "tableTD" class = "row-fluid" style = "overflow-y: auto;height: 208px;margin-top: -20px" >
                    <table class = "table table-striped table-bordered table-hover table-condensed" >
                    <c:if test = "${requestScope.info != 'null'}" >
                        <c:forEach items = "${requestScope.allClasses}" var = "cla" >
                            <tr onclick = "select(this,'#selectID')" >
                                <input type = "hidden" value = "${cla.id}" />
                                <td class = "col-md-3" >${cla.name}</td >
                                <td class = "col-md-3" >${cla.manager}</td >
                                <td class = "col-md-3" >${cla.phone}</td >
                                <td class = "col-md-3" >${cla.area}</td >
                            </tr >
                        </c:forEach >
                    </c:if >
                </table >
                <%--保存被选中的事件id --%>
                <input type = "hidden" value = "-1" id = "selectID" name = "selectID" />
            </div >
        </div >
        <br />
        <!--分页按钮-->
        <div class = "row-fluid" >
            <div class = "span12" >
                <div >
                    <button id = "previousPage" class = "btn btn-sm" type = "button" style = "line-height:0px" >
                        <span class = "glyphicon glyphicon-chevron-left" ></span >
                    </button >
                    <input id = "pageNow" type = "text"
                           style = "width: 40px;height: 25px;margin-left: 2px;margin-top: 0px; ime-mode:Disabled;" onkeydown = "onlyNum()"
                    <%--当前页数--%>
                           value = "${requestScope.pageNow}" />
                    <label >
                        <%--总的分页数--%>
                        /${requestScope.pageNum}
                    </label >
                    <button id = "go" class = "btn btn-sm" type = "button" style = "line-height:0px" >
                        <span class = "glyphicon glyphicon-step-forward" ></span >
                    </button >
                    <button id = "nextPage" class = "btn  btn-sm" type = "button" style = "line-height:0px" >
                        <span class = "glyphicon glyphicon-chevron-right" ></span >
                    </button >
                </div >
            </div >
        </div >
        <br /><br />
        <!--按钮-->
        <div id = "leftBtns" style = "float: left" >
            <div class = "row-fluid" >
                <div class = "col-lg-3 col-sm-2 col-sm-offset-2" >
                    <button class = "btn" type = "button" id = "addClass" >添加小班</button >
                </div >
                <div class = "col-lg-3 col-sm-2 col-sm-offset-3" >
                    <button class = "btn" type = "button" id = "showClass" >查看小班信息</button >
                </div >
            </div >
            <div class = "row-fluid" >
                <div class = "col-lg-3 col-sm-3 col-sm-offset-2" style = "margin-top: 20px" >
                    <button class = "btn" type = "button" id = "updateClass" >修改小班信息</button >
                </div >
            </div >
        </div >

        <div class = "row-fluid" id = "rightBtns" style = "float: left;" >
            <!--xs自动 lg>=1200px sm<=768px offset列移动-->
            <div class = "col-xs-3 col-lg-6 col-sm-6  col-sm-offset-4" style = "margin-top: -125px;margin-left: 400px" >
                <fieldset >
                    <legend >查询小班信息</legend >
                    <div class = "row" >
                        <div class = "col-xs-10 col-sm-6 col-lg-6" >
                            <div class = "input-group" >
                                <div class = "input-group-btn" >
                                    <button name = "f_name" id = "selected" type = "button" class = "btn btn-default dropdown-toggle"
                                            data-toggle = "dropdown" >小班名称<span >&nbsp;</span ><span class = "caret" ></span >
                                    </button >
                                    <ul id = "ul" class = "dropdown-menu" >
                                        <li ><a id = 'li1' name = "f_area" href = "#"
                                                onclick = "return querySelect(this,'selected','query','str')" >负责区域</a ></li >
                                    </ul >
                                </div >
                                <%--保存标签的name,查询的字段 query,每次点击之后,下拉列表中的值放在这里--%>
                                <input type = "hidden" id="query" value = "${requestScope.query}" />
                                <%--查询条件 str--%>
                                <input id = "str" type = "text" class = "form-control" style = "width: 130px"
                                       value = "${requestScope.str}" />
                            </div >
                            <!-- /input-group -->
                        </div >
                        <div class = "col-lg-4 col-sm-4" style = "margin-left: 40px" >
                            <button id = "search" type = "button" class = "btn"  >查找
                            </button >
                        </div >
                    </div >
                </fieldset >
            </div >

        </div >
    </div >
</div >

<script >

$(function () {
    $("#addClass").click(function () {
        if (parseInt(${requestScope.countsNoClass}) != 0) {
            $("#classPanelDiv").load("../classAdd.av", {'header': 'askAddClass'}, function (data) {
            })
        } else alert("请先添加地区");

    });

    $("#showClass").click(function () {
        var classID = $("#selectID").val();
        if (classID != -1) {
            //请求初始化数据
            $("#classPanelDiv").load("../classShow.av", {'classID': classID, 'header': 'showClass'}, function (data) {

            })
        } else alert("请选择要查看的列");
    });
    $("#updateClass").click(function () {
        var classID = $("#selectID").val();
        if (classID != -1) {
            //请求初始化数据
            $("#classPanelDiv").load("../classShow.av", {'classID': classID, 'header': 'updateClass'}, function (data) {
            })
        } else alert("请选择要查看的列");
    });

    <%--var query ;--%>
    <%--var str ;--%>
    <%--$("#search").click(function () {--%>
        <%--//点击查询按钮之后--%>
        <%--//1. 得到查询字段--%>
         <%--query = $("#query").val();--%>
        <%--//2. 得到查询条件--%>
         <%--str = $("#str").val();--%>
        <%--alert('query=' + query + "  str=" + str);--%>
        <%--//3. 查询数据库--%>
        <%--//传入当前的字段和条件--%>
        <%--$("#classPanelDiv").load("../classPanel.av", {"option": "haveQuery", "pageNow": 1, "query": query, "str": str});--%>
    <%--});--%>

    <%--//上一页事件--%>
    <%--$("#previousPage").click(function () {--%>
        <%--if ('${sessionScope.option}' == 'noQuery') {--%>
            <%--query = 'f_name';--%>
            <%--str = "";--%>
        <%--}else{--%>
            <%--query = '${requestScope.query}';--%>
            <%--str = '${requestScope.str}';--%>
        <%--}--%>
<%--//        alert('query=' + query + "  str=" + str);--%>
        <%--if (parseInt(${requestScope.pageNow}) > 1)--%>
            <%--$("#classPanelDiv").load("../classPanel.av", {"option": "haveQuery","pageNow": ${requestScope.pageNow} -1, "query": query, "str": str});--%>
        <%--else alert("已是第一页！");--%>
    <%--});--%>

    <%--//下一页事件--%>
    <%--$("#nextPage").click(function () {--%>
        <%--if ('${sessionScope.option}' == 'noQuery') {--%>
            <%--query = 'f_name';--%>
            <%--str = "";--%>
        <%--} else {--%>
            <%--query = '${requestScope.query}';--%>
            <%--str = '${requestScope.str}';--%>
        <%--}--%>
<%--//        alert('query=' + query + "  str=" + str);--%>
        <%--if (${requestScope.pageNow} < ${requestScope.pageNum})--%>
        <%--$("#classPanelDiv").load("../classPanel.av", {"option": "haveQuery","pageNow": ${requestScope.pageNow} +1, "query": query, "str": str});--%>
        <%--else--%>
        <%--alert("已是最后一页！");--%>
    <%--});--%>

    <%--//跳转到指定页点击事件--%>
    <%--$("#go").click(function () {--%>
        <%--var num = $("#pageNow").val();--%>
        <%--$("#classPanelDiv").load("../classPanel.av", {"pageNow": num});--%>
    <%--});--%>
})


//分页查询
/**************************************************************************************/
//每次刷新网页的时候从请求中取得条件值
var query = '${requestScope.query}';
var str = '${requestScope.str}';
$("#search").click(function () {
    //点击查询后改变条件(点击下拉列表的时候改变条件)
    query = $("#query").val();
    str = $("#str").val();
    $("#classPanelDiv").load("../classPanel.av", {
        "pageNow": 1, 'query': query, 'str': str
    });
});
//事件处理
$("#nextPage").click(function () {
    if (${requestScope.pageNow} <
    ${requestScope.pageNum})
    $("#classPanelDiv").load("../classPanel.av", {
        "pageNow": ${requestScope.pageNow} +1,
        'query': query,
        'str': str
    });
    else
    alert("已是最后一页！");
});
$("#previousPage").click(function () {
    if (parseInt(${requestScope.pageNow}) > 1)
        $("#classPanelDiv").load("../classPanel.av", {
            "pageNow": ${requestScope.pageNow} -1, 'query': query, 'str': str
        });
    else alert("已是第一页！");
});
$("#go").click(function () {
    //跳转到指定页点击事件
    var num = $("#pageNow").val();
    if (num <= ${requestScope.pageNum}) {
        $("#classPanelDiv").load("../classPanel.av", {
            "query": query,
            'str': str,
            'pageNow': num
        });
    } else alert("超出范围了");
});
/**************************************************************************************/


</script >
</body >
</html >