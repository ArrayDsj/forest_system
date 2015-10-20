<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/10
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


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
        <div class = "row-fluid table-responsive" style = "border: solid" >
            <table class = "table table-hover active table-striped table-bordered" >
                <tr >
                    <th class = "col-md-2" >事件名称</th >
                    <th class = "col-md-2" >日期</th >
                    <th class = "col-md-2" >发生位置</th >
                    <th class = "col-md-3" >防治方案</th >
                    <th class = "col-md-3" >灾情状态</th >
                </tr >
            </table >

            <div id = "tableTD" class = "row-fluid" style = "overflow-y: auto;height: 208px;margin-top: -20px" >
                    <table class = "table table-striped table-bordered table-hover table-condensed" >

                    <c:if test = "${requestScope.info == null}" >
                    <c:forEach items = "${requestScope.allThings}" var = "thing" >
                        <tr onclick = "select(this,'#selectID','#stageID','#status')" >
                            <input type = "hidden" value = "${thing.id}" status = "${thing.status}" />
                            <td class = "col-md-2" >${thing.name}</td >
                            <td class = "col-md-2" >${thing.foundDay}</td >
                            <td class = "col-md-2" >${thing.areaBean.name}</td >
                            <td class = "col-md-3" >${thing.scheme}</td >
                            <td class = "col-md-3" stageID = "${thing.stage.id}" >${thing.stage.name}</td >
                        </tr >
                    </c:forEach >
                    </c:if >
                </table >
                <%--保存被选中的事件id 和状态--%>
                <input type = "hidden" value = "-1" id = "selectID" name = "selectID" />
                <input type = "hidden" value = "-1" id = "stageID" name = "stageID" />
                <input type = "hidden" value = "-1" id = "status" name = "status" />
            </div >
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
                            "width: 45px;height: 25px;margin-left: 2px;margin-top: 2px;float:left"
                    <%--当前页数--%>
                           value = "${requestScope.pageNow}"
                            />
                    <label id = "num" name = "num" style = "margin-left: 2px" >
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
                    <button class = "btn" type = "button" onclick = " addThing()" >添加事件
                    </button >
                </div >
                <div class = "col-lg-3 col-sm-2 col-sm-offset-3 col-lg-offset-2" >
                    <button class = "btn" type = "button" onclick = "showThing('#selectID')" >查看事件信息</button >
                </div >
            </div >
            <div class = "row-fluid" >
                <div class = "col-lg-3 col-sm-3 col-sm-offset-2" style = "margin-top: 20px" >
                    <button class = "btn" type = "button" onclick = "ask()" >申请专家会审</button >
                </div >
                <div class = "col-lg-3 col-sm-3 col-sm-offset-2" style = "margin-top: 20px" >
                    <button class = "btn" type = "button" onclick = "updateThing()" >修改事件信息</button >
                </div >
            </div >
        </div >
        <!--查询-->
        <div class = "row-fluid" id = "rightBtns" style = "float: left; " >
            <!--xs自动 lg>=1200px sm<=768px offset列移动-->
            <div class = "col-xs-3 col-lg-6 col-sm-6  col-sm-offset-4" style = "margin-top: -175px;margin-left: 440px" >
                <fieldset >
                    <legend >查询事件信息</legend >
                    <div class = "row" style = "margin-top: -15px;margin-left:10px" >
                        <div class = "col-xs-10 col-sm-6 col-lg-6" >
                            <div class = "input-group" >
                                <div class = "input-group-btn" >
                                    <button name = "t" id = "selected" type = "button" class = "btn btn-default dropdown-toggle"
                                            data-toggle = "dropdown" >事件名称<span >&nbsp;</span ><span class = "caret" ></span >
                                    </button >
                                        <ul id = "ul" class = "dropdown-menu" >
                                            <li ><a id = 'li1' name = "s" href = "#"
                                                    onclick = "return querySelect(this,'selected')" >灾情状况</a ></li >
                                            <li ><a id = 'li2' name = "a" href = "#"
                                                    onclick = "return querySelect(this,'selected')" >发生位置</a ></li >
                                        </ul >
                                </div >
                                <!-- /btn-group -->
                                <input id = "inputText" type = "text" class = "form-control" style = "width: 130px" value = "" >
                            </div >
                            <!-- /input-group -->
                        </div >
                        <div class = "col-lg-5 col-sm-5" style = "margin-left: 20px" >
                            <button type = "button" class = "btn"
                                    onclick = "submitQuery('#inputText','#thingPanelDiv','../thingPanel.av','1')" >查找</button >
                        </div >
                    </div >
                </fieldset >
            </div >

            <div class = "col-xs-3 col-lg-6 col-sm-6  col-sm-offset-4" style = "margin-left: 440px;margin-top: -100px" >
                <%--时间控件--%>
            <fieldset >
                <legend >日期查询</legend >
                <div class = "form-group " style = "margin-top: -15px" >
                    <label class = "col-md-3 control-label" >起始日期</label >
                    <div id = "datetimepickerStar" class = "input-group date form_date col-md-6" data-date = "" data-date-format =
                            "yyyy-mm-dd"
                         data-link-format = "yyyy-mm-dd" >
                        <input id = "start" class = "form-control" size = "10" type = "text" value = "" readonly = "readonly" onclick =
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
                        <input id = "end" class = "form-control" size = "10" type = "text" value = "" readonly = "readonly"
                               onclick = "selectTime('start')" >
                        <span class = "input-group-addon" ><span class = "glyphicon glyphicon-remove" ></span ></span >
                        <span class = "input-group-addon" ><span class = "glyphicon glyphicon-calendar"
                                                                 onclick = "selectTime('datetimepickerEnd')" ></span ></span >
                    </div >
                    <button id = "queryByDate" type = "button" class = "btn" style = "margin-top: -34px;margin-left: 350px;" >查找
                    </button >
                </div >
            </fieldset >
        </div >
    </div >
