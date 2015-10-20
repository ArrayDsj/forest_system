<!DOCTYPE html>
<%@ page contentType = "text/html;charset=UTF-8" language = "java" pageEncoding = "UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang = "en">
<head>
    <meta charset = "UTF-8">
    <title>器械管理</title>
    <style>
        #apparatusPanelDiv {
            background-color: silver;
            width: 920px;
            height: 500px;
            margin-left: 0px;
            margin-top: 0px;
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
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<body>
<input type="hidden" id="select" value="${select}">
<div id = "apparatusPanelDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    器械一览
                </h3>
            </div>
        </div>
        <!--表格-->
        <div class = "row-fluid" style = "border: solid">
            <!--表头-->
            <table class = "table table-hover active">
                <tr >
                    <th class = "col-lg-3 col-sm-3">名称</th>
                    <th class = "col-lg-3 col-sm-3">防治类型</th>
                    <th class = "col-lg-6 col-sm-6">主要用途</th>
                </tr>
            </table>
            <div style = "overflow-y: auto;height: 170px;" class = "row-fluid" id = "tableTD">
                <table class = "table table-striped table-bordered table-hover table-condensed">
					<c:forEach items="${requestScope.al}" var="al">                 
                   <tr onclick = "select(this,'#selectID','#stageID','#status')" >
                        <td class = "col-lg-3 col-sm-3">${al.name}</td>
                        <td class = "col-lg-3 col-sm-3">${al.type}</td>
                        <td class = "col-lg-6 col-sm-6">${al.mainUse}</td>
                    </tr>
                   </c:forEach> 
                </table>
            </div>
           
        </div>
        <br />
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
                <button class = "btn" type = "button" id="addApparatus">添加器械</button>
            </div>

            <!--xs自动 lg>=1200px sm<=768px offset列移动-->
            <div class = "col-xs-3 col-lg-6 col-sm-6 col-lg-offset-1 col-sm-offset-1">
                <fieldset>
                    <legend>查询器械信息</legend>
                    <div class = "row">
                        <div class = "col-xs-10 col-sm-6">
                            <div class = "input-group">
                                <div class = "input-group-btn">
                                    <button id = "selected" type = "button" class = "btn btn-default dropdown-toggle" data-toggle =
                                            "dropdown" value="1">器械名称<span class = "caret"></span><!--这个span的作用是提供一个下拉图标-->
                                    </button>
                                    <ul id = "ul" class = "dropdown-menu">
                                        <li><a href = "#" value="2" onclick="return a(this)">防治类型</a></li>
                                    </ul>
                                </div>
                                <!-- /btn-group -->
                                <input id = "inputText" value="${queryVal}" type = "text" class = "form-control">
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
    //数据有效性验证
    $("#pageNum").keydown(function () {
        //只能输入数字
        
    });
    $("#addApparatus").click(function(){
    	$("#apparatusPanelDiv").load("jsp/resourcemanagement/apparatusAdd.jsp");
    });
    
	$("#search").click(function(){
		var Val = $("#inputText").val();	
		var Value = $("#select").val();		
		$("#apparatusPanelDiv").load("apparatus.av",{"Val":Val,"pageNow":1,"Value":Value});
	});
    //事件处理
    $("#previousPage").click(function(){
        //上一页点击事件
       if(${requestScope.currentPage} > 1){
       		$("#apparatusPanelDiv").load("apparatus.av",{"pageNow":${requestScope.currentPage} - 1,"Val":$("#inputText").val(),"Value":$("#select").val()});
       				}
       else{
       	alert("已经是首页了!!!");
       }
    });
    $("#nextPage").click(function () {
        //下一页点击事件
        if(${requestScope.currentPage} < ${requestScope.pageNumber}){
					$("#apparatusPanelDiv").load("apparatus.av",{"pageNow":${requestScope.currentPage} + 1,"Val":$("#inputText").val(),"Value":$("#select").val()});
				}
				else{
					alert("最后一页了！！！！");
				}
    });
    $("#go").click(function () {
        //跳转到指定页点击事件
        if( $("#pageNum").val() <= ${requestScope.pageNumber} && $("#pageNum").val() > 0){
					$("#apparatusPanelDiv").load("apparatus.av",{"pageNow":$("#pageNum").val(),"Val":$("#inputText").val(),"Value":$("#select").val()});
				}
				else{
					$("#apparatusPanelDiv").load("apparatus.av",{"pageNow":1,"Val":$("#inputText").val()});
				}
    });
  });  
    function a(obj){
    		var old = $("#selected").text();
			var oldVal = $("#selected").val();

			var New = obj.innerHTML;	
			var NewVal = obj.getAttribute("value");	
			
			obj.innerHTML = old;
			
			obj.setAttribute("value",oldVal);

			$("#selected").text(New);
			$("#selected").val(NewVal);
    	
    	$("#select").val(NewVal);
    	
    	return false;
    }

    //查询模块事件

</script>
</body>
</html>