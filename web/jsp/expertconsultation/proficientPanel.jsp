<!DOCTYPE html>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<html>
<head>
    <meta charset = "UTF-8">
    <title>专家一览</title>
    <style>
        #proficientPanelDiv {
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
<div id = "proficientPanelDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    专家一览
                </h3>
            </div>
        </div>
        <!--表格-->
        <div class = "row-fluid" style = "border: solid">
            <table class = "table table-hover active">
                <tr>
                    <th class = "col-lg-3 col-sm-3">姓名</th>
                    <th class = "col-lg-2 col-sm-2">工作单位</th>
                    <th class = "col-lg-3 col-sm-3">专长</th>
                    <th class = "col-lg-2 col-sm-2">职务</th>
                    <th class = "col-lg-2 col-sm-2">电话</th>
                </tr>
            </table>

            <div style = "overflow-y: auto;height: 170px;" class = "row-fluid" id = "tableTD">
                <table class = "table table-striped table-bordered table-hover table-condensed">
                    <tr>
                        <td class = "col-lg-3 col-sm-3">李鹏</td>
                        <td class = "col-lg-2 col-sm-2">成都森林灾害防治中心</td>
                        <td class = "col-lg-3 col-sm-3">虫害防治</td>
                        <td class = "col-lg-2 col-sm-2">研究员</td>
                        <td class = "col-lg-2 col-sm-2">13888888888</td>
                    </tr>
                    <tr>
                        <td>何玉瑞</td>
                        <td>雅安市鼠害研究所</td>
                        <td>鼠害防治</td>
                        <td>教授</td>
                        <td>13888888888</td>
                    </tr>
                    <tr>
                        <td>陶大宇</td>
                        <td>成都生物研究所</td>
                        <td>鼠害防治</td>
                        <td>副教授</td>
                        <td>13888888888</td>
                    </tr>
                    <tr>
                        <td>麦耿</td>
                        <td>成都森林灾害防治中心</td>
                        <td>森林病害防治</td>
                        <td>教授</td>
                        <td>13888888888</td>
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
        <div id = "leftBtns" style = "float: left">
            <div class = "row-fluid">
                <div class = "col-lg-3 col-sm-2 col-sm-offset-2">
                    <button class = "btn" type = "button" onclick = "jump('#proficientPanelDiv','expertconsultation/proficientAdd.jsp')">添加专家</button>
                </div>
                <div class = "col-lg-3 col-sm-2 col-sm-offset-3">
                    <button class = "btn" type = "button" onclick = "jump('#proficientPanelDiv','expertconsultation/proficientShow.jsp')">查看专家息</button>
                </div>
            </div>
            <div class = "row-fluid">
                <div class = "col-lg-3 col-sm-3 col-sm-offset-2" style = "margin-top: 20px">
                    <button class = "btn" type = "button" onclick = "jump('#proficientPanelDiv','expertconsultation/proficientUpdate.jsp')">修改专家信息</button>
                </div>
                <div class = "col-lg-3 col-sm-3 col-sm-offset-3" style = "margin-top: 20px">
                    <button class = "btn" type = "button" onclick = "del()">删除专家</button>
                </div>

            </div>
        </div>

        <div class = "row-fluid" id = "rightBtns" style = "float: left; ">
            <!--xs自动 lg>=1200px sm<=768px offset列移动-->
            <div  style = "margin-top: -84px;margin-left: 440px">
                <fieldset>
                    <legend>查询专家信息</legend>
                    <div class = "row">
                        <div class = " col-lg-6 col-sm-6">
                            <div class = "input-group">
                                <div class = "input-group-btn">
                                    <button id = "selected" type = "button" class = "btn btn-default dropdown-toggle" data-toggle =
                                            "dropdown">专家姓名<span class = "caret"></span><!--这个span的作用是提供一个下拉图标-->
                                    </button>
                                    <ul id = "ul" class = "dropdown-menu">
                                        <li><a href = "javascript:void(0)">专长</a></li>
                                        <li><a href = "javascript:void(0)">工作单位</a></li>
                                    </ul>
                                </div>
                                <input id = "inputText" type = "text" class = "form-control" style = "width: 130px">
                            </div>
                        </div>
                        <div class = "col-lg-6 col-sm-6">
                            <button id = "search" type = "submit" class = "btn">查找</button>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
</div>

<script>

    function del() {
        alert("删除专家");
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

    //查询模块事件

</script>
</body>
</html>