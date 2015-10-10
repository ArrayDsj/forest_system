<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/10
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<!DOCTYPE html>
<html lang = "en" >
<head >
    <meta charset = "UTF-8" >
    <title >添加事件</title >
</head >
<body >
<div id = "thingAddDiv" >
    <div class = "container-fluid" >
        <!--标题-->
        <div class = "row-fluid" >
            <div class = "span12" >
                <h3 class = "text-center" >
                    添加事件信息
                </h3 >
            </div >
        </div >

        <div style = "margin-left:50px;margin-top: 10px" >
            <form class = "form-horizontal" role = "form" action = "javascript:void(0)" onsubmit = "jump(
            '#thingAddDiv','disastercontrol/thingPanel.jsp')" >
                <!--left-->
                <div id = "left" style = "width: 370px;height: 390px;float: left;" >
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 10px;margin-left: -25px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "thingName" class = "col-lg-4 col-sm-4   control-label " >事件名称:</label >
                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "thingName" >
                            </div >
                        </div >
                    </div >
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 5px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "time" class = "col-lg-4 col-sm-4   control-label " >时间:</label >
                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "time" >
                            </div >
                        </div >
                    </div >
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 5px;margin-left: 11px" >
                        <div class = "form-group" style = "float: left" >
                            <label class = " control-label " >灾情阶段:</label >
                            <div class = "btn-group" style = "margin-left: 24px" >
                                <button type = "button" class = "btn btn-default" style = "width: 120px" >已经得到控制</button >
                                <button type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown" >
                                    <span class = "caret" ></span >
                                    <span class = "sr-only" >Toggle Dropdown</span >
                                </button >
                                <ul class = "dropdown-menu" role = "menu" >
                                    <li ><a href = "#" >防治中</a ></li >
                                    <li ><a href = "#" >无法解决,申请专家会商</a ></li >
                                </ul >
                            </div >
                        </div >
                    </div >

                    <!--第四行-->
                    <div class = "row" style = "margin-top: 5px;margin-left:-45px;" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "describe" class = "col-lg-4 col-sm-4  control-label " >灾情描述:</label >
                            <div class = "col-lg-8 col-sm-6" >
                                <textarea id = "describe" rows = "3" cols = "30" class = "form-control" id = "rules" ></textarea >
                            </div >
                        </div >
                    </div >

                    <!--第五行-->
                    <div class = "row" style = "margin-top: 5px;margin-left: 11px" >
                        <div class = "form-group" style = "float: left" >
                            <label class = " control-label " >发生位置:</label >

                            <div class = "btn-group" style = "margin-left: 24px" >
                                <button type = "button" class = "btn btn-default" style = "width: 120px" >一号地区</button >
                                <button type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown" >
                                    <span class = "caret" ></span >
                                    <span class = "sr-only" >Toggle Dropdown</span >
                                </button >
                                <ul class = "dropdown-menu" role = "menu" >
                                    <li ><a href = "#" >二号地区</a ></li >
                                    <li ><a href = "#" >三号地区</a ></li >
                                    <li ><a href = "#" >四号地区</a ></li >
                                </ul >
                            </div >
                        </div >
                    </div >

                    <!--第六行-->
                    <div class = "row" style = "margin-top: 5px;margin-left: -25px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "loss" class = "col-lg-4 col-sm-4   control-label " >初步损失:</label >
                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "loss" >
                            </div >
                        </div >
                    </div >
                    <!--第七行-->
                    <div class = "row" style = "margin-top: 5px;margin-left: -25px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "opinion" class = "col-lg-4 col-sm-4   control-label " >专家建议:</label >
                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "opinion" >
                            </div >
                        </div >
                    </div >
                </div >

                <!--right-->
                <div id = "right" style = "width: 370px;height: 390px;float: left;margin-left: 10px" >
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 10px" >
                        <div class = "form-group" >
                            <div class = "col-lg-4 col-sm-4" style = "float: left;margin-left: 6px" >
                                <label for = "img" class = " control-label " >灾区图片:</label >
                            </div >
                            <div class = "col-lg-4 col-sm-4" style = "float: left;margin-left: -50px" >
                                <input type = "file" class = "form-control" id = "img" style = "display: none" >
                                <input id = "inputImg" type = "text" class = "form-control" style = "width: 150px" />
                            </div >
                            <div class = "col-lg-4 col-sm-4" style = "float: left;margin-left: 10px" >
                                <button class = "btn btn-default" onclick = "browse()" >浏览</button >
                            </div >
                        </div >
                    </div >


                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: 11px" >
                        <div class = "form-group" style = "float: left" >
                            <label class = " control-label " >灾情类型:</label >

                            <div class = "btn-group" style = "margin-left: 24px" >
                                <button type = "button" class = "btn btn-default" style = "width: 120px" >虫害</button >
                                <button type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown" >
                                    <span class = "caret" ></span >
                                    <span class = "sr-only" >Toggle Dropdown</span >
                                </button >
                                <ul class = "dropdown-menu" role = "menu" >
                                    <li ><a href = "#" >鼠害</a ></li >
                                    <li ><a href = "#" >病害</a ></li >
                                </ul >
                            </div >
                        </div >
                    </div >

                    <!--第三行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: 11px" >
                        <div class = "form-group" style = "float: left" >
                            <label class = " control-label " >发现途径:</label >

                            <div class = "btn-group" style = "margin-left: 24px" >
                                <button type = "button" class = "btn btn-default" style = "width: 120px" >小班巡逻发现</button >
                                <button type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown" >
                                    <span class = "caret" ></span >
                                    <span class = "sr-only" >Toggle Dropdown</span >
                                </button >
                                <ul class = "dropdown-menu" role = "menu" >
                                    <li ><a href = "#" >公众发现</a ></li >
                                    <li ><a href = "#" >上级部门通报</a ></li >
                                </ul >
                            </div >
                        </div >
                    </div >

                    <!--第四行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: 11px" >
                        <div class = "form-group" style = "float: left" >
                            <label class = " control-label " >所在小班:</label >

                            <div class = "btn-group" style = "margin-left: 24px" >
                                <button type = "button" class = "btn btn-default" style = "width: 120px" >1</button >
                                <button type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown" >
                                    <span class = "caret" ></span >
                                    <span class = "sr-only" >Toggle Dropdown</span >
                                </button >
                                <ul class = "dropdown-menu" role = "menu" >
                                    <li ><a href = "#" >2</a ></li >
                                    <li ><a href = "#" >3</a ></li >
                                </ul >
                            </div >
                        </div >
                    </div >

                    <!--第五行-->
                    <div class = "row" style = "margin-top:5px;margin-left: -25px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "area" class = "col-lg-4 col-sm-4   control-label " >影响面积:</label >
                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "area" >
                            </div >
                        </div >
                    </div >

                    <!--第六行-->
                    <div class = "row" style = "margin-top: 5px ;margin-left: -25px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "plan" class = "col-lg-4 col-sm-4   control-label " >防治方案:</label >

                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "plan" >
                            </div >
                        </div >
                    </div >
                </div >
                <!--foot-->
                <div id = "foot" >
                    <div class = "row" >
                        <div class = "form-group" >
                            <div class = "col-sm-offset-5 col-sm-5" style = "margin-top:10px" >
                                <button type = "submit" class = "btn btn-default" >添加</button >
                            </div >
                        </div >
                    </div >
                </div >
            </form >
        </div >
    </div >
</div >


<script type = "text/javascript" >
    function browse() {
        //调用文件选择组件的默认点击事件
        $("#img").click();
        $("#img").change(function () {
            //给input设置值
            $("#inputImg").val($("#img").val());
        });
    }
</script >
</body >
</html >