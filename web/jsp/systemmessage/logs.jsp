<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<meta charset = "UTF-8">
    <title>日志一览</title>
    <style>
        #logsDiv {
            background-color: silver;
            width: 920px;
            height: 500px;
            margin-left: 0px;
            margin-top: 0px;
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
<div id = "logsDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    日志一览
                </h3>
            </div>
        </div>

        <!--表格-->
        <div class = "row-fluid" style = "border: solid">
            <table class = "table table-hover active">
                <tr >
                    <th class = "col-lg-3 col-sm-3">日志内容</th>
                    <th class = "col-lg-3 col-sm-3">日期</th>
                </tr>
            </table>
            <div style = "overflow-y: auto;overflow-x: auto;height: 170px;" class = "row-fluid" id = "tableTD">
                <table class = "table table-striped table-bordered table-hover table-condensed" >
                    <tr class="rom">
                        <td class = "col-lg-3 col-sm-3">资料管理员xxx登陆成功</td>
                        <td class = "col-lg-3 col-sm-3">2013-04-05 09：13：53</td>
                    </tr>
                    <tr>
                        <td>用户b试图非法登陆</td>
                        <td>2013-04-10 14：09：10</td>
                    </tr>
                    <tr>
                        <td>灾情防止管理员c登陆成功</td>
                        <td>2012-11-11 11：11：11</td>
                    </tr>
                    <tr>
                        <td>专家管理员v登陆成功</td>
                        <td>2011-1-11 12：22：11</td>
                    </tr>
                    <tr>
                        <td>超级管理员admin登陆成功</td>
                        <td>2013-3-29 13：33：33</td>
                    </tr>
                    <tr>
                        <td>超级管理员cc登陆成功</td>
                        <td>2013-3-29 13：44：33</td>
                    </tr>
                    <tr>
                        <td>超级管理员dd登陆成功</td>
                        <td>2013-3-29 13：22：33</td>
                    </tr>
                    <tr>
                        <td>超级管理员gg登陆成功</td>
                        <td>2013-3-29 13：11：33</td>
                    </tr>
                </table>
            </div>
            </table>
        </div>
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
        <div class = "col-xs-3 col-lg-6 col-sm-6  col-sm-offset-4" style = "margin-top: -40px;margin-left: 320px" >
                <%--时间控件--%>
                <form action = "" class = "form-horizontal" role = "form" >
                <fieldset >
                    <legend >日期查询</legend >
                    <div class = "form-group " style = "margin-top: -15px" >
                        <label class = "col-md-3 control-label" >起始日期</label >
                        <div id = "datetimepickerStar" class = "input-group date form_date col-md-6" data-date = "" data-date-format =
                                "dd MM yyyy"
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
                             data-date-format = "dd MM yyyy"
                             data-link-format = "yyyy-mm-dd" >
                            <input class = "form-control" size = "10" type = "text" value = "" readonly = "readonly"
                                   onclick = "selectTime()" >
                            <span class = "input-group-addon" ><span class = "glyphicon glyphicon-remove" ></span ></span >
                            <span class = "input-group-addon" ><span class = "glyphicon glyphicon-calendar"
                                                                     onclick = "selectTime('datetimepickerEnd')" ></span ></span >
                        </div >
                        <button type = "button" class = "btn" onclick = "submitQuery('inputText')"
                                style = "margin-top: -34px;margin-left: 350px;" >查找
                        </button >
                    </div >

                </fieldset >
                </form >
            </div >
    </div>
</div>

<script>
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

</script>
</body>
</html>
