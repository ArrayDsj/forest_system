<!DOCTYPE html>
<%@ page contentType = "text/html;charset=UTF-8" language = "java" pageEncoding = "UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang = "en">
<head>
    <meta charset = "UTF-8">
    <title>添加出库信息</title>
    <style type = "text/css">
        span {
            font-size: 16px;
        }
    </style>
</head>
<script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
<body>
<div id = "outwarehouseAddDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    添加出库信息
                </h3>
            </div>
        </div>
        <!--内容-->
        <!--内容-->
        <div style = "margin-left:50px;margin-top: 10px">
                <!--left-->
                <div id = "left" style = "width: 370px;height: 390px;float: left">
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: 19px">
                        <div class = "form-group" style = "float: left">
                            <label class = " control-label ">类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型:</label>

                            <div class = "btn-group" style = "margin-left: 24px">
                                <button type = "button" class = "btn btn-default" style = "width: 120px" id="typeName" value="1">药剂</button>
                                <button type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown" style="height:35px">
                                    <span class = "caret"></span>
                                    <span class = "sr-only">Toggle Dropdown</span>
                                </button>
                                <ul class = "dropdown-menu" role = "menu">
                                    <li><a href = "#" value="2" onclick="return typeOne(this)">器械</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: 19px">
                        <div class = "form-group" style = "float: left">
                            <label class = " control-label ">物品名称:</label>

                            <div class = "btn-group" style = "margin-left: 24px">
                                <button type = "button" class = "btn btn-default" style = "width: 120px;height: 35px" id="typeThing" value="1" ></button>
                                <button type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown" style="height:35px">
                                    <span class = "caret"></span>
                                    <span class = "sr-only">Toggle Dropdown</span>
                                </button>
                                <ul class = "dropdown-menu" role = "menu" id="ul">
                                	
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: 19px">
                        <div class = "form-group" style = "float: left">
                            <label class = " control-label ">领用小班:</label>

                            <div class = "btn-group" style = "margin-left: 24px">
                                <button type = "button" class = "btn btn-default" style = "width: 120px" id="typeClass" value="1">雅林一班</button>
                                <button type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown" style="height:35px">
                                    <span class = "caret"></span>
                                    <span class = "sr-only">Toggle Dropdown</span>
                                </button>
                                <ul class = "dropdown-menu" role = "menu">
                                    <li><a href = "#" value="2" onclick="return typeThree(this)">雅林二班</a></li>
                                    <li><a href = "#" value="3" onclick="return typeThree(this)">卧龙一班</a></li>
                                    <li><a href = "#" value="4" onclick="return typeThree(this)">卧龙二班</a></li>
                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!--第四行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: 19px">
                        <div class = "form-group" style = "float: left">
                            <label class = " control-label ">出&nbsp;&nbsp;库&nbsp;&nbsp;人:</label>

                            <div class = "btn-group" style = "margin-left: 24px">
                                <label>${sessionScope.loginUser.name}</label>
                            </div>
                        </div>
                    </div>
                </div>
                <!--right-->
                <div id = "right" style = "width: 370px;height: 390px;float: left;margin-left: 10px">
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: 19px">
                        <div class = "form-group" style = "float: left">
                            <label class = " control-label ">防治类型:</label>
                            <div class = "btn-group" style = "margin-left: 24px">
                                <button type = "button" class = "btn btn-default" style = "width: 120px" id="typeDisaster" value="2">病害</button>
                                <button type = "button" class = "btn btn-default dropdown-toggle" data-toggle = "dropdown" style="height:35px">
                                    <span class = "caret"></span>
                                    <span class = "sr-only">Toggle Dropdown</span>
                                </button>
                                <ul class = "dropdown-menu" role = "menu">
                                    <li><a href = "#" value="1" onclick="return typeFour(this)">虫害</a></li>
                                    <li><a href = "#" value="3" onclick="return typeFour(this)">鼠害</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "name"
                                   class = "col-lg-4 col-sm-4   control-label ">领用数量:</label>
                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "number">
                            </div>
                        </div>
                    </div>
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 20px;margin-left:-35px;">
                        <div class = "form-group" style = "float: left">
                            <label for = "status" class = "col-lg-4 col-sm-4  control-label " id="mainUse">主要用途:</label>
                            <div class = "col-lg-8 col-sm-6">
                                <textarea rows = "5" cols = "30" class = "form-control" id = "status"></textarea>
                            </div>
                        </div>
                    </div>

                </div>
                <!--foot-->
                <div id = "foot">
                    <div class = "row">
                        <div class = "form-group">
                            <div class = "col-sm-offset-5 col-sm-5" style = "margin-top:10px">
                                <button id="add" type = "button" class = "btn btn-default">添加</button>
                            </div>
                        </div>
                    </div>
                </div>
           

        </div>

    </div>
