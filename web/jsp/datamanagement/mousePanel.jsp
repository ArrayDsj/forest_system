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
            <table class = "table table-hover" >
                <tr class = "active" >
                    <th class = "col-lg-4" >名称</th >
                    <th class = "col-lg-4" >防治类型</th >
                    <th class = "col-lg-4" >主要用途</th >
                </tr >
            </table >
            <div style = "overflow-y: auto;height: 170px;" class = "row-fluid" id = "tableTD" >
                <table class = "table table-hover" >
                    <tr >
                        <td class = "col-lg-3" >杀鼠迷</td >
                        <td class = "col-lg-3" >鼠害</td >
                        <td class = "col-lg-3" >劫家鼠</td >
                    </tr >
                    <tr >
                        <td >敌敌畏</td >
                        <td >鼠害</td >
                        <td >松鼠</td >
                    </tr >
                    <tr >
                        <td >灭扫利油</td >
                        <td >虫害</td >
                        <td >松毛虫</td >
                    </tr >
                    <tr >
                        <td >杀鼠迷</td >
                        <td >鼠害</td >
                        <td >劫家鼠</td >
                    </tr >
                    <tr >
                        <td >杀鼠迷</td >
                        <td >鼠害</td >
                        <td >劫家鼠</td >
                    </tr >
                </table >
            </div >
            </table>
        </div >
        <br />
        <!--分页按钮-->
        <div class = "row-fluid" >
            <div class = "span12" >
                <div >
                    <button id = "previousPage" class = "btn btn-sm" type = "button" style = "line-height:0px" >
                        <span class = "glyphicon glyphicon-chevron-left" ></span >
                    </button >
                    <input id = "pageNum" type = "text" style = "width: 40px;height: 20px" />
                    <label >/10</label >
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
                <button class = "btn" type = "button" onclick = "jump('#mousePanelDiv','html/mouseAdd.html')" >添加新鼠害</button >
            </div >
            <div class = "col-sm-2 col-lg-2" >
                <button class = "btn" type = "button" onclick = "jump('#mousePanelDiv','html/mouseInfo.html')" >查看详细信息</button >
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
                                <input type = "text" class = "form-control" id = "name" >
                            </div >
                            <div class = "col-lg-4 col-sm-4" style = "float: left" >
                                <button id = "search" type = "submit" class = "btn" >查找</button >
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