</div >
<script type = "text/javascript" >

    function addThing() {
//        点击添加按钮的时候请求下拉列表数据
        $("#thingPanelDiv").load("../thingAdd.av", {'header': 'askAddThing'}, function (data) {
            //jump('#thingPanelDiv', 'disastercontrol/thingAdd.jsp');
        })
    }

    function showThing(id) {
        var thingID = $(id).val();
        if (thingID != -1) {
            //请求初始化数据
            $("#thingPanelDiv").load("../thingShow.av", {'thingID': thingID, 'header': 'showThing'}, function (data) {
            })
        } else alert("请选择要查看的列");

    }

    //申请专家会审
    function ask() {
        var thingID = $("#selectID").val();
        var stageID = $("#stageID").val();
        var status = $("#status").val();
        //未选择行报错
        if (thingID == -1) {
            alert("请选择要查看的列");
            return false;
        }
        //只有当状态为无法解决的时候才能申请
        else if (stageID != 3) {
            alert("无需专家会审");
            return false;
        }
        else if (status == 1) {
            alert("不能再次申请");
            return false;
        } else {
            //改变事件的状态为1
            $.ajax({
                type: 'POST',
                url: '../thingAdd.av',
                data: {'header': 'askConfer', 'thingID': thingID},
                cache: false,
                dataType: 'json',
//                contentType: false,
//                processData: false,
                success: function (data) {
                    var jsonObj = eval("(" + data + ")");
                    alert(data);
                    if (data.msg == 'success') {
                        alert(data.msg);
                    } else alert("系统繁忙,请稍后重试");
                }
            });
            alert("申请成功");
        }
    }

    //修改信息
    function updateThing() {
        var thingID = $("#selectID").val();
        //未选择行报错
        if (thingID == -1) {
            alert("请选择要查看的列");
            return false;
        }
        //请求初始化数据
        $("#thingPanelDiv").load("../thingShow.av", {'header': 'updateThing', 'thingID': thingID}, function (data) {
        })
    }


    //事件处理
    //上一页事件
    $("#previousPage").click(function () {
        if (parseInt${requestScope.pageNow} > 1)
            $("#thingPanelDiv").load("../thingPanel.av", {"pageNow": ${requestScope.pageNow} -1});
        else alert("已是第一页！");
    });

    //下一页事件
    $("#nextPage").click(function () {
        if (${requestScope.pageNow} < ${requestScope.pageNum})
            $("#thingPanelDiv").load("../thingPanel.av", {"pageNow": ${requestScope.pageNow} +1});
        else alert("已是最后一页！");
    });

    //跳转到指定页点击事件
    $("#go").click(function () {
        var num = $("#pageNow").val();
        $("#thingPanelDiv").load("../thingPanel.av", {"pageNow": num});
    });





    $("#queryByDate").click(function () {
        var start = $("#start").val();
        var end = $("#end").val();
        if (start > end) {
            alert("您选择的时间有误，请重新选择！");
            $("#thingPanelDiv").load("../thingTime.av", {"pageNow": 1});
        }
        else
            $("#thingPanelDiv").load("../thingTime.av", {"pageNow": 1, "start": $("#start").val(), "end": $("#end").val()})
    });


</script >
 </body >
</html >
