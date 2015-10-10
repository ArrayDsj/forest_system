<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>


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
    <title>用户管理</title>
    <style>
        #userPanelDiv {

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
<div id = "userPanelDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    用户管理
                </h3>
            </div>
        </div>
        <!--表格-->
        <div class = "row-fluid" style = "border: solid">
            <table class = "table table-hover active">
                <tr>
                    <th class = "col-lg-3 col-sm-3">名称</th>
                    <th class = "col-lg-3 col-sm-3">防治类型</th>
                    <th class = "col-lg-3 col-sm-3">适合病虫害</th>
                    <th class = "col-lg-3 col-sm-3">适合树种</th>
                </tr>
            </table>

            <div style = "overflow-y: auto;overflow-x: auto;height: 170px;" class = "row-fluid" id = "tableTD">
                <table class = "table table-striped table-bordered table-hover table-condensed">
                    <tr>
                        <td class = "col-lg-3 col-sm-3">杀鼠迷</td>
                        <td class = "col-lg-3 col-sm-3">鼠害</td>
                        <td class = "col-lg-3 col-sm-3">劫家鼠</td>
                        <td class = "col-lg-3 col-sm-3">柳树，梧桐树等</td>
                    </tr>
                    <tr>
                        <td>敌敌畏</td>
                        <td>鼠害</td>
                        <td>松鼠</td>
                        <td>松树</td>
                    </tr>
                    <tr>
                        <td>灭扫利油</td>
                        <td>虫害</td>
                        <td>松毛虫</td>
                        <td>樟树，梧桐树等</td>
                    </tr>
                    <tr>
                        <td>杀鼠迷</td>
                        <td>鼠害</td>
                        <td>劫家鼠</td>
                        <td>柳树，梧桐树等</td>
                    </tr>
                    <tr>
                        <td>杀鼠迷</td>
                        <td>鼠害</td>
                        <td>劫家鼠</td>
                        <td>柳树，梧桐树等</td>
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
        <div id = "leftBtns" style = "float: left">
            <div class = "row-fluid">
                <div class = "col-lg-3 col-sm-2 col-sm-offset-2">
                    <button class = "btn" type = "button" onclick = "jump('#userPanelDiv','systemmessage/userAdd.jsp')">添加用户</button>
                </div>
                <div class = "col-lg-3 col-sm-2 col-sm-offset-3">
                    <button class = "btn" type = "button" onclick = "del()">删除用户</button>
                </div>
            </div>
            <div class = "row-fluid">
                <div class = "col-lg-3 col-sm-3 col-sm-offset-2" style = "margin-top: 20px">
                    <button class = "btn" type = "button" onclick = "jump('#userPanelDiv','systemmessage/userUpdate.jsp')">修改用户信息</button>
                </div>
            </div>
        </div>

        <div class = "row-fluid" id = "rightBtns" style = "float: left; ">
            <!--xs自动 lg>=1200px sm<=768px offset列移动-->
            <div class = "col-xs-3 col-lg-6 col-sm-6  col-sm-offset-4" style = "margin-top: -85px;margin-left: 400px">
                <fieldset>
                    <legend>查询用户信息</legend>
                    <div class = "row">
                        <div class = "col-xs-10 col-sm-6 col-lg-6">
                            <div class = "input-group">
                                <div class = "input-group-btn">
                                    <button id = "selected" type = "button" class = "btn btn-default dropdown-toggle" data-toggle =
                                            "dropdown">超级管理员<span class = "caret"></span><!--这个span的作用是提供一个下拉图标-->
                                    </button>
                                    <ul id = "ul" class = "dropdown-menu">
                                        <li><a href = "javascript:void(0)">资料管理员</a></li>
                                        <li><a href = "javascript:void(0)">灾情管理员</a></li>
                                        <li><a href = "javascript:void(0)">专家管理员</a></li>
                                        <li><a href = "javascript:void(0)">库房管理员</a></li>

                                    </ul>
                                </div>
                                <!-- /btn-group -->
                                <input id = "inputText" type = "text" class = "form-control" style = "width: 130px">
                            </div>
                            <!-- /input-group -->
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
        alert("删除用户");
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