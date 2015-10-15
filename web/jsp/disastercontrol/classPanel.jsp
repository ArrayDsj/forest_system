<%@ page import = "com.code.bean.AreaBean" %>
<%@ page import = "com.code.bean.ClassBean" %>
<%@ page import = "java.util.ArrayList" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/10
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>

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
        <!--表格-->
        <div class = "row-fluid table-responsive" style = "border: solid" >
            <table class = "table table-hover active table-striped table-bordered" >
                <tr  >
                    <th class = "col-md-3" >小班名称</th >
                    <th class = "col-md-3" >负责人</th >
                    <th class = "col-md-3" >负责人电话</th >
                    <th class = "col-md-3" >负责区域</th >
                </tr >
            </table >
            <div id = "tableTD" class = "row-fluid" style = "overflow-y: auto;height: 208px;margin-top: -20px" >
                    <table class = "table table-striped table-bordered table-hover table-condensed" >

                    <%--<c:if test="${requestScope.info==null}">--%>
                        <%--<c:forEach items="${requestScope.allClasses}" var="class">--%>
                             <%--<tr onclick = "select(this)" >--%>
                                <%--<input type = "hidden"  value="${class.id}"/>--%>
                                <%--<td class = "col-lg-3" >雅林一班</td >--%>
                                <%--<td class = "col-lg-3" >何元庆</td >--%>
                                <%--<td class = "col-lg-3" >13754821641</td >--%>
                                <%--<td class = "col-lg-3" >雅林一号地区</td >--%>
                            <%--</tr>--%>

                        <%--</c:forEach>--%>
                        <%--</c:if>--%>


                        <%
                            ArrayList<ClassBean> all = (ArrayList<ClassBean>)request.getAttribute("allClasses");
                            for(int i = 0 ; i < all.size() ; i++){

                        %>
                            <tr onclick = "select(this)" >
                                <input type = "hidden" value="<%=all.get(i).getId()%>"/>
                                <td class = "col-md-3" ><%=all.get(i).getName()%></td >
                                <td class = "col-md-3" ><%=all.get(i).getManager()%></td >
                                <td class = "col-md-3" ><%=all.get(i).getPhone()%></td >
                                <td class = "col-md-3" ><%=all.get(i).getArea()%></td >
                            </tr>
                        <%
                            }
                        %>





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
                    <input id = "pageNow" type = "text" class = "form-control" style =
                            "width: 40px;height: 25px;margin-left: 2px;margin-top: 0px;float:left"
                            <%--当前页数--%>
                            value="${requestScope.pageNow}"/>
                    <label id = "num" style = "margin-left: 2px" >
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
                    <button class = "btn" type = "button" onclick = "jump('#classPanelDiv','../classAdd.av')" >添加小班
                    </button >
                </div >
                <div class = "col-lg-3 col-sm-2 col-sm-offset-3" >
                    <button class = "btn" type = "button" onclick = "jump('#classPanelDiv','disastercontrol/classShow.jsp')" >查看小班信息</button >
                </div >
            </div >
            <div class = "row-fluid" >
                <div class = "col-lg-3 col-sm-3 col-sm-offset-2" style = "margin-top: 20px" >
                    <button class = "btn" type = "button" onclick = "jump('#classPanelDiv','disastercontrol/classUpdate.jsp')" >修改小班信息</button >
                </div >
            </div >
        </div >

        <div class = "row-fluid" id = "rightBtns" style = "float: left; " >
            <!--xs自动 lg>=1200px sm<=768px offset列移动-->
            <div class = "col-xs-3 col-lg-6 col-sm-6  col-sm-offset-4" style = "margin-top: -140px;margin-left: 400px" >
                <fieldset >
                    <legend >查询小班信息</legend >
                    <div class = "row" >
                        <div class = " col-sm-6 col-lg-6" >
                            <div class = "input-group" >
                                <div class = "input-group-btn" >
                                    <button name = "f_name" id = "selected" type = "button" class = "btn btn-default dropdown-toggle"
                                            data-toggle = "dropdown" >小班名称<span >&nbsp;</span ><span class = "caret" ></span >
                                    </button >
                                        <ul id = "ul" class = "dropdown-menu" >
                                            <li ><a id = 'li1' name = "f_area" href = "#"
                                                    onclick = "return querySelect(this,'selected')" >负责区域</a ></li >
                                        </ul >
                                </div >
                                <%--条件输入框--%>
                                <input id = "inputText" type = "text" class = "form-control" style = "width: 130px" value = "" >
                            </div >
                            <!-- /input-group -->
                        </div >
                        <div class = "col-lg-4 col-sm-4" style = "margin-left: 40px">
                            <button id = "search" type = "button" class = "btn" onclick =
                                    "submitQuery('#inputText','#classPanelDiv','../classPanel.av','1')" >查找
                            </button >
                        </div >
                    </div >
                </fieldset >
            </div >

        </div >
    </div >
</div >

<script >
    <%--只能输入数字--%>
    $('#pageNow').keydown = function (eve) {
        if (event) {
            if ((event.keyCode >= 48 && event.keyCode <= 57) ||
                    (event.keyCode >= 96 && event.keyCode <= 105) ||
                    event.keyCode == 8) {
                return true;
            }
            //取消默认事件
            return false;
        } else {
            if ((eve.charCode >= 48 && eve.charCode <= 57) ||
                    (eve.charCode >= 96 && eve.charCode <= 105) ||
                    eve.charCode == 8) {
                return true;
            }
            //取消默认事件
            return false;
        }
    };

    //上一页事件
    $("#previousPage").click(function () {
        if (${requestScope.pageNow} >1){
            $("#classPanelDiv").load("../classPanel.av", {"pageNow": ${requestScope.pageNow} -1});
        }
        else{
            alert("已是第一页！");
        }
    });

    //下一页事件
    $("#nextPage").click(function () {
        if (${requestScope.pageNow} <
        ${requestScope.pageNum}){
            //这里是一个json数据格式
            $("#classPanelDiv").load("../classPanel.av", {"pageNow": ${requestScope.pageNow} +1});
        }
        else{
            alert("已是最后一页！");
        }
    });

    //跳转到指定页点击事件
    $("#go").click(function () {
        var num = $("#pageNow").val();
        $("#classPanelDiv").load("../classPanel.av", {"pageNow": num});
    });
    //查询模块事件






</script >
</body >
</html >
