<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/9
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>

<html lang = "en" >
<head >
    <meta charset = "UTF-8" >
    <title >鼠害一览 </title >
    <style >
        #mousePanelDiv {
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
<div id = "mousePanelDiv" >
    <div class = "container-fluid" >
        <!--标题-->
        <div class = "row-fluid" >
            <div class = "span12" >
                <h3 class = "text-center" >
                    鼠害一览
                </h3 >
            </div >
        </div >
        <!--表格-->

        
        
                <div class = "row-fluid" style = "border: solid" >
            <!--表头-->
            <table class = "table table-hover active" >
                <tr >
                    <th class = "col-lg-3" >名称</th >
                    <th class = "col-lg-3" >食物</th >
                    <th class = "col-lg-6" >主要危害</th >
                </tr >
            </table >
            <div id = "tableTD" class = "row-fluid" style = "overflow-y: auto;height: 208px;margin-top: -20px" >
                <table class = "table table-striped table-bordered table-hover table-condensed" >
                    <tr >
                        <%--到时候直接循环输入信息--%>
                        <td id="name" class = "col-lg-3" >中华鼹鼠</td >
                        <td id="harm" class = "col-lg-3" >植物的根，茎等</td >
                        <td id="rule" class = "col-lg-6" >啃食林木根系，水土流失</td >
                    </tr >
                    <%--删除开始--%>
                    <tr >
                        <td >大沙鼠</td >
                        <td >植物的根，茎等</td >
                        <td >啃食林木根系，水土流失</td >
                    </tr >
                    <tr >
                        <td >黄鼠</td >
                        <td >植物的根，茎等</td >
                        <td >啃食林木根系，水土流失</td >
                    </tr >
                    <tr >
                        <td >家鼠</td >
                        <td >植物的根，茎等</td >
                        <td >啃食林木根系，水土流失</td >
                    </tr >
                    <tr >
                        <td >鼠</td >
                        <td >植物的根，茎等</td >
                        <td >啃食林木根系，水土流失</td >
                    </tr >
                    <tr >
                        <td >鼠</td >
                        <td >植物的根，茎等</td >
                        <td >啃食林木根系，水土流失</td >
                    </tr >
                    <tr >
                        <td >鼠</td >
                        <td >植物的根，茎等</td >
                        <td >啃食林木根系，水土流失</td >
                    </tr >
                    <tr >
                        <td >鼠</td >
                        <td >植物的根，茎等</td >
                        <td >啃食林木根系，水土流失</td >
                    </tr >
                    <%--删除结束--%>
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
            <div class = "col-sm-2 col-lg-2" >
                <button class = "btn" type = "button" onclick = "jump('#mousePanelDiv','datamanagement/mouseAdd.jsp')" >添加新鼠害</button >
            </div >
            <div class = "col-sm-2 col-lg-2" >
                <button class = "btn" type = "button" onclick = "jump('#mousePanelDiv','datamanagement/mouseInfo.jsp')" >查看详细信息</button >
            </div >
            <!--xs自动 lg>=1200px sm<=768px offset列移动-->
            <div class = " col-lg-6 col-sm-6 col-lg-offset-1 col-sm-offset-1" >
                <fieldset >
                    <legend >查询鼠害信息</legend >
                    <div class = "row" >
                        <div class = "form-group" >
                            <div class = "col-lg-4 col-sm-4" style = "float: left;margin-top: 10px" >
                                <label for = "name" class = "control-label " >名称:</label >
                            </div >
                            <div class = "col-lg-4 col-sm-4" style = "
                           width: 200px ;float: left;margin-left: -100px" >
                                <input type = "text" class = "form-control" id = "inputText"  >
                            </div >
                            <div class = "col-lg-4 col-sm-4" style = "float: left" >
                                <button id = "search" type = "button" class = "btn" onclick = "submitQuery('inputText')" >查找</button >
                            </div >
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
