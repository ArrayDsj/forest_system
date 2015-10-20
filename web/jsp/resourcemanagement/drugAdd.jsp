<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>添加药剂</title>
		<style type="text/css">
#body {
	width: 370px;
	height: 390px;
}

td {
	font: normal 13px "Microsoft YaHei";
	font-family: "Microsoft YaHei", "微软雅黑", "sans-serif";
}
</style>
	</head>
	<script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>

	<body>
		<div id="drugAddDiv">
			<div class="container-fluid">
				<!--标题-->
				<div class="row-fluid">
					<div class="span12">
						<h3 class="text-center">
							添加药剂
						</h3>
					</div>
				</div>
				<!--内容-->
				<div style="margin-left: 310px; margin-top: 10px">
					<!--表单-->

					<div id="body">
						<!--第一行-->
						<div class="row" style="margin-top: 20px">
							<div class="form-group" style="float: left">
								<label for="name" class="col-lg-4 col-sm-4   control-label ">
									名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称:
								</label>

								<div class="col-lg-8 col-sm-8">
									<input type="text" class="form-control" id="nameDrug"
										name="name">

								</div>
							</div>
						</div>
						<!--第二行-->
						<div class="row" style="margin-top: 20px; margin-left: 19px">
							<div class="form-group" style="float: left">
								<label class=" control-label ">
									防治类型:
								</label>
								<div class="btn-group" style="margin-left: 24px">
									<button id="typeBtn" name="type" type="button"
										class="btn btn-default" style="width: 120px" value="2">
										病害
									</button>
									<button type="button" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown" style="height: 35px">
										<span class="caret"></span>
										<span class="sr-only">Toggle Dropdown</span>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li>
											<a href="#" onclick='return a(this)' value="1">虫害</a>
										</li>
										<li>
											<a href="#" onclick='return a(this)' value="3">鼠害</a>
										</li>

									</ul>
								</div>
							</div>
						</div>
						<!--第三行-->
						<div class="row" style="margin-top: 20px; margin-left: 5px">
							<div class="form-group" style="float: left">
								<label class="control-label ">
									适合病虫害:
								</label>

								<div id="divTypeName" class="btn-group"
									style="margin-left: 24px">
									<button id="disasterBtn" name="disaster" type="button"
										class="btn btn-default" style="width: 120px;height:35px" value=" ">
										 
									</button>
									<button type="button" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown" style="height: 35px">
										<span class="caret"></span>
										<span class="sr-only">Toggle Dropdown</span>
									</button>
									<ul class="dropdown-menu" role="menu" id="ul">
										<c:forEach items="${requestScope.al}" var="al">
											<li>
												<a href="#" value="${al.id}"
													onclick='return addDisaster(this)'>${al.name}</a>
											</li>

										</c:forEach>
									</ul>
								</div>
							</div>
						</div>

						<!--第四行-->
						<div class="row" style="margin-top: 20px">
							<div class="form-group" style="float: left">
								<label for="strType" class="col-lg-4 col-sm-4   control-label ">
									适合树种:
								</label>
								<div class="col-lg-8 col-sm-8">
									<input name="tree" type="text" class="form-control"
										id="strType">
								</div>
							</div>
						</div>

					</div>

					<div id="foot">
						<div class="row">
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-5" style="margin-top: -40px">
									<button id="add" type="button" class="btn btn-default" >
										添加
									</button>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<script type="text/javascript">
	$(function() {
		$("#add").click(function() {
			var name = $("#nameDrug").val();
			var type = $("#typeBtn").val();//选择虫害鼠害病害的下拉框

			var disaster = $("#disasterBtn").val();//选择灾害类型的名称
	
			var tree = $("#strType").val();
			$("#drugAddDiv").load("adddrug.av", {
				"pageNow" : 1,"name" : name,"type" : type,"disaster" : disaster,"tree" : tree
			});
		});
	});
	function a(obj) { //	防治类型点击时对换value值
		var old = $("#typeBtn").text();
		var oldVal = $("#typeBtn").val();

		var New = obj.innerHTML;
		var NewVal = obj.getAttribute("value");

		obj.innerHTML = old;

		obj.setAttribute("value", oldVal);

		$("#typeBtn").text(New);
		$("#typeBtn").val(NewVal);

		var Val = $("#typeBtn").val();

		// $.ajax( { //一个Ajax过程
		//			type : "post", //以post方式与后台沟通
		//			url : "/Worm/queryDisaster.av", //后台请求路径
		//			dataType : 'json', //返回的值以 JSON方式解析
		//			data : {
		//				'Val' : Val
		//			}, //发送后台参数值，后台使用request.getParameter("id")获取
		//			success : function(all) { //如果调用成功 
		//				for(var i = 0; i < all.length; i++){					
		//					$("#ul").append("<li><a href='#' value='"+all[i].id+"' onclick='return addDisaster(this)'>"+all[i].name+"</a> </li>");
		//				}	
		//	
		//			}
		//		});
				$.post("queryDisaster.av",{"Val":Val},function(data){
						$("#ul").empty();
						var all = eval("(" + data + ")");
						for(var i = 0; i < all.length; i++){					
							$("#ul").append("<li><a href='#' value='"+all[i].id+"' onclick='return addDisaster(this)'>"+all[i].name+"</a> </li>");
						}					
						
					});

		$("#disasterBtn").empty();
		return false;
	}
	
	function addDisaster(obj) { //点击适合病虫害时对换value值
		var old = $("#disasterBtn").text();
		var oldVal = $("#disasterBtn").val();

		var New = obj.innerHTML;
		var NewVal = obj.getAttribute("value");

		obj.innerHTML = old;

		obj.setAttribute("value", oldVal);

		$("#disasterBtn").text(New);
		$("#disasterBtn").val(NewVal);
		return false;
	}
</script>
	</body>
</html>