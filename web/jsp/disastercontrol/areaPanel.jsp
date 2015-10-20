<%@ page import = "com.code.bean.AreaBean" %><%@ page import = "java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/10
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang = "en" >
<head >
    <meta charset = "UTF-8" >
    <title >区域一览</title >
    <style >
        #areaPanelDiv {
            /*圆角*/
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
        }

        td {
            font: normal 13px "Microsoft YaHei";
            font-family: "Microsoft YaHei", "微软雅黑", "sans-serif";
        }

        .active:hover{
            background-color: red;
        }
    </style >
</head >
<body >
<div id = "areaPanelDiv" >
    <div class = "container-fluid" >
        <!--标题-->
        <div class = "row-fluid" >
            <div class = "span12" >
                <h3 class = "text-center" >
                    区域一览
                </h3 >
            </div >
        </div >
        <!--表格-->
        <div class = "row-fluid table-responsive" style = "border: solid" >
            <table class = "table table-hover active table-striped table-bordered" >
                <tr  >
                    <th class = "col-md-2" >区域名称</th >
                    <th class = "col-md-2" >林种</th >
                    <th class = "col-md-2" >地类</th >
                    <th class = "col-md-3" >优势树种</th >
                    <th class = "col-md-2" >负责小班</th >
                </tr >
            </table >

            <div id = "tableTD" class = "row-fluid table-responsive" style = "overflow-y: auto;height: 208px;margin-top: -20px" >
                <table id="table" class = "table table-striped table-bordered table-hover table-condensed " >

                    <c:if test="${requestScope.info == null}">
                        <c:forEach items = "${requestScope.allAreas}" var = "area" >
                            <tr onclick="select(this)">
                                <input type = "hidden" value = "${area.id}" />
                                <td class = "col-md-2" >${area.name}</td >
                                <td class = "col-md-2" >${area.forestType}</td >
                                <td class = "col-md-2" >${area.landType}</td >
                                <td class = "col-md-3" >${area.treeType}</td >
                                <td class = "col-md-2" >${area.classBean.name}</td >
                            </tr >
                        </c:forEach >
                    </c:if>
                </table >
            </div >
        </div >
        <br />
        <!--分页按钮-->
        <div class = "row-fluid" >
            <div class = "span12" >
                <div >
                    <div style = "float:left" >
                        <%--上一页--%>
                        <button id = "previousPage" class = "btn btn-sm" type = "button" style = "line-height:0px" >
                            <span class = "glyphicon glyphicon-chevron-left" ></span >
                        </button >
                    </div >
                    <input id = "pageNow" type = "text" class = "form-control" style = "width: 40px;height: 25px;margin-left: 2px;margin-top: 0px;float:left ; ime-mode:Disabled;"
                           onkeydown = "onlyNum()"
                    <%--当前页数--%>
                            value="${requestScope.pageNow}"  />
                    <label id = "num"  style = "margin-left: 2px" >
                        <%--总的分页数--%>
                        /${requestScope.pageNum}
                    </label >
                    <%--去哪儿--%>
                    <button id = "go" class = "btn btn-sm" type = "button" style = "line-height:0px" >
                        <span class = "glyphicon glyphicon-step-forward" ></span >
                    </button >
                    <%--下一页--%>
                    <button id = "nextPage" class = "btn  btn-sm" type = "button" style = "line-height:0px" >
                        <span class = "glyphicon glyphicon-chevron-right" ></span >
                    </button >
                </div >
            </div >
        </div >
        <br /><br />
        <!--按钮-->
        <div class = "row-fluid" >
            <div class = "col-lg-3 col-sm-2 col-sm-offset-2" >
                <button class = "btn" type = "button" id="addArea" >添加区域</button >
            </div >

            <!--xs自动 lg>=1200px sm<=768px offset列移动-->
            <div class = "col-xs-3 col-lg-6 col-sm-6 col-lg-offset-1 col-sm-offset-1" style="margin-top: -50px">
                <fieldset >
                    <legend >查询区域信息</legend >
                    <div class = "row" >
                        <div class = "col-lg-6 col-sm-6" >
                            <div class = "input-group" >
                                <div class = "input-group-btn" >

                                    <button name = "f_name" id = "selected" type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown" >区域名称<span >&nbsp;</span ><span class = "caret" ></span >
                                    </button >
                                    <ul id = "ul" class = "dropdown-menu" >
                                        <li ><a id = 'li1' name = "f_foresttype" href = "#"
                                                onclick = "return querySelect(this,'selected','query','str')" >林种</a ></li >
                                    </ul >

                                </div >
                                <input type = "hidden" id="query" value="${requestScope.query}"/>
                                <%--条件输入框--%>
                                <input id = "str" type = "text" class = "form-control" style="width: 130px" value="${requestScope.str}">
                            </div >

                        </div >
                        <div class = "col-lg-5 col-sm-5" style="margin-left: 10px">
                            <button id = "search" type = "button" class = "btn" >查找
                            </button >
                        </div >
                    </div >
                </fieldset >
            </div >
        </div >
    </div >
</div >

