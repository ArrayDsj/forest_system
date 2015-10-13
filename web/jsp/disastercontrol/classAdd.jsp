<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/10
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<!DOCTYPE html>
<html lang = "en" >
<head >
    <meta charset = "UTF-8" >
    <title >添加小班</title >
</head >
<body >
<div id = "classAddDiv" >
    <div class = "container-fluid" >
        <!--标题-->
        <div class = "row-fluid" >
            <div class = "span12" >
                <h3 class = "text-center" >
                    添加小班
                </h3 >
            </div >
        </div >
        <!--内容-->
        <div style = "margin-left:50px;margin-top: 10px" >
            <!--表单-->
            <form class = "form-horizontal" role = "form" action = "#" method = "POST" onsubmit = "return check()" >
                <!--左边-->
                <div id = "left" style = "width: 370px;height: 390px;float: left" >
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "name" class = "col-lg-4 col-sm-4   control-label " >名称:</label >

                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "name" >
                            </div >
                        </div >
                    </div >
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "phone" class = "col-lg-4 col-sm-4   control-label " >繁殖:</label >

                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "phone" >
                            </div >
                        </div >
                    </div >
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: 11px" >
                        <div class = "form-group" style = "float: left" >
                            <label class = " control-label " >负责区域:</label >
                            <div class = "btn-group" style = "margin-left: 24px" >
                                <button name = "area" id = "selected" type = "button" class = "btn btn-default  dropdown-toggle"
                                        data-toggle = "dropdown" style = "width: 165px" >林地<span >&nbsp;</span ><span class = "caret"
                                        ></span >
                                </button >
                                <ul id = "ul" class = "dropdown-menu" >
                                    <li ><a href = "#"
                                            onclick = "return getSelect(this,'selected','hidden')" >疏林地</a ></li >
                                    <li ><a href = "#"
                                            onclick = "return getSelect(this,'selected','hidden')" >灌木林</a ></li >
                                    <li ><a href = "#"
                                            onclick = "return getSelect(this,'selected','hidden')" >苗圃地</a ></li >
                                </ul >
                                <input id = "hidden" name = "hidden" type = "hidden" value = "林地" />
                            </div >
                        </div >
                    </div >


                </div >
                <!--右边-->
                <div id = "right" style = "width: 370px;height: 390px;float: left;margin-left: 10px" >
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "manager" class = "col-lg-4 col-sm-4   control-label " >负责人:</label >

                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "manager" >
                            </div >
                        </div >
                    </div >
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <div class = "form-group" style = "float: left" >
                            <label for = "number" class = "col-lg-4 col-sm-4   control-label " >人员数量:</label >

                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "number" >
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

<script >



    //判断输入信息
    function check() {
        var name = $("#name").val();
        var phone = $("#phone").val();
        var manager = $("#manager").val();
        var number = $("#number").val();
        //本地验证
        var strMessage = "";
        if (name == null || name.trim() == "") {
            strMessage += "名称不能为空\n";
        }
        if (phone == null || phone.trim() == "") {
            strMessage += "电话不能为空\n";
        }
        if (manager == null || manager.trim() == "") {
            strMessage += "负责人不能为空\n";
        }if (number == null || number.trim() == "") {
            strMessage += "人数不能为空\n";
        }
        if (strMessage.length != 0) {
            alert(strMessage);
            return false;
        } else {
            $("#classAddDiv").load("../classAdd.av",
                    {
                        'name': name,
                        'phone': phone,
                        'manager': manager,
                        'number': number,
                        'area': $("#hidden").val()
                    });
            return false;
        }
    }


</script >
</body >
</html >