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
            <form class = "form-horizontal" role = "form" action = "/areaAdd.av" method="POST" onsubmit="return check()">
                <div id = "body" >
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "name"
                                   class = "col-lg-4 col-sm-4   control-label " >名称:</label >

                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "name" name="name">
                            </div >
                        </div >
                    </div >
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "forestType"
                                   class = "col-lg-4 col-sm-4   control-label " >林种:</label >

                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "forestType"  name="forestType">
                            </div >
                        </div >
                    </div >
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "treeType" class = "col-lg-4 col-sm-4   control-label " >优势树种:</label >

                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "treeType" name="treeType">
                            </div >
                        </div >
                    </div >
                    <!--第四行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: -12px" >
                        <div class = "form-group" style = "float: left" >
                            <label class = "col-lg-4 col-sm-4   control-label " >地类:</label >

                            <div class = "btn-group col-lg-8 col-sm-8" >
                                <button name = "landType" id = "selected" type = "button" class = "btn btn-default  dropdown-toggle"
                                       data-toggle = "dropdown" style="width: 165px">林地<span >&nbsp;</span ><span class = "caret"
                                        ></span >
                                </button >
                                <ul id = "ul" class = "dropdown-menu" >
                                    <li ><a  href = "#"
                                            onclick = "return getSelect(this,'selected')" >疏林地</a ></li >
                                    <li ><a  href = "#"
                                            onclick = "return getSelect(this,'selected')" >灌木林</a ></li >
                                    <li ><a href = "#"
                                            onclick = "return getSelect(this,'selected')" >苗圃地</a ></li >
                                </ul >
                                <input id="hidden" name = "hidden" type = "hidden" value="林地"/>
                            </div >
                        </div >
                    </div >
                </div >

                <div id = "foot" >
                    <div class = "row" >
                        <div class = "form-group" >
                            <div class = "col-sm-offset-3 col-sm-5" style = "margin-top:-40px" >
                                <button type = "submit" class = "btn btn-default" id="subBtn">添加</button >
                            </div >
                        </div >
                    </div >
                </div >
            </form >
        </div >
    </div >
</div >


<script >
    //取得按钮控件中的第一个子节点的text文本值
    function getSelect(obj, id) {
        //下拉列表被选中的选项
        var checked = obj.text;
        //原来的文本
        var str = document.getElementById(id).childNodes[0].nodeValue;
        //交换
        document.getElementById(id).innerHTML = checked + "<span>&nbsp;</span><span class = 'caret' ></span > ";
        obj.text = str;
        $("#hidden").val(checked);
        return false;
    }


    //判断输入信息
    function check() {
        var name = $("#name").val();
        var forestType = $("#forestType").val();
        var treeType = $("#treeType").val();

        //本地验证
        var strMessage = "";
        if (name == null || name.trim() == "") {
            strMessage += "用户名不能为空\n";
        }
        if (forestType == null || forestType.trim() == "") {
            strMessage += "林地不能为空\n";
        }
        if (treeType == null || treeType.trim() == "") {
            strMessage += "优势树种不能为空\n";
        }
        if (strMessage.length != 0) {
            alert(strMessage);
            return false;
        }
    }
</script >
</body >
</html >
