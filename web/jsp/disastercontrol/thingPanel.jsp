<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/10
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<!DOCTYPE html>
<html lang = "en" >
<head >
    <meta charset = "UTF-8" >
    <title >事件记录</title >

    <style >
        #thingPanelDiv {
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
<div id = "thingPanelDiv" >
    <div class = "container-fluid" >
        <!--标题-->
        <div class = "row-fluid" >
            <div class = "span12" >
                <h3 class = "text-center" >
                    事件记录
                </h3 >
            </div >
        </div >
        <!--表格-->
        <div class = "row-fluid" style = "border: solid" >
            <table class = "table table-hover" >
                <tr class = "active" >
                    <th class = "col-lg-2" >事件名称</th >
                    <th class = "col-lg-3" >日期</th >
                    <th class = "col-lg-3" >发生位置</th >
                    <th class = "col-lg-2" >防治方案</th >
                    <th class = "col-lg-2" >灾情状态</th >
                </tr >
            </table >

            <div id = "tableTD" class = "row-fluid" style = "overflow-y: auto;height: 208px;margin-top: -20px" >
                    <table class = "table table-striped table-bordered table-hover table-condensed" >
                    <tr >
                        <td class = "col-lg-2" >正西松毛虫事件</td >
                        <td class = "col-lg-3" >2013-2-3</td >
                        <td class = "col-lg-3" >雅安一号地区</td >
                        <td class = "col-lg-2" >硼砂敌百虫,黑光灯诱惑</td >
                        <td class = "col-lg-2" >已经得到控制</td >
                    </tr >
                    <tr >
                        <td >雅林鼠害事件</td >
                        <td >2013-2-3</td >
                        <td >雅安三号地区</td >
                        <td >大量放置捕捉老鼠的</td >
                        <td >已经得到控制</td >
                    </tr >
                    <tr >
                        <td >攀枝花枯萎病事件</td >
                        <td >2013-2-3</td >
                        <td >攀枝花一号地区</td >
                        <td >喷洒波美度十六合计</td >
                        <td >防治中</td >
                    </tr >
                    <tr >
                        <td >成都松林病害事件</td >
                        <td >2013-2-3</td >
                        <td >成都城北区</td >
                        <td >喷洒多菌灵</td >
                        <td >无法解决,申请专家会审</td >
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
        <div id = "leftBtns" style = "float: left" >
            <div class = "row-fluid" >
                <div class = "col-lg-3 col-sm-2 col-sm-offset-2" >
                    <button class = "btn" type = "button" onclick = "jump('#thingPanelDiv','disastercontrol/thingAdd.jsp')" >添加事件</button >
                </div >
                <div class = "col-lg-3 col-sm-2 col-sm-offset-3 col-lg-offset-2" >
                    <button class = "btn" type = "button" onclick = "jump('#thingPanelDiv','disastercontrol/thingInfo.jsp')" >查看事件信息</button >
                </div >
            </div >
            <div class = "row-fluid" >
                <div class = "col-lg-3 col-sm-3 col-sm-offset-2" style = "margin-top: 20px" >
                    <button class = "btn" type = "button" onclick = "ask()" >申请专家会审</button >
                </div >
                <div class = "col-lg-3 col-sm-3 col-sm-offset-2" style = "margin-top: 20px" >
                    <button class = "btn" type = "button" onclick = "jump('#thingPanelDiv','disastercontrol/thingUpdate.jsp')" >修改事件信息</button >
                </div >
            </div >
        </div >
        <!--查询-->
        <div class = "row-fluid" id = "rightBtns" style = "float: left; " >
            <!--xs自动 lg>=1200px sm<=768px offset列移动-->
            <div class = "col-xs-3 col-lg-6 col-sm-6  col-sm-offset-4" style = "margin-top: -175px;margin-left: 440px" >
                <fieldset >
                    <legend >查询事件信息</legend >
                    <div class = "row" style="margin-top: -15px;margin-left:10px">
                        <div class = "col-xs-10 col-sm-6 col-lg-6" >
                            <div class = "input-group" >
                                <div class = "input-group-btn" >
                                    <button name = "name" id = "selected" type = "button" class = "btn btn-default dropdown-toggle"
                                            data-toggle = "dropdown" >事件名称<span >&nbsp;</span ><span class = "caret" ></span >
                                    </button >
                                        <ul id = "ul" class = "dropdown-menu" >
                                            <li ><a id = 'li1' name = "state" href = "#"
                                                    onclick = "return querySelect(this,'selected')" >灾情状况</a ></li >
                                            <li ><a id = 'li2' name = "place" href = "#"
                                                    onclick = "return querySelect(this,'selected')" >发生位置</a ></li >
                                        </ul >
                                </div >
                                <!-- /btn-group -->
                                <input id = "inputText" type = "text" class = "form-control" style = "width: 130px" >
                            </div >
                            <!-- /input-group -->
                        </div >
                        <div class = "col-lg-5 col-sm-5" style = "margin-left: 20px">
                            <button  type = "button" class = "btn" onclick = "submitQuery('inputText')" >查找</button >
                        </div >
                    </div >
                </fieldset >
            </div >

            <div class = "col-xs-3 col-lg-6 col-sm-6  col-sm-offset-4" style = "margin-top: -100px;margin-left: 440px" >
                <%--时间控件--%>
                <form action = "" class = "form-horizontal" role = "form" >
                <fieldset >
                    <legend >日期查询</legend >
                    <div class = "form-group " style="margin-top: -15px">
                        <label class = "col-md-3 control-label" >起始日期</label >
                        <div id = "datetimepickerStar" class = "input-group date form_date col-md-6" data-date = "" data-date-format =
                                "yyyy-mm-dd"
                             data-link-format = "yyyy-mm-dd" >
                            <input class = "form-control" size = "10" type = "text" value = "" readonly = "readonly" onclick =
                                    "selectTime()" >
                            <span class = "input-group-addon" ><span class = "glyphicon glyphicon-remove" ></span ></span >
                            <span class = "input-group-addon" ><span class = "glyphicon glyphicon-calendar"
                                                                     onclick = "selectTime('datetimepickerStar')" ></span ></span >
                        </div >
                    </div >
                    <div class = "form-group" style = "margin-top: -15px" >
                        <label class = "col-md-3 control-label" >结束日期</label >
                        <div id = "datetimepickerEnd" class = "input-group date form_date col-md-6" data-date = ""
                             data-date-format = "yyyy-mm-dd"
                             data-link-format = "yyyy-mm-dd" >
                            <input class = "form-control" size = "10" type = "text" value = "" readonly = "readonly"
                                   onclick = "selectTime()" >
                            <span class = "input-group-addon" ><span class = "glyphicon glyphicon-remove" ></span ></span >
                            <span class = "input-group-addon" ><span class = "glyphicon glyphicon-calendar"
                                                                     onclick = "selectTime('datetimepickerEnd')" ></span ></span >
                        </div >
                        <button type = "button" class = "btn" onclick = "submitQuery('inputText')" style="margin-top: -34px;margin-left: 350px;">查找
                        </button >
                    </div >

                </fieldset >
                </form >
            </div >
        </div >
    </div >
</div >

<script type = "text/javascript" >
    function ask() {
        alert("专家会审");
    }
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

    function startDate() {
        $("#start").click();
    }

    function endDate() {

    }
</script >
</body >
</html >
