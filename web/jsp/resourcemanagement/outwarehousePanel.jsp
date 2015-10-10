<!DOCTYPE html>
<%@ page contentType = "text/html;charset=UTF-8" language = "java" pageEncoding = "UTF-8" %>
<html lang = "en">
<head>
    <meta charset = "UTF-8">
    <title>出库管理</title>
    <style>
        #outwarehousePanelDiv {
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
<div id = "outwarehousePanelDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    药剂器械出库管理
                </h3>
            </div>
        </div>
        <!--表格-->
        <div class = "row-fluid" style = "border: solid">
            <table class = "table table-hover active">
                <tr >
                    <th class = "col-lg-3 col-sm-3">日期</th>
                    <th class = "col-lg-2 col-sm-2">名称</th>
                    <th class = "col-lg-3 col-sm-3">主要用途</th>
                    <th class = "col-lg-2 col-sm-2">领用数量</th>
                    <th class = "col-lg-2 col-sm-2">领用小班</th>
                </tr>
            </table>

            <div style = "overflow-y: auto;height: 170px;" class = "row-fluid" id = "tableTD" >
                    <table class = "table table-striped table-bordered table-hover table-condensed" >
                    <tr>
                        <td class = "col-lg-3 col-sm-3">2013-2-3</td>
                        <td class = "col-lg-2 col-sm-2">虫害</td>
                        <td class = "col-lg-3 col-sm-3">松鼠</td>
                        <td class = "col-lg-2 col-sm-2">87</td>
                        <td class = "col-lg-2 col-sm-2">领用小班</td>
                    </tr>
                    <tr>
                        <td>2013-2-3</td>
                        <td>鼠害</td>
                        <td>松鼠</td>
                        <td>22</td>
                        <td>领用小班</td>
                    </tr>
                    <tr>
                        <td>2013-2-3</td>
                        <td>虫害</td>
                        <td>松毛虫</td>
                        <td>32</td>
                        <td>领用小班</td>
                    </tr>
                    <tr>
                        <td>2013-2-3</td>
                        <td>鼠害</td>
                        <td>劫家鼠</td>
                        <td>11</td>
                        <td>领用小班</td>
                    </tr>
                    <tr>
                        <td>2013-2-3</td>
                        <td>鼠害</td>
                        <td>劫家鼠</td>
                        <td>17</td>
                        <td>领用小班</td>
                    </tr>
                </table>
            </div>
            </table>
        </div>
        <br />
        <!--分页按钮-->
        <div class = "row-fluid">
            <div class = "span12">
                <div>
                    <button id = "previousPage" class = "btn btn-sm" type = "button" style = "line-height:0px">
                        <span class = "glyphicon glyphicon-chevron-left"></span>
                    </button>
                    <input id = "pageNum" type = "text" style = "width: 40px;height: 20px" />
                    <label>/10</label>
                    <button id = "go" class = "btn btn-sm" type = "button" style = "line-height:0px">
                        <span class = "glyphicon glyphicon-step-forward"></span>
                    </button>
                    <button id = "nextPage" class = "btn  btn-sm" type = "button" style = "line-height:0px">
                        <span class = "glyphicon glyphicon-chevron-right"></span>
                    </button>
                </div>
            </div>
        </div>
        <br /><br />
        <!--按钮-->
        <div class = "row-fluid">
            <div class = "col-lg-3 col-sm-2 col-sm-offset-2">
                <button class = "btn" type = "button" onclick = "jump('#outwarehousePanelDiv','resourcemanagement/outwarehouseAdd.jsp')">添加出库信息</button>
            </div>

            <div id = "query" style = "margin-left: 400px;margin-top: -50px" class = "btn-group">
                <fieldset>
                    <legend>查询器械信息</legend>
                    起始日期：<input type = "date" /><br />
                    结束日期：<input type = "date" />

                    <div class = "btn-group">
                        <button type = "button" class = "btn btn-default"
                                style = "margin-left: 140px;margin-top: 30px">查询
                        </button>
                    </div>
                </fieldset>
            </div>
        </div>
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