<!DOCTYPE html>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<html >
<head>
    <meta charset = "UTF-8">
    <title>专家会商</title>
    <style>
        #conferPanelDiv {
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
<div id = "conferPanelDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    专家会商
                </h3>
            </div>
        </div>
        <!--表格-->
        <div class = "row-fluid" style = "border: solid">
            <table class = "table table-hover active">
                <tr >
                    <th class = "col-lg-2 col-sm-2">事件名称</th>
                    <th class = "col-lg-2 col-sm-2">日期</th>
                    <th class = "col-lg-2 col-sm-2">发生位置</th>
                    <th class = "col-lg-2 col-sm-2">防治方案</th>
                    <th class = "col-lg-4 col-sm-4">灾情状态</th>
                </tr>
            </table>

            <div style = "overflow-y: auto;height: 170px" class = "row-fluid" id = "tableTD">
                <table class = "table table-striped table-bordered table-hover table-condensed">
                    <tr>
                        <td class = "col-lg-2">卧龙鼠害事件</td>
                        <td class = "col-lg-2">2013-5-29</td>
                        <td class = "col-lg-2">卧龙自然保护区</td>
                        <td class = "col-lg-2">大量放置捕鼠笼</td>
                        <td class = "col-lg-4">无法解决，申请专家会商</td>
                    </tr>
                    <tr>
                        <td>成都松林病害事件</td>
                        <td>2013-5-30</td>
                        <td>成都城北区</td>
                        <td>喷洒多菌灵</td>
                        <td>无法解决，申请专家会商</td>
                    </tr>
                    
                </table>
            </div>
            </table>
        </div>
        <br />
        <br />
        <br />
        <!--按钮-->
        <div class = "row-fluid">
            <div class = "col-sm-offset-5">
                <button class = "btn" type = "button" onclick = "jump('#conferPanelDiv','expertconsultation/conferAdd.jsp')">专家会商</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>