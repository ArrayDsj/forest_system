<!DOCTYPE html>
<%@ page contentType = "text/html;charset=UTF-8" language = "java" pageEncoding = "UTF-8" %>
<html lang = "en">
<head>
    <meta charset = "UTF-8">
    <title>添加器械</title>
    <style type = "text/css">
        #body {
            width: 370px;
            height: 390px;
        }
    </style>
</head>
<body>
<div id = "apparatusAddDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    添加器械
                </h3>
            </div>
        </div>
        <!--内容-->
        <div style = "margin-left:310px;margin-top: 10px">
            <!--表单-->
            <form class = "form-horizontal" role = "form" action = "javascript:void(0)" onsubmit = "jump(
            '#apparatusAddDiv','resourcemanagement/apparatusPanel.jsp')">
                <div id = "body">
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "name"
                                   class = "col-lg-4 col-sm-4   control-label ">名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "nameApparatus">
                            </div>
                        </div>
                    </div>
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: 19px">
                        <div class = "form-group" style = "float: left">
                            <label class = " control-label ">防治类型:</label>

                            <div class = "btn-group" style = "margin-left: 24px">
                                <button id="typeBtn" type = "button" class = "btn btn-default" style = "width: 120px" value="2">病害</button>
                                <button type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown" style="height:35px">
                                    <span class = "caret"></span>
                                    <span class = "sr-only">Toggle Dropdown</span>
                                </button>
                                <ul class = "dropdown-menu" role = "menu">
                                    <li><a href = "#" value="1" onclick="return a(this)">虫害</a></li>
                                    <li><a href = "#" value="3" onclick="return a(this)">鼠害</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 20px;margin-left:-35px;">
                        <div class = "form-group" style = "float: left">
                            <label for = "status" class = "col-lg-4 col-sm-4  control-label ">发病状态:</label>

                            <div class = "col-lg-8 col-sm-6">
                                <textarea id="mainUse" rows = "5" cols = "30" class = "form-control" id = "status"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div id = "foot">
                    <div class = "row">
                        <div class = "form-group">
                            <div class = "col-sm-offset-3 col-sm-5" style = "margin-top:-40px">
                                <button id="add" type = "submit" class = "btn btn-default">添加</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
	$(function(){
		$("#add").click(function(){
			var name = $("#nameApparatus").val();
			var type = $("#typeBtn").text();
			var mainUse = $("#mainUse").val();
			$("#apparatusAddDiv").load("../addapparatus.av",{"pageNow":1,"name":name,"type":type,"mainUse":mainUse})
		});
	});

	function a(obj){
		var old = $("#typeBtn").text();
		var oldVal = $("#typeBtn").val();

		var New = obj.innerHTML;
		var NewVal = obj.getAttribute("value");

		obj.innerHTML = old;

		obj.setAttribute("value", oldVal);

		$("#typeBtn").text(New);
		$("#typeBtn").val(NewVal);
		
		return false;
	}
	
</script>
</body>
</html>