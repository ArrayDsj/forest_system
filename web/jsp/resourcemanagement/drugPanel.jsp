<!DOCTYPE html>
<%@ page contentType = "text/html;charset=UTF-8" language = "java" pageEncoding = "UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang = "en">
<head>
    <meta charset = "UTF-8">
    <title>药剂管理</title>
    <style>
        #drugPanelDiv {
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
	<script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
	
<body>
<div id = "drugPanelDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    药剂一览
                </h3>
            </div>
        </div>
        <!--表格-->
        <div class = "row-fluid" style = "border: solid">
            <table class = "table table-hover avtive">
                <tr >
                    <th class = "col-lg-3 col-sm-3">名称</th>
                    <th class = "col-lg-3 col-sm-3">防治类型</th>
                    <th class = "col-lg-3 col-sm-3">适合病虫害</th>
                    <th class = "col-lg-3 col-sm-3">适合树种</th>
                </tr>
            </table>

            <div style = "overflow-y: auto;height: 170px;" class = "row-fluid" id = "tableTD" >
                    <table class = "table table-striped table-bordered table-hover table-condensed" >
                    <c:forEach items="${requestScope.li}" var="lis">
                    <tr>
                    	
                        <td class = "col-lg-3 col-sm-3">${lis.name}</td>
                        <td class = "col-lg-3 col-sm-3">${lis.type}</td>
                        <td class = "col-lg-3 col-sm-3">${lis.disBean.name}</td>
                        <td class = "col-lg-3 col-sm-3">${lis.tree}</td>
                    </tr>
                    </c:forEach>
          		
                </table>
            </div>
          
        </div>
        <br/>
        <!--分页按钮-->
        <div class = "row-fluid">
            <div class = "span12">
                <div>
                    <button id = "previousPage" class = "btn btn-sm" type = "button" style = "line-height:0px">
                        <span class = "glyphicon glyphicon-chevron-left"></span>
                    </button>
                    <input id = "pageNum" type = "text" style = "width: 40px;height: 20px" value="${requestScope.currentPage}"/>
                    <label>/${requestScope.pageNumber}</label>
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
        <div class = "row-fluid">
            <div class = "col-lg-3 col-sm-2 col-sm-offset-2">
                <button id="addDrug" class = "btn" type = "button")">添加药剂</button>
            </div>

            <!--xs自动 lg>=1200px sm<=768px offset列移动-->
            <div class = "col-xs-3 col-lg-6 col-sm-6 col-lg-offset-1 col-sm-offset-1">
                <fieldset>
                    <legend>查询药剂信息</legend>
                    <div class = "row">
                        <div class = "col-xs-10 col-sm-6">
                            <div class = "input-group">
                                <div class = "input-group-btn">
                                    <button id = "selected" type = "button" class = "btn btn-default dropdown-toggle" data-toggle =
                                            "dropdown" value="1">药剂名称<span class = "caret"></span><!--这个span的作用是提供一个下拉图标-->
                                    </button>
                                    <ul id = "ul" class = "dropdown-menu">
                                        <li><a href = "" value="2" onclick="return a(this)">防治类型</a></li>
                                        <li><a href = "" value="3" onclick="return a(this)">适合病虫害</a></li>
                                    </ul>
                                </div>
                                <!-- /btn-group -->
                                <input id = "inputText"  value="${queryVal}" type = "text" class = "form-control" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')">
                            </div>
                            <!-- /input-group -->
                        </div>
                        <div class = "col-xs-6 col-sm-6">
                            <button id = "search" type = "submit" class = "btn">查找</button>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
		$(function(){
			$("#search").click(function(){    //查询建点击
				var Val = $("#inputText").val();	
				var Value = $("#selected").val();		
				$("#drugPanelDiv").load("drug.av",{"Val":Val,"pageNow":1,"Value":Value});
			});
			

			$("#nextPage").click(function(){
		
				if(${requestScope.currentPage} < ${requestScope.pageNumber}){
					$("#drugPanelDiv").load("drug.av",{"pageNow":${requestScope.currentPage} + 1,"Val":$("#inputText").val(),"Value":$("#selected").val()});
				}
				else{
					alert("最后一页了！！！！");
				}
			});
			
			$("#previousPage").click(function(){
				if(${requestScope.currentPage} > 1 ){
					$("#drugPanelDiv").load("drug.av",{"pageNow":${requestScope.currentPage} - 1,"Val":$("#inputText").val(),"Value":$("#selected").val()});
				}
				else	alert("第一页了");
					
			});
			$("#go").click(function(){
				if($("#pageNum").val() <= ${requestScope.pageNumber}  && $("#pageNum").val() >0){
					$("#drugPanelDiv").load("drug.av",{"pageNow":$("#pageNum").val(),"Val":$("#inputText").val(),"Value":$("#selected").val()});
				}
				else{
					alert("请输入范围以内的数字！！！");
					$("#drugPanelDiv").load("drug.av",{"pageNow":1,"Val":$("#inputText").val()});
				}
			});
			$("#addDrug").click(function(){
				$("#drugPanelDiv").load("jsp/resourcemanagement/drugAdd.jsp");
			});
		});
		function a(obj){   //	防治类型点击时对换value值
			var old = $("#selected").text();
			var oldVal = $("#selected").val();

			var New = obj.innerHTML;	
			var NewVal = obj.getAttribute("value");	
			
			obj.innerHTML = old;
			
			obj.setAttribute("value",oldVal);

			$("#selected").text(New);
			$("#selected").val(NewVal);
			return false;
		}
	</script>


<!--   script>

    //数据有效性验证
    $("#pageNum").keydown(function () {
        //只能输入数字
    });

    //事件处理
    $("#previousPage").click(function () {
        //上一页点击事件
       
    });
    $("#nextPage").click(function () {
        //下一页点击事件
        
    });
    $("#go").click(function () {
        //跳转到指定页点击事件
        var num = $("#pageNum").val();
        
    });

    //查询模块事件

</script>-->
</body>
</html>