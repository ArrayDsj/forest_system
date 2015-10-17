<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<html >
<head>
    <meta charset = "UTF-8">
    <title>专家会商</title>
    <style>
        #conferPanelDiv {
            /*圆角*/
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
        }
         td {
            font: normal 13px "Microsoft YaHei";
            font-family: "Microsoft YaHei", "微软雅黑", "sans-serif";
        }
    </style>
</head>
<body>
<div id = "conferPanelDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    专家会商
                </h3>
            </div>
        </div>
        <!--表格-->
        <div class = "row-fluid table-responsive" style = "border: solid" >
            <table class = "table table-hover active table-striped table-bordered" >
                <tr >
                    <th class = "col-md-2 ">事件名称</th>
                    <th class = "col-md-2 ">日期</th>
                    <th class = "col-md-2 ">发生位置</th>
                    <th class = "col-md-3 ">防治方案</th>
                    <th class = "col-md-3 ">灾情状态</th>
                </tr>
            </table>
            <div id = "tableTD" class = "row-fluid" style = "overflow-y: auto;height: 208px;margin-top: -20px" >
                <table class = "table table-striped table-bordered table-hover table-condensed">
                    <c:if test = "${requestScope.info == 'have'}" >
                    <c:forEach items = "${requestScope.allThings}" var = "thing" >
                        <tr onclick = "select(this,'#selectID','#stageID')" >
                            <input type = "hidden" value = "${thing.id}" />
                            <td class = "col-md-2" >${thing.name}</td >
                            <td class = "col-md-2" >${thing.foundDay}</td >
                            <td class = "col-md-2" >${thing.areaBean.name}</td >
                            <td class = "col-md-3" >${thing.scheme}</td >
                            <td class = "col-md-3" >${thing.stage.name}</td >
                        </tr >
                    </c:forEach >
                    </c:if >
                </table>
                <%--保存被选中的事件id 和状态--%>
                <input type = "hidden" value = "-1" id = "selectID" name = "selectID" />
                <input type = "hidden" value = "-1" id = "stageID" name = "stageID" />
            </div>
        </div>
        <br />
        <br />
        <br />
        <!--按钮-->
        <div class = "row-fluid">
            <div class = "col-sm-offset-5">
                <button class = "btn" type = "button" onclick = "showThing('#selectID')">专家会商</button>
            </div>
        </div>
    </div>
    <label id="hidden" style="display: none"><%=request.getAttribute("info")%></label >
</div>

<script >
    $(function(){
        if($("#hidden").text() == 'null'){
            alert("无数据");
        }
    })

    function showThing(id) {
        if ($(id).val() != -1) {
            var thingID = $(id).val();
            //请求初始化数据
            $("#conferPanelDiv").load("../thingShow.av", {'thingID': thingID, 'header': 'conferShow'}, function (data) {

            })
        } else alert("请选择要查看的列");

    }
//    onclick = "jump('#conferPanelDiv','expertconsultation/conferAdd.jsp')"
</script >

</body>
</html>