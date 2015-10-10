<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/9
  Time: 22:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<html >
<head >
    <meta charset = "UTF-8" >
    <title >虫害一览</title >

    <link href = "../../css/Pager.css" rel = "stylesheet" type = "text/css" >

    <style >
        #wormPanelDiv {
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
    <div id = "wormPanelDiv" >
        <div class = "container-fluid" >
            <!--标题-->
            <div class = "row-fluid" >
                <div class = "span12" >
                    <h3 class = "text-center" >
                        虫害一览
                    </h3 >
                </div >
            </div >
            <!--表格-->
            <div class = "row-fluid " style = "border: solid" >
                <!--表头-->
                <table class = "table table-hover active" >
                    <tr >
                        <th class = "col-lg-3 col-sm-3" >名称</th >
                        <th class = "col-lg-3 col-sm-3" >寄主</th >
                        <th class = "col-lg-6 col-sm-6" >主要危害</th >
                    </tr >
                </table >
                <div style = "overflow-y: auto;height: 170px;" class = "row-fluid" id = "tableTD" >
                    <table class = "table table-striped table-bordered table-hover table-condensed" >

                        <tr >
                            <%--到时候直接循环输入信息--%>
                            <td id = "name" class = "col-lg-3" >黄刺蛾</td >
                            <td id = "host" class = "col-lg-3" >法桐,枫杨等</td >
                            <td id = "harm" class = "col-lg-6" >食叶片,影响树木生长造成树木死亡</td >
                        </tr >

                        <%--删除开始--%>
                        <tr class = "warning" >
                            <td >黄杨绢叶枫</td >
                            <td >小叶黄杨</td >
                            <td >幼虫食树叶,造成树木枯死</td >
                        </tr >
                        <tr >
                            <td >丝棉木金星尺蛾</td >
                            <td >大叶黄杨,丝绵木</td >
                            <td >幼虫食树叶,造成树木枯死</td >
                        </tr >
                        <tr >
                            <td >樱花介壳虫</td >
                            <td >连翘,白蜡树</td >
                            <td >树木皮层栓话,爆裂,树木落叶甚至枯死</td >
                        </tr >
                        <tr >
                            <td >樱花介壳虫</td >
                            <td >连翘,白蜡树</td >
                            <td >树木皮层栓话,爆裂,树木落叶甚至枯死</td >
                        </tr >
                        <tr >
                            <td >樱花介壳虫</td >
                            <td >连翘,白蜡树</td >
                            <td >树木皮层栓话,爆裂,树木落叶甚至枯死</td >
                        </tr >
                         <%--删除结束--%>

                    </table >
                </div >
                </table>
            </div >
            <br />
            <!--分页按钮-->
            <%--<div id = "pager" style="margin-top: -50px"></div >--%>
            <%--&lt;%&ndash;<h4 id = "result" >Clicked Page 1</h4 >&ndash;%&gt;--%>
            <%--<br />--%>
            <%--<br />--%>
            <%--<br />--%>
            <%--<br />--%>

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
                <div class = " col-sm-2" >
                    <button class = "btn" type = "button" onclick = "jump('#wormPanelDiv','datamanagement/wormAdd.jsp')" >添加新害虫</button >
                </div >
                <div class = "  col-sm-2" >
                    <button class = "btn" type = "button" onclick = "jump('#wormPanelDiv','datamanagement/wormInfo.jsp')" >查看详细信息</button >
                </div >
                <!--xs自动 lg>=1200px sm<=768px offset列移动-->
                <div class = "col-lg-6 col-sm-6 col-lg-offset-1 col-sm-offset-1" >
                    <fieldset >
                        <legend >查询鼠害信息</legend >
                        <div class = "row" >
                            <div class = "col-xs-10 col-sm-6" >
                                <div class = "input-group" >
                                    <div class = "input-group-btn" >
                                        <button id = "selected" type = "button" class = "btn btn-default dropdown-toggle" data-toggle =
                                                "dropdown" >病害名<span>&nbsp;</span><span class = "caret" ></span >
                                        </button >
                                        <ul id = "ul" class = "dropdown-menu" >
                                            <li
                                                    ><a id = 'li1' name="li1" value="0" href = "javascript:querySelect('#li1','selected')" >危害</a ></li >
                                            <li
                                                    ><a id = 'li2' name="li2" value="1" href = "javascript:querySelect('#li2','selected')" >发病症状</a ></li >
                                        </ul >
                                    </div >
                                    <!-- /btn-group -->
                                    <input id = "inputText" type = "text" class = "form-control" >
                                </div >
                                <!-- /input-group -->
                            </div >
                            <div class = "col-xs-6 col-sm-6" >
                                <button id = "search" type = "button" class = "btn" >查找</button >
                            </div >
                        </div >
                    </fieldset >
                </div >
            </div >
        </div >
    </div >

    <script type = "text/javascript" src = "../../js/jquery-1.11.3.min.js" ></script >
    <script type = "text/javascript" src = "../../js/jquery.pager.js"  ></script >
    <script type = "text/javascript" src = "../../js/page_context.js"  ></script >

    <script >
        <%--分页操作--%>
        $(document).ready(function () {
            $("#pager").pager({pagenumber: 1, pagecount: 15, buttonClickCallback: PageClick});
        });

        PageClick = function (pageclickednumber) {
            $("#pager").pager({pagenumber: pageclickednumber, pagecount: 15, buttonClickCallback: PageClick});
            $("#result").html("Clicked Page " + pageclickednumber);
        }

        //保存被选中项的索引
        var index;
        <!--查询按钮动作-->
        function querySelect(id1, id2) {
            var str = $(id1).text();
            var old = $('#' + id2).text();
            document.getElementById(id2).innerHTML = $(id1).text() + "<span>&nbsp;</span><span class = 'caret' ></span >";
            index = $(id1).attr("value");
        }

        <!--查询按钮-->
        $('#search').click(function(){
            var str = $('#inputText').val();
            alert('?index=' +  index + '&' + 'str=' + str);
        });



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