<script >
    /**
    * 下拉控件+查询按钮
    **/

    $(function(){
        //在重新加载网页时取消条件查询
        $("#addArea").click(function(){
            jump('#areaPanelDiv', 'jsp/disastercontrol/areaAdd.jsp')
        });
    });

    <%--var haveQuery = '${requestScope.option}';--%>
    <%--var query = "${requestScope.query}";--%>
    <%--var str = "${requestScope.str}";--%>
    <%--$("#search").click(function(){--%>
    <%--//得到要查询的字段--%>
    <%--query = $("#query").val();--%>
    <%--if(query == ""){--%>
    <%--query = "f_name";--%>
    <%--}--%>
    <%--//得到条件--%>
    <%--str = $("#inputText").val();--%>
    <%--//得到模糊查询值--%>
    <%--//            alert('query=' + query + '&str=' + str);--%>
    <%--$("#areaPanelDiv").load('../areaPanel.av', {--%>
    <%--'pageNow': 1,--%>
    <%--'query': query,--%>
    <%--'str': str ,--%>
    <%--'queryText': document.getElementById("selected").childNodes[0].nodeValue,--%>
    <%--'queryValue':document.getElementById("query").value }--%>
    <%--)--%>
    <%--});--%>

    <%--//上一页事件--%>
    <%--$("#previousPage").click(function () {--%>
    <%--if(haveQuery == "noQuery"){--%>
    <%--if (parseInt(${requestScope.pageNow}) > 1)--%>
    <%--$("#areaPanelDiv").load("../areaPanel.av", {"pageNow": ${requestScope.pageNow} -1,'query':'noQuery'});--%>
    <%--else alert("已是第一页！");--%>
    <%--}else{--%>
    <%--if (parseInt(${requestScope.pageNow}) > 1) $("#areaPanelDiv").load("../areaPanel.av", {--%>
    <%--"pageNow": ${requestScope.pageNow} -1,--%>
    <%--'query': '${requestScope.query}',--%>
    <%--'str': '${requestScope.str}',--%>
    <%--'queryText': document.getElementById("selected").childNodes[0].nodeValue,--%>
    <%--'queryValue': document.getElementById("query").value--%>
    <%--});--%>
    <%--else alert("已是第一页！");--%>
    <%--}--%>
    <%--});--%>
    <%--//下一页事件--%>
    <%--$("#nextPage").click(function () {--%>
    <%--if (haveQuery == "noQuery") {--%>
    <%--if (${requestScope.pageNow} < ${requestScope.pageNum})--%>
    <%--$("#areaPanelDiv").load("../areaPanel.av", {"pageNow": ${requestScope.pageNow} +1, 'query': 'noQuery'});--%>
    <%--else alert("已是最后一页！");--%>
    <%--}--%>
    <%--else{--%>
    <%--if (${requestScope.pageNow} < ${requestScope.pageNum})--%>
    <%--$("#areaPanelDiv").load("../areaPanel.av", {"pageNow": ${requestScope.pageNow} +1,--%>
    <%--'query': '${requestScope.query}',--%>
    <%--'str': '${requestScope.str}',--%>
    <%--'queryText': document.getElementById("selected").childNodes[0].nodeValue,--%>
    <%--'queryValue': document.getElementById("query").value--%>
    <%--});--%>
    <%--else alert("已是最后一页！");--%>
    <%--}--%>
    <%--});--%>

    <%--//跳转到指定页点击事件--%>
    <%--$("#go").click(function () {--%>
    <%--var num = $("#pageNow").val();--%>
    <%--if(num > ${requestScope.pageNum}){--%>
    <%--alert("大于总页数");--%>
    <%--}else--%>
    <%--$("#areaPanelDiv").load("../areaPanel.av", {"pageNow": num});--%>
    <%--});--%>




    //分页查询
    /**************************************************************************************/
    //每次刷新网页的时候从请求中取得条件值
    var query = '${requestScope.query}';
    var str = '${requestScope.str}';
    $("#search").click(function () {
        //点击查询后改变条件(点击下拉列表的时候改变条件)
        query = $("#query").val();
        str = $("#str").val();
        $("#areaPanelDiv").load("../areaPanel.av", {
            "pageNow": 1, 'query': query, 'str': str
        });
    });
    //事件处理
    $("#nextPage").click(function () {
        if (${requestScope.pageNow} <
        ${requestScope.pageNum})
        $("#areaPanelDiv").load("../areaPanel.av", {
            "pageNow": ${requestScope.pageNow} +1,
            'query': query,
            'str': str
        });
        else
        alert("已是最后一页！");
    });
    $("#previousPage").click(function () {
        if (parseInt(${requestScope.pageNow}) > 1)
            $("#areaPanelDiv").load("../areaPanel.av", {
                "pageNow": ${requestScope.pageNow} -1, 'query': query, 'str': str
            });
        else alert("已是第一页！");
    });
    $("#go").click(function () {
        //跳转到指定页点击事件
        var num = $("#pageNow").val();
        if (num <= ${requestScope.pageNum}) {
            $("#areaPanelDiv").load("../areaPanel.av", {
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
