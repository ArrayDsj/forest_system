<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/10
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<!DOCTYPE html>
<html lang = "en" >
<head >
    <meta charset = "UTF-8" >
    <title >区域一览</title >
    <style >
        #areaPanelDiv {
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
<div id = "areaPanelDiv" >
    <div class = "container-fluid" >
        <!--标题-->
        <div class = "row-fluid" >
            <div class = "span12" >
                <h3 class = "text-center" >
                    区域一览
                </h3 >
            </div >
        </div >
        <!--表格-->
        <div class = "row-fluid" style = "border: solid" >
            <table class = "table table-hover active" >
                <tr  >
                    <th class = "col-lg-3" >区域名称</th >
                    <th class = "col-lg-2" >林种</th >
                    <th class = "col-lg-3" >地类</th >
                    <th class = "col-lg-2" >优势树种</th >
                    <th class = "col-lg-2" >负责小班</th >
                </tr >
            </table >

            <div style = "overflow-y: auto;height: 170px;" class = "row-fluid" id = "tableTD" >
                    <table class = "table table-striped table-bordered table-hover table-condensed" >
                    <tr >
                        <td class = "col-lg-3" >雅林一号地区</td >
                        <td class = "col-lg-2" >白杨林</td >
                        <td class = "col-lg-3" >林地</td >
                        <td class = "col-lg-2" >柏树</td >
                        <td class = "col-lg-2" >雅林一般</td >
                    </tr >
                    <tr >
                        <td >雅安三号地区</td >
                        <td >郑阔林</td >
                        <td >林地</td >
                        <td >松树</td >
                        <td >雅安一班</td >
                    </tr >
                    <tr >
                        <td >卧龙二号地区</td >
                        <td >桐树</td >
                        <td >疏林地</td >
                        <td >泡桐</td >
                        <td >卧龙一班</td >
                    </tr >
                    <tr >
                        <td >卧龙自然保护区</td >
                        <td >竹林</td >
                        <td >灌木林</td >
                        <td >剑灵</td >
                        <td >卧龙二班</td >
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
        <div class = "row-fluid" >
            <div class = "col-lg-3 col-sm-2 col-sm-offset-2" >
                <button class = "btn" type = "button" onclick = "jump('#areaPanelDiv','disastercontrol/areaAdd.jsp')" >添加区域</button >
            </div >

            <!--xs自动 lg>=1200px sm<=768px offset列移动-->
            <div class = "col-xs-3 col-lg-6 col-sm-6 col-lg-offset-1 col-sm-offset-1" >
                <fieldset >
                    <legend >查询区域信息</legend >
                    <div class = "row" >
                        <div class = "col-xs-10 col-sm-6" >
                            <div class = "input-group" >
                                <div class = "input-group-btn" >
                                    <button id = "selected" type = "button" class = "btn btn-default dropdown-toggle" data-toggle =
                                            "dropdown" >区域名称<span class = "caret" ></span ><!--这个span的作用是提供一个下拉图标-->
                                    </button >
                                    <ul id = "ul" class = "dropdown-menu" >
                                        <li ><a href = "javascript:void(0)" >林种</a ></li >
                                        <li ><a href = "javascript:void(0)" >地类</a ></li >
                                        <li ><a href = "javascript:void(0)" >优势树种</a ></li >
                                        <li ><a href = "javascript:void(0)" >负责小班</a ></li >
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
