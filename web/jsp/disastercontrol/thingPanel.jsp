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

            <div style = "overflow-y: auto;height: 170px;" class = "row-fluid" id = "tableTD" >
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
                    <button class = "btn" type = "button" onclick = "jump('#thingPanelDiv','disastercontrol/thingAdd.jsp')" >添加事件</button >
                </div >
                <div class = "col-lg-3 col-sm-2 col-sm-offset-2" >
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
            <div class = "col-xs-3 col-lg-6 col-sm-6  col-sm-offset-4" style = "margin-top: -165px;margin-left: 440px" >
                <fieldset >
                    <legend >查询事件信息</legend >
                    <div class = "row" >
                        <div class = "col-xs-10 col-sm-6 col-lg-6" >
                            <div class = "input-group" >
                                <div class = "input-group-btn" >
                                    <button id = "thingInfo" type = "button" class = "btn btn-default dropdown-toggle" data-toggle =
                                            "dropdown" >事件名称<span class = "caret" ></span ><!--这个span的作用是提供一个下拉图标-->
                                    </button >
                                    <ul id = "ul" class = "dropdown-menu" >
                                        <li ><a href = "javascript:void(0)" >灾情状态</a ></li >
                                        <li ><a href = "javascript:void(0)" >发生位置</a ></li >
                                        <li ><a href = "javascript:void(0)" >防治方案</a ></li >

                                    </ul >
                                </div >
                                <!-- /btn-group -->
                                <input id = "inputText" type = "text" class = "form-control" style = "width: 130px" >
                            </div >
                            <!-- /input-group -->
                        </div >
                        <div class = "col-lg-6 col-sm-6" >
                            <button id = "search1" type = "submit" class = "btn" >查找</button >
                        </div >
                    </div >
                </fieldset >
            </div >
            <div class = "col-xs-3 col-lg-6 col-sm-6  col-sm-offset-4" style = "margin-top: -60px;margin-left: 440px" >
                <fieldset >
                    <legend >日期查询</legend >

                    <!--<div id="datetimepicker" class = "input-group date form_date col-md-5" data-date = "" data-date-format = "" data-link-field = "dtp_input2"-->
                         <!--data-link-format = "yyyy-mm-dd">-->
                        <!--<input class = "form-control" size = "16" type = "text" value = "" readonly>-->
                        <!--<span  class = "input-group-addon">-->
                            <!--<span class = "glyphicon glyphicon-remove"></span>-->
                        <!--</span>-->
                        <!--<span  class = "input-group-addon">-->
                            <!--<a  href = "javascript:void(0)" onclick = "time()"><span class = "glyphicon glyphicon-calendar"></span></a>-->
                        <!--</span>-->
                    <!--</div>-->

                    <div class = "row" >
                        <div style = "float: left;margin-top:5px" >
                            <label class = "control-label col-lg-12" >起始日期</label >
                        </div >
                        <div style = "float: left" >
                            <input id = "start" type = "date" style = "display: none" />
                            <input id = "inputStart" type = "text" class = "form-control" style = "width: 150px" />
                        </div >
                        <div style = "float: left;margin-top:1px" >
                            <button type = "button" class = "btn btn-default btn-sm" onclick = "startDate()" >
                                <span class = "glyphicon glyphicon-calendar" ></span >
                            </button >
                        </div >
                    </div >
                    <div class = "row" >
                        <div style = "float: left;margin-top:5px" >
                            <label class = "control-label col-lg-12" >结束日期</label >
                        </div >
                        <div style = "float: left" >
                            <input id = "end" type = "date" style = "display: none" />
                            <input id = "inputEnd" type = "text" class = "form-control" style = "width: 150px" />
                        </div >
                        <div style = "float: left;margin-top:1px" >
                            <button type = "button" class = "btn btn-default btn-sm" onclick = "endDate()" >
                                <span class = "glyphicon glyphicon-calendar" ></span >
                            </button >
                        </div >
                        <div style = " float: left;margin-left: 10px" >
                            <button id = "search" type = "submit" class = "btn" >查找</button >
                        </div >
                    </div >
                </fieldset >
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

    //    function time(){
    //        alert("ssss");
    //        $('#aaaaa').datetimepicker({
    //            language: 'zh-CN', /*加载日历语言包，可自定义*/
    //            weekStart: 1,
    //            todayBtn: 1,
    //            autoclose: 1,
    //            todayHighlight: 1,
    //            startView: 2,
    //            minView: 2,
    //            forceParse: 0
    //        });
    //    }
</script >
</body >
</html >
