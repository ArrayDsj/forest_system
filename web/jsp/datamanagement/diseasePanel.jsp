<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/9
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang = "en" >
<head >
    <meta charset = "UTF-8" >
    <title >病害一览</title >
    <style >
        #diseasePanelDiv {
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
<div id = "diseasePanelDiv" >
    <div class = "container-fluid" >
        <!--标题-->
        <div class = "row-fluid" >
            <div class = "span12" >
                <h3 class = "text-center" >
                    病害一览
                </h3 >
            </div >
        </div >
        <!--表格-->
        <div class = "row-fluid table-responsive" style = "border: solid" >
            <table class = "table table-hover active table-striped table-bordered" >
                <tr >
                    <th class = "col-md-2" >名称</th >
                    <th class = "col-md-5" >主要危害</th >
                    <th class = "col-md-5" >发病规律</th >
                </tr >
            </table >
            <div id = "tableTD" class = "row-fluid table-responsive" style = "overflow-y: auto;height: 208px;margin-top: -20px" >
                <table id = "table" class = "table table-striped table-bordered table-hover table-condensed " >
                    <c:if test="${requestScope.status != 0}">
                        <c:forEach items="${requestScope.allDiseases}" var = "disease">
                            <tr onclick = "select(this,'#selectID')">
                                <input type = "hidden" value = "${disease.id}" />
                                <td id="name" class = "col-md-2" >${disease.name}</td >
                                <td id="harm" class = "col-md-5" >${disease.mainharm }</td >
                                <td id="rule" class = "col-md-5" >${disease.regularity}</td >
                            </tr >
                        </c:forEach>
                    </c:if>
                </table >
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
                    <input id = "pageNow" type = "text" style = "width: 40px;height: 20px" value="${requestScope.pageNow}"/>
                    <label >/${requestScope.pageNum}</label >
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
        <div class = "row-fluid" >
            <div class = "col-sm-2 col-lg-2" >
                <button class = "btn" type = "button" onclick="addDisease()" >添加新病害</button >
            </div >
            <div class = "col-sm-2 col-lg-2" >
                <button id="butid2" class = "btn" type = "button" onclick="showDisease()">查看详细信息</button >
            </div >
            <!--xs自动 lg>=1200px sm<=768px offset列移动-->
            <div class = "col-xs-3 col-lg-6 col-sm-6 col-lg-offset-1 col-sm-offset-1" style = "margin-top: -40px">
                <fieldset >
                    <legend >查询病害信息</legend >
                    <div class = "row" >
                        <div class = "col-xs-10 col-sm-6" >
                            <div class = "input-group" >
                                <div class = "input-group-btn" >

    <button id = "selected" name="f_name" type = "button" class = "btn btn-default dropdown-toggle"
            data-toggle = "dropdown" >病害名<span class = "caret" ></span ><!--这个span的作用是提供一个下拉图标-->
    </button >
    <ul id = "ul" class = "dropdown-menu" >
        <li ><a id="li1" href = "#" name="f_symptoms" onclick = "return querySelect(this,'selected','query','str')" >发病状态</a ></li >
    </ul >

                                </div >

    <input type = "hidden" id = "query" value = "${requestScope.query}" />
                                <input type = "hidden" id=""/>
    <input id = "str" type = "text" class = "form-control" style = "width: 130px" value = "${requestScope.str}" >
                            </div >
                            <!-- /input-group -->
                        </div >
                        <div class = "col-xs-6 col-sm-6" >
                            <button id = "search" type = "button" class = "btn" >查找</button >
                        </div >
                    </div >
                </fieldset >
            </div >
        </div >
    </div >
</div >
<script type="text/javascript">

 function addDisease(){
     $("#diseasePanelDiv").load("jsp/datamanagement/diseaseAdd.jsp");
 }

 function showDisease(){
     var selectID = $("#selectID").val();
     if (selectID != -1) {
         //请求初始化数据
         $("#diseasePanelDiv").load("../diseaseShow.av", {'selectID': selectID})
     } else alert("请选择要查看的列");
 }

 //分页查询
/**************************************************************************************/
 //每次刷新网页的时候从请求中取得条件值
 var query = '${requestScope.query}';
 var str = '${requestScope.str}';
 $("#search").click(function () {
    //点击查询后改变条件(点击下拉列表的时候改变条件)
     query = $("#query").val();
     str = $("#str").val();
     $("#diseasePanelDiv").load("../diseasePanel.av", {
         "pageNow": 1, 'query': query, 'str': str
     });
 });
 //事件处理
 $("#nextPage").click(function () {
     if (${requestScope.pageNow} < ${requestScope.pageNum})
        $("#diseasePanelDiv").load("../diseasePanel.av", {
            "pageNow": ${requestScope.pageNow} + 1,
            'query': query,
            'str':str
        });
     else alert("已是最后一页！");
 });
 $("#previousPage").click(function () {
     if (parseInt(${requestScope.pageNow}) > 1)
         $("#diseasePanelDiv").load("../diseasePanel.av", {
             "pageNow": ${requestScope.pageNow} - 1, 'query': query, 'str': str
         });
     else alert("已是第一页！");
 });
 $("#go").click(function () {
     //跳转到指定页点击事件
     var num = $("#pageNow").val();
     if(num <= ${requestScope.pageNum}){
         $("#diseasePanelDiv").load("../diseasePanel.av", {
             "query": query,
             'str': str,
             'pageNow': num
         });
     }else alert("超出范围了");
 });
 /**************************************************************************************/

</script >
</body >
</html >