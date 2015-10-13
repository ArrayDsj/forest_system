<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/10
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<!DOCTYPE html>
<html lang = "en" >
<head >
    <meta charset = "UTF-8" >
    <title >添加区域</title >
    <style type = "text/css" >
        #body {
            width: 370px;
            height: 390px;
        }
    </style >
</head >
<body >
<div id = "areaAddDiv" >
    <div class = "container-fluid" >
        <!--标题-->
        <div class = "row-fluid" >
            <div class = "span12" >
                <h3 class = "text-center" >
                    添加区域
                </h3 >
            </div >
        </div >
        <!--内容-->
        <div style = "margin-left:310px;margin-top: 10px" >
            <!--表单-->
            <form class = "form-horizontal" role = "form" action = "javascript:void(0)" onsubmit = "jump(
            '#areaAddDiv','disastercontrol/areaPanel.jsp')" >
                <div id = "body" >
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "name"
                                   class = "col-lg-4 col-sm-4   control-label " >名称:</label >

                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "name" >
                            </div >
                        </div >
                    </div >
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "type"
                                   class = "col-lg-4 col-sm-4   control-label " >林种:</label >

                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "type" >
                            </div >
                        </div >
                    </div >
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "strType" class = "col-lg-4 col-sm-4   control-label " >优势树种:</label >

                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "strType" >
                            </div >
                        </div >
                    </div >
                    <!--第四行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: -12px" >
                        <div class = "form-group" style = "float: left" >
                            <label class = "col-lg-4 col-sm-4   control-label " >地类:</label >

                            <div class = "btn-group col-lg-8 col-sm-8" >
                                <button name = "f_landtype" id = "selected" type = "button" class = "btn btn-default  dropdown-toggle"
                                       data-toggle = "dropdown" style="width: 165px">林地<span >&nbsp;</span ><span class = "caret"
                                        ></span >
                                </button >
                                <ul id = "ul" class = "dropdown-menu" >
                                    <li ><a id = 'li1' name = "f_foresttype" href = "#"
                                            onclick = "return querySelect(this,'selected')" >疏林地</a ></li >
                                    <li ><a id = 'li2' name = "f_treetype" href = "#"
                                            onclick = "return querySelect(this,'selected')" >灌木林</a ></li >
                                    <li ><a id = 'li3' name = "f_treetype" href = "#"
                                            onclick = "return querySelect(this,'selected')" >苗圃地</a ></li >
                                </ul >
                            </div >
                        </div >
                    </div >
                </div >

                <div id = "foot" >
                    <div class = "row" >
                        <div class = "form-group" >
                            <div class = "col-sm-offset-3 col-sm-5" style = "margin-top:-40px" >
                                <button type = "submit" class = "btn btn-default" >添加</button >
                            </div >
                        </div >
                    </div >
                </div >
            </form >
        </div >
    </div >
</div >

</body >
</html >
