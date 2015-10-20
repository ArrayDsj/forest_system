<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>出库管理</title>
		<style>
#outwarehousePanelDiv { /*圆角*/
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
		<div id="outwarehousePanelDiv">
			<div class="container-fluid">
				<!--标题-->
				<div class="row-fluid">
					<div class="span12">
						<h3 class="text-center">
							药剂器械出库管理
						</h3>
					</div>
				</div>
				<!--表格-->
				<div class="row-fluid" style="border: solid">
					<table class="table table-hover active">
						<tr>
							<th class="col-lg-3 col-sm-3">
								日期
							</th>
							<th class="col-lg-2 col-sm-2">
								名称
							</th>
							<th class="col-lg-3 col-sm-3">
								主要用途
							</th>
							<th class="col-lg-2 col-sm-2">
								领用数量
							</th>
							<th class="col-lg-2 col-sm-2">
								领用小班
							</th>
						</tr>
					</table>

					<div style="overflow-y: auto; height: 170px;" class="row-fluid"
						id="tableTD">
						<table
							class="table table-striped table-bordered table-hover table-condensed">
							<c:forEach items="${requestScope.li}" var="al">
								<tr>
									<td class="col-lg-3 col-sm-3">
										${al.time}
									</td>
									<td class="col-lg-2 col-sm-2">
										${al.dab.name}
									</td>
									<td class="col-lg-3 col-sm-3">
										${al.mianUse}
									</td>
									<td class="col-lg-2 col-sm-2">
										${al.consumingNumber}
									</td>
									<td class="col-lg-2 col-sm-2">
										${al.consumingClass}
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>

				</div>
				<br />
				<!--分页按钮-->
				<div class="row-fluid">
					<div class="span12">
						<div>
							<button id="previousPage" class="btn btn-sm" type="button"
								style="line-height: 0px">
								<span class="glyphicon glyphicon-chevron-left"></span>
							</button>
							<input id="pageNum" type="text" style="width: 40px; height: 20px"
								value="${requestScope.currentPage}" />
							<label>
								/${requestScope.pageNumber}
							</label>
							<button id="go" class="btn btn-sm" type="button"
								style="line-height: 0px">
								<span class="glyphicon glyphicon-step-forward"></span>
							</button>
							<button id="nextPage" class="btn  btn-sm" type="button"
								style="line-height: 0px">
								<span class="glyphicon glyphicon-chevron-right"></span>
							</button>
						</div>
					</div>
				</div>
				<br />
				<br />
				<!--按钮-->
				<div class="row-fluid">
					<div class="col-lg-3 col-sm-2 col-sm-offset-2">
						<button id="add" class="btn" type="button">
							添加出库信息
						</button>
					</div>

					<div class = "col-xs-3 col-lg-6 col-sm-6  col-sm-offset-4" style = "margin-top: -100px;margin-left: 440px" >
                <%--时间控件--%>
                <%--<form action = "" class = "form-horizontal" role = "form" >--%>
                <fieldset >
                    <legend >日期查询</legend >
                    <div class = "form-group " style="margin-top: -15px">
                        <label class = "col-md-3 control-label" >起始日期</label >
                        <div id = "datetimepickerStar" class = "input-group date form_date col-md-6" data-date = "" data-date-format =
                                "yyyy-mm-dd"
                             data-link-format = "yyyy-mm-dd" >
                            <input id="start" class = "form-control" size = "10" type = "text" value = "${start}" readonly = "readonly" onclick = "selectTime()" >
                            <span class = "input-group-addon" ><span class = "glyphicon glyphicon-remove" ></span ></span >
                            <span class = "input-group-addon" ><span class = "glyphicon glyphicon-calendar"
                                                                     onclick = "selectTime('datetimepickerStar')" ></span ></span >
                        </div >
                    </div >
                    <div class = "form-group" style = "margin-top: -15px" >
                        <label class = "col-md-3 control-label" >结束日期</label >
                        <div id = "datetimepickerEnd" class = "input-group date form_date col-md-6" data-date = ""
                             data-date-format = "yyyy-mm-dd"
                             data-link-format = "yyyy-mm-dd" >
                            <input id="over" class = "form-control" size = "10" type = "text" value = "${over}" readonly = "readonly"
                                   onclick = "selectTime()" >
                            <span class = "input-group-addon" ><span class = "glyphicon glyphicon-remove" ></span ></span >
                            <span class = "input-group-addon" ><span class = "glyphicon glyphicon-calendar"
                                                                     onclick = "selectTime('datetimepickerEnd')" ></span ></span >
                        </div >
                        <button id="search" type = "button" class = "btn"  style="margin-top: -34px;margin-left: 350px;">查找
                        </button >
                    </div >

                </fieldset >
                <%--</form >--%>
            </div >
				</div>
			</div>
		</div>

		<script>
    //数据有效性验证
    $("#pageNum").keydown(function () {
        //只能输入数字
    });

    //事件处理
    $("#previousPage").click(function () {
        //上一页点击事件
        if(parseInt(${requestScope.currentPage}) > 1 ){
					$("#outwarehousePanelDiv").load("outwarehouse.av",{"pageNow":${requestScope.currentPage} - 1,"start":$("#start").val(),"over":$("#over").val()});
				}
				else	alert("第一页了");
    });
    $("#nextPage").click(function () {
        //下一页点击事件
      if(${requestScope.currentPage} < ${requestScope.pageNumber}){
					$("#outwarehousePanelDiv").load("outwarehouse.av",
                            {"pageNow":${requestScope.currentPage} + 1,"start":$("#start").val(),"over":$("#over").val()});
				}else alert("最后一页了！！！！");

    });
    $("#go").click(function () {
        //跳转到指定页点击事件
        if($("#pageNum").val() <= ${requestScope.pageNumber}  && $("#pageNum").val() >0){
					$("#outwarehousePanelDiv").load("outwarehouse.av",{"pageNow":$("#pageNum").val(),"start":$("#start").val(),"over":$("#over").val()});
				}
				else{
					alert("请输入范围以内的数字！！！");
					$("#outwarehousePanelDiv").load("outwarehouse.av",{"pageNow":1,"start":$("#start").val(),"over":$("#over").val()});
				}
    });
	
    $("#add").click(function(){
    	$("#outwarehousePanelDiv").load("jsp/resourcemanagement/outwarehouseAdd.jsp");
    });
    $("#search").click(function(){
    	var start = $("#start").val();
    
    	var over = $("#over").val();
    	$("#outwarehousePanelDiv").load("outwarehouse.av",{"pageNow":1,"start":start,"over":over});
    });



    $(function(){
        $("#search").click(function () {
            var start = $("#start").val();
            var end = $("#over").val();
            if (start > end) {
                alert("您选择的时间有误，请重新选择！");
                $("#outwarehousePanelDiv").load("outwarehouse.av", {"pageNow": 1});
            }
            else
            $("#outwarehousePanelDiv").load("outwarehouse.av", {"pageNow": 1, "start": $("#start").val(), "end": $("#over").val()})
        });
    })

</script>
	</body>
</html>