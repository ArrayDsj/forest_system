<!DOCTYPE html>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<html>
<head>
    <meta charset = "UTF-8">
    <title>会商灾情</title>
</head>
<body>
<div id = "conferAddDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    专家会商
                </h3>
            </div>
        </div>
        <!--内容-->
        <div style = "margin-left:50px;margin-top: 10px">
            <!--表单-->
            <form class = "form-horizontal" role = "form" action = "javascript:void(0)" onsubmit = "jump(
            '#conferAddDiv','html/conferPanel.html')">
                <!--左边-->
                <div id = "left" style = "width: 370px;height: 290px;float: left">
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 5px">
                        <span class = "col-lg-4  control-label ">事件名称:</span>
                        <span class = "col-lg-4  control-label ">XXXXXXX</span>
                    </div>
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 5px">
                        <span class = "col-lg-4  control-label ">时间:</span>
                        <span class = "col-lg-4  control-label ">xxxx-xx-xx</span>
                    </div>
                    <!--第三行-->
                    <div class = "row" style = "margin-top:5px">
                        <span class = "col-lg-4  control-label ">灾情阶段:</span>
                        <span class = "col-lg-4  control-label ">xxxxxxxx</span>
                    </div>
                    <!--第四行-->
                    <div class = "row" style = "margin-top: 5px">
                        <span class = "col-lg-4  control-label ">灾情描述:</span>
                        <span class = "col-lg-6 col-sm-10 control-label ">修剪清除枯叶危害,结茧的幼虫在成虫发生期用黑光灯诱杀,25%灭有说赶紧上课金额嗡嗡</span>
                    </div>
                    <!--第五行-->
                    <div class = "row" style = "margin-top: 10px;margin-left:-45px;">
                        <div class = "form-group" style = "float: left">
                            <label for = "status" class = "col-lg-4 col-sm-4  control-label ">发病状态:</label>
                            <div class = "col-lg-8 col-sm-6">
                                <textarea rows = "3" cols = "30" class = "form-control" id = "status" ></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <!--右边-->
                <div id = "right" style = "width: 370px;height: 290px;float: left;margin-left: 10px">
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 5px">
                        <span class = "col-lg-4  control-label ">幼虫图片:</span>
                        <img src = "image/yworm.jpg" />
                    </div>
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 5px">
                        <span class = "col-lg-4  control-label ">事件名称:</span>
                        <span class = "col-lg-4  control-label ">XXXXXXX</span>
                    </div>
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 5px">
                        <div class = "form-group" style = "float: left">
                            <label for = "name" class = "col-lg-4 col-sm-4   control-label ">会商人员:</label>
                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "name">
                            </div>
                        </div>
                    </div>
                    <!--第四行-->
                    <div class = "row">
                        <div class = "form-group " style="margin-left: 100px">
                            <button type = "submit" class = "btn btn-default">添加会商信息</button>
                            <button type = "reset" class = "btn btn-default" onclick= "jump(
            '#conferAddDiv','expertconsultation/conferPanel.jsp')">返回</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!--foot-->
        <div id = "foot" style = "width: 750px;height: 150px;margin-top: 300px;margin-left: 50px">
            <!--表格-->
            <div class = "row-fluid" style = "border: solid">
                <!--表头-->
                <table class = "table table-hover active">
                    <tr>
                        <th class = "col-lg-4 col-sm-4">日期</th>
                        <th class = "col-lg-4 col-sm-4">会商人员</th>
                        <th class = "col-lg-4 col-sm-4">会商结果</th>
                    </tr>
                </table>
                <div style = "overflow-y: auto;height: 100px;" class = "row-fluid" id = "tableTD">
                    <table class = "table table-striped table-bordered table-hover table-condensed">
                        <tr>
                            <td class = "col-lg-3 col-sm-4">2013-29</td>
                            <td class = "col-lg-3 col-sm-4">何大海、张玉宁、王鹏</td>
                            <td class = "col-lg-3 col-sm-4">大量放置鼠笼，定期清除</td>
                        </tr>
                        <tr>
                            <td>2015-10-10</td>
                            <td>刘松</td>
                            <td>无意见，不懂！</td>
                        </tr>
                    </table>
                </div>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>