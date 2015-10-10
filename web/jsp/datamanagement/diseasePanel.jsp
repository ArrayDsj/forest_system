<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/9
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
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
        <div class = "row-fluid" style = "border: solid" >
            <!--表头-->
            <table class = "table table-hover active" >
                <tr >
                    <th class = "col-lg-3" >名称</th >
                    <th class = "col-lg-3" >主要危害</th >
                    <th class = "col-lg-6" >发病规律</th >
                </tr >
            </table >
            <div style = "overflow-y: auto;height: 170px;" class = "row-fluid" id = "tableTD" >
                <table class = "table table-striped table-bordered table-hover table-condensed" >
                    <tr >
                        <%--到时候直接循环输入信息--%>
                        <td id="name" class = "col-lg-3" >大叶黄杨白粉病</td >
                        <td id="harm" class = "col-lg-3" >危害黄杨叶片,影响光合,影响生长</td >
                        <td id="rule" class = "col-lg-6" >春秋两季发生严重</td >
                    </tr >
                    <%--删除开始--%>
                    <tr >
                        <td >紫薇白粉病</td >
                        <td >植株矮小,嫩叶扭曲,变小,枝条畸形</td >
                        <td >4月份开始发生,6月份趋于严重</td >
                    </tr >
                    <tr >
                        <td >杨树细菌性溃疡</td >
                        <td >木材都变色,中心腐烂</td >
                        <td >春天潮湿多雨时发病</td >
                    </tr >
                    <tr >
                        <td >青枯病</td >
                        <td >植株迅速枯焉</td >
                        <td >气温达到20度时开始发病</td >
                    </tr >
                    <tr >
                        <td >青枯病</td >
                        <td >植株迅速枯焉</td >
                        <td >气温达到20度时开始发病</td >
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
                <button class = "btn" type = "button" onclick = "jump('#diseasePanelDiv','html/diseaseAdd.html')" >添加新病害</button >
            </div >
            <div class = "col-sm-2 col-lg-2" >
                <button class = "btn" type = "button" onclick = "jump('#diseasePanelDiv','html/diseaseInfo.html')" >查看详细信息</button >
            </div >
            <!--xs自动 lg>=1200px sm<=768px offset列移动-->
            <div class = "col-xs-3 col-lg-6 col-sm-6 col-lg-offset-1 col-sm-offset-1" >
                <fieldset >
                    <legend >查询病害信息</legend >
                    <div class = "row" >
                        <div class = "col-xs-10 col-sm-6" >
                            <div class = "input-group" >
                                <div class = "input-group-btn" >
                                    <button id = "selected" type = "button" class = "btn btn-default dropdown-toggle" data-toggle =
                                            "dropdown" >病害名<span class = "caret" ></span ><!--这个span的作用是提供一个下拉图标-->
                                    </button >
                                    <ul id = "ul" class = "dropdown-menu" >
                                        <li ><a href = "javascript:void(0)" >危害</a ></li >
                                        <li ><a href = "javascript:void(0)" >发病症状</a ></li >
                                    </ul >
                                </div >
                                <!-- /btn-group -->
                                <input id = "inputText" type = "text" class = "form-control" >
                            </div >
                            <!-- /input-group -->
                        </div >
                        <div class = "col-xs-6 col-sm-6" >
                            <button id = "search" type = "submit" class = "btn" >查找</button >
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