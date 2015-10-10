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
        <div class = "row-fluid" style = "border: solid" >
            <table class = "table table-hover" >
                <tr class = "active" >
                    <th class = "col-lg-3" >小班名称</th >
                    <th class = "col-lg-3" >负责人</th >
                    <th class = "col-lg-3" >负责人电话</th >
                    <th class = "col-lg-3" >负责区域</th >
                </tr >
            </table >
            <div style = "overflow-y: auto;height: 170px;" class = "row-fluid" id = "tableTD" >
                    <table class = "table table-striped table-bordered table-hover table-condensed" >
                    <tr >
                        <td class = "col-lg-3" >雅林一班</td >
                        <td class = "col-lg-3" >何元庆</td >
                        <td class = "col-lg-3" >13754821641</td >
                        <td class = "col-lg-3" >雅林一号地区</td >
                    </tr >
                    <tr >
                        <td >雅林二班</td >
                        <td >于华龙</td >
                        <td >13954842587</td >
                        <td >雅安二号地区</td >
                    </tr >
                    <tr >
                        <td >卧龙一班</td >
                        <td >杨再兴</td >
                        <td >15087564158</td >
                        <td >卧龙二号地区</td >
                    </tr >
                    <tr >
                        <td >卧龙二班</td >
                        <td >地雷</td >
                        <td >15246875420</td >
                        <td >卧龙四号地区</td >
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
        <div id = "leftBtns" style = "float: left" >
            <div class = "row-fluid" >
                <div class = "col-lg-3 col-sm-2 col-sm-offset-2" >
                    <button class = "btn" type = "button" onclick = "jump('#classPanelDiv','disastercontrol/classAdd.jsp')" >添加小班</button >
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
            <div class = "col-xs-3 col-lg-6 col-sm-6  col-sm-offset-4" style = "margin-top: -85px;margin-left: 400px" >
                <fieldset >
                    <legend >查询小班信息</legend >
                    <div class = "row" >
                        <div class = "col-xs-10 col-sm-6 col-lg-6" >
                            <div class = "input-group" >
                                <div class = "input-group-btn" >
                                    <button id = "selected" type = "button" class = "btn btn-default dropdown-toggle" data-toggle =
                                            "dropdown" >小班名称<span class = "caret" ></span ><!--这个span的作用是提供一个下拉图标-->
                                    </button >
                                    <ul id = "ul" class = "dropdown-menu" >
                                        <li ><a href = "javascript:void(0)" >负责人</a ></li >
                                        <li ><a href = "javascript:void(0)" >负责人电话</a ></li >
                                        <li ><a href = "javascript:void(0)" >负责区域</a ></li >

                                    </ul >
                                </div >
                                <!-- /btn-group -->
                                <input id = "inputText" type = "text" class = "form-control" style = "width: 130px" >
                            </div >
                            <!-- /input-group -->
                        </div >
                        <div class = "col-lg-6 col-sm-6" >
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
