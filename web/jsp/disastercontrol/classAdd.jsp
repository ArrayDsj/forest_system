
<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/10
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
            <%--<form class = "form-horizontal" role = "form" action = "#" method = "POST" onsubmit = "return check()" >--%>
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
                            <label for = "phone" class = "col-lg-4 col-sm-4   control-label " >电话:</label >

                            <div class = "col-lg-8 col-sm-8" >
                                <input type = "text" class = "form-control" id = "phone" onkeydown = "onlyNum()" style = "ime-mode:Disabled">
                            </div >
                        </div >
                    </div >
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: 11px" >
                        <div class = "form-group" style = "float: left" >
                            <label class = " control-label " >负责区域:</label >
                            <div class = "btn-group" style = "margin-left: 24px" >



                                <button name = "area" id = "selected" type = "button" class = "btn btn-default  dropdown-toggle"
                                        data-toggle = "dropdown" style = "width: 165px" value = "${requestScope.allSelects[0].id}" >
                                            ${requestScope.allSelects[0].name}
                                            <span >&nbsp;</span ><span class = "caret" ></span >
                                </button >
                                <ul id = "ul" class = "dropdown-menu" >
                                <c:forEach items="${requestScope.allSelects}" var="area">
                                    <li ><a href = "#" value = "${area.id}"
                                            onclick = "return getID(this,'selected','#hidden')" >${area.name}</a
                                            ></li >
                                </c:forEach>
                                </ul >
                                <input id = "hidden" name = "hidden" type = "hidden" value = "${requestScope.allSelects[0].id}" />
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
                                <input type = "text" class = "form-control" id = "number" onkeydown="onlyNum()" style = "ime-mode:Disabled">
                            </div >
                        </div >
                    </div >
                </div >
                <!--foot-->
                <div id = "foot" >
                    <div class = "row" >
                        <div class = "form-group" >
                            <div class = "col-sm-offset-5 col-sm-5" style = "margin-top:10px" >
                                <input type = "hidden" id="once" name="once" value="initSelect"/>
                                <button type = "button" class = "btn btn-default" id="subBtn">添加</button >
                            </div >
                        </div >
                    </div >
                </div >
            <%--</form >--%>
        </div >
    </div >
</div >

<script >
    //判断输入信息
    $(function(){
        $("#subBtn").click(function(){
            var name = $("#name").val();
            var phone = $("#phone").val();
            var manager = $("#manager").val();
            var number = $("#number").val();
            var area = $("#hidden").val();
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
            }
            if (number == null || number.trim() == "") {
                strMessage += "人数不能为空\n";
            }
            if (strMessage.length != 0) {
                alert(strMessage);
                return false;
            } else {
                $("#classAddDiv").load("../classAdd.av",
                        {
                            //添加操作
                            'option': 'confirmAdd',
                            'name': name,
                            'phone': phone,
                            'manager': manager,
                            'number': number,
                            'area': area
                        }, function (data) {
                            var jsonObj = eval("(" + data + ")");
                            if (jsonObj.msg == 'success') {
                                initData('#classAddDiv', '../classPanel.av', {
                                    'pageNow': 1,
                                    'option': 'init',
                                    'query': 'f_name',
                                    'str': ''
                                });
                            } else if (jsonObj.msg == 'defeat') alert("添加失败");
                            else    alert('系统内部错误');
                        });
                return false;
            }
        })
    });



    function getID(obj, id, id1) {
        //下拉列表被选中的选项
        var checked = obj.text;
        //得到选中的下拉列表中的value
        var selectValue = obj.getAttribute("value");
        //原来的文本
        var str = document.getElementById(id).childNodes[0].nodeValue;
        //原来的value
        var oldValue = $("#"+id).val();
        //交换
        document.getElementById(id).innerHTML = checked + "<span>&nbsp;</span><span class = 'caret' ></span > ";
        $("#"+id).val(selectValue);

        obj.text = str;
        obj.setAttribute("value", oldValue);

        $(id1).val(obj.getAttribute("value"));
        return false;
    }


</script >
</body >
</html >