</div>
<script type="text/javascript">
	$(function(){
		$("#add").click(function(){
			var valType = $("#typeName").text();  //类型的文本值
			var textDisaster = $("#typeDisaster").text();  //防止类型的文本值
			var typeThing = $("#typeThing").val();//物品名称的文本值
			var typeClass = $("#typeClass").text();//领用小班的文本值
			var number = $("#number").val();//领用数量的文本值
			var mainUse = $("#status").val();//主要用途
			
			$("#outwarehouseAddDiv").load("addoutwarehouse.av",{"pageNow":1,"valType":valType,"textDisaster":textDisaster,
			"typeThing":typeThing,"typeClass":typeClass,"number":number,"mainUse":mainUse
			});
		});
	});
	
	function typeOne(obj){
		var old = $("#typeName").text();
		var oldVal = $("#typeName").val();

		var New = obj.innerHTML;
		var NewVal = obj.getAttribute("value");

		obj.innerHTML = old;

		obj.setAttribute("value", oldVal);

		$("#typeName").text(New);
		$("#typeName").val(NewVal);
		return false;
	}
	function typeTwo(obj){
		var old = $("#typeThing").text();
		var oldVal = $("#typeThing").val();

		var New = obj.innerHTML;
		var NewVal = obj.getAttribute("value");

		obj.innerHTML = old;

		obj.setAttribute("value", oldVal);

		$("#typeThing").text(New);
		$("#typeThing").val(NewVal);
		
		return false;
	}
	function typeThree(obj){
		var old = $("#typeClass").text();
		var oldVal = $("#typeClass").val();

		var New = obj.innerHTML;
		var NewVal = obj.getAttribute("value");

		obj.innerHTML = old;

		obj.setAttribute("value", oldVal);

		$("#typeClass").text(New);
		$("#typeClass").val(NewVal);
	
		return false;
	}
	function typeFour(obj){
		var old = $("#typeDisaster").text();
		var oldVal = $("#typeDisaster").val();

		var New = obj.innerHTML;
		var NewVal = obj.getAttribute("value");

		obj.innerHTML = old;

		obj.setAttribute("value", oldVal);

		$("#typeDisaster").text(New);
		$("#typeDisaster").val(NewVal);
	
		var valType = $("#typeName").text();
		var valDisaster = $("#typeDisaster").val();
		var textDisaster = $("#typeDisaster").text();
		$.post("queryDrugApparatus.av",{"valType":valType,"valDisaster":valDisaster,"textDisaster":textDisaster},function(data){
						var all = eval("(" + data + ")");
						$("#ul").empty();
						for(var i = 0; i < all[0].length; i++){					
							$("#ul").append("<li><a href='#' value='"+all[0][i].id+"' onclick='return typeTwo(this)'>"+all[0][i].name+"</a> </li>");
						}					
						for(var j = 0;j<all[1].length;j++){
							$("#ul").append("<li><a href='#' value='"+all[1][j].id+"' onclick='return typeTwo(this)'>"+all[1][j].name+"</a> </li>");
						}
						
					});
				
		return false;
		
	}
</script>

</body>
</html>