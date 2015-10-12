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
        <div class = "row-fluid" style = "border: solid" >
            <table class = "table table-hover active" >
                <tr  >
                    <th class = "col-lg-3" >区域名称</th >
                    <th class = "col-lg-2" >林种</th >
                    <th class = "col-lg-3" >地类</th >
                    <th class = "col-lg-2" >优势树种</th >
                    <th class = "col-lg-2" >负责小班</th >
                </tr >
            </table >

            <div id = "tableTD" class = "row-fluid" style = "overflow-y: auto;height: 208px;margin-top: -20px" >
                    <table class = "table table-striped table-bordered table-hover table-condensed" >
                    <c:if test="${requestScope.info == null}">
                        <c:forEach items = "${requestScope.allAreas}" var = "area" >
                            <tr >
                                <td class = "col-lg-3" >${area.name}</td >
                                <td class = "col-lg-2" >${area.forestType}</td >
                                <td class = "col-lg-3" >${area.landType}</td >
                                <td class = "col-lg-2" >${area.treeType}</td >
                                <td class = "col-lg-2" >${area.classBean.name}</td >
                            </tr >
                        </c:forEach >
                    </c:if>
                </table >
            </div >
            </table>
        </div >
        <br />
        <!--分页按钮-->
        <div class = "row-fluid" >
            <div class = "span12" >
                <div >
                    <div style = "float:left" >
                        <button id = "previousPage" class = "btn btn-sm" type = "button" style = "line-height:0px" >
                            <span class = "glyphicon glyphicon-chevron-left" ></span >
                        </button >
                    </div >
                    <input id = "pageNum" type = "text" class = "form-control" style =
                            "width: 45px;height: 20px;margin-left: 2px;margin-top: 2px;float:left" />
                    <label id = "num" name = "num" style = "margin-left: 2px" >/10</label >
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
            <div class = "col-lg-3 col-sm-2 col-sm-offset-2" >
                <button class = "btn" type = "button" onclick = "jump('#areaPanelDiv','disastercontrol/areaAdd.jsp')" >添加区域</button >
            </div >

            <!--xs自动 lg>=1200px sm<=768px offset列移动-->
            <div class = "col-xs-3 col-lg-6 col-sm-6 col-lg-offset-1 col-sm-offset-1" style="margin-top: -50px">
                <fieldset >
                    <legend >查询区域信息</legend >
                    <div class = "row" >
                        <div class = "col-lg-6 col-sm-6" >
                            <div class = "input-group" >
                                <div class = "input-group-btn" >
                                    <button name = "name" id = "selected" type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown" >区域名称<span >&nbsp;</span ><span class = "caret" ></span >
                                    </button >
                                        <ul id = "ul" class = "dropdown-menu" >
                                            <li ><a id = 'li1' name = "foresttype" href = "#"
                                                    onclick = "return querySelect(this,'selected')" >林种</a ></li >
                                            <li ><a id = 'li2' name = "goodtype" href = "#"
                                                    onclick = "return querySelect(this,'selected')" >优势树种</a ></li >
                                        </ul >
                                </div >
                                <!-- /btn-group -->
                                <input id = "inputText" type = "text" class = "form-control" style="width: 130px">
                            </div >
                            <!-- /input-group -->
                        </div >
                        <div class = "col-lg-5 col-sm-5" style="margin-left: 10px">
                            <button id = "search" type = "button" class = "btn" onclick = "submitQuery('inputText')" >查找</button >
                        </div >
                    </div >
                </fieldset >
            </div >
        </div >
    </div >
</div >

<script >
    //数据有效性验证
    $("#pageNum").keydown(function () {
        //只能输入数字
    });

    //事件处理
    $("#previousPage").click(function () {
        //上一页点击事件
        alert("上一页");
    });
    $("#nextPage").click(function () {
        //下一页点击事件
        alert("下一页");
    });
    $("#go").click(function () {
        //跳转到指定页点击事件
        var num = $("#pageNum").val();
        alert(num);
    });

    //查询模块事件

</script >
</body >
</html >
