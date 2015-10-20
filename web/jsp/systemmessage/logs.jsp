<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<meta charset = "UTF-8">
    <title>日志一览</title>
    <style>
        #logsDiv {
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
  
  <body>
<div id = "logsDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    日志一览
                </h3>
            </div>
        </div>

        <!--表格-->
        <div class = "row-fluid" style = "border: solid">
            <table class = "table table-hover active">
                <tr class = "active">
                    <th class = "col-lg-3 col-sm-3">日志内容</th>
                    <th class = "col-lg-3 col-sm-3">日期</th>
                </tr>
            </table>
            <div></div>
            <div id = "tableTD" class = "row-fluid" style = "overflow-y: auto;height: 208px;margin-top: -20px" >
                    <table class = "table table-striped table-bordered table-hover table-condensed" >
                   
                   
                   <c:forEach items="${requestScope.logList}" var="logs">
                    <tr class="rom">
                        <td class = "col-lg-3 col-sm-3">${logs.content}</td>
                        <td class = "col-lg-3 col-sm-3">${logs.time}</td>
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
                    <input id = "pageNum" type = "text" style = "width: 40px;height: 25px" onkeydown = "onlyNum()" value="${requestScope.currentPage}"/>
                    <label>
                   		/ ${sessionScope.pageNumber} 
                    </label>
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
        
        
        
        <div class = "col-xs-3 col-lg-6 col-sm-6  col-sm-offset-4" style = "margin-left: 440px;margin-top: -50px" >
                <%--时间控件--%>
            <fieldset >
                <legend >日期查询</legend >
                <div class = "form-group " style="margin-top: -15px">
                    <label class = "col-md-3 control-label" >起始日期</label >
                    <div id = "datetimepickerStar" class = "input-group date form_date col-md-6" data-date = "" data-date-format =
                            "yyyy-mm-dd"
                         data-link-format = "yyyy-mm-dd" >
                        <input id="start" class = "form-control" size = "10" type = "text" value = "" readonly = "readonly" onclick =
                                "selectTime()" >
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
                        <input id="end" class = "form-control" size = "10" type = "text" value = "" readonly = "readonly"
                               onclick = "selectTime('start')" >
                        <span class = "input-group-addon" ><span class = "glyphicon glyphicon-remove" ></span ></span >
                        <span class = "input-group-addon" ><span class = "glyphicon glyphicon-calendar"
                                                                 onclick = "selectTime('datetimepickerEnd')" ></span ></span >
                    </div >
                    <button id="queryByDate" type = "button" class = "btn"  style="margin-top: -34px;margin-left: 350px;">查找
                    </button >
                </div >
            </fieldset >
        </div >
    </div>
</div>
 
<script type="text/javascript">
		
	$(function(){	
		//点击下一页事件
		$("#nextPage").click(function(){
		if(${sessionScope.start == null}){
			if(${requestScope.currentPage}  ==  ${sessionScope.pageNumber}){
				alert("已经是最后一页了");		
			}else{
				$("#logsDiv").load("log.av",{"pageNow":${requestScope.currentPage} + 1})
			}			
		}else{
			if(${requestScope.currentPage} >=  ${sessionScope.pageNumber}){
				alert("已经是最后一页了");	
			}else{
				$("#logsDiv").load("LogQueryByDateServlet.av",{"pageNow":${requestScope.currentPage} + 1});
			}
		}
		});
		
		
		//点击上一页事件
		$("#previousPage").click(function(){
		if(${sessionScope.start == null}){
			if(parseInt(${requestScope.currentPage}) ==  1){
				alert("已经是第一页了");		
			}else{
				$("#logsDiv").load("log.av",{"pageNow":${requestScope.currentPage}-1})
			}			
		}else{
			if(parseInt(${requestScope.currentPage})  ==  1){
				alert("已经是第一页了");	
			}else{
				$("#logsDiv").load("LogQueryByDateServlet.av",{"pageNow":${requestScope.currentPage}-1});
			}
		}
		});
		
		
		//选择页面跳转事件
		$("#go").click(function(){
			if($("#pageNum").val() < 1 || $("#pageNum").val() > ${sessionScope.pageNumber} ){
				alert("页数超出范围");
			}
			else{
				if(${sessionScope.start == null}){
					$("#logsDiv").load("log.av",{"pageNow":$("#pageNum").val()});
				}else{
					$("#logsDiv").load("LogQueryByDateServlet.av",{"pageNow":$("#pageNum").val()});
				}
			}
		});
		
		$("#queryByDate").click(function(){
		var start = $("#start").val();
		var end = $("#end").val();
		if(start>end) {
            alert("您选择的时间有误，请重新选择！");
            $("#logsDiv").load("log.av", {"pageNow": -1});
        }
        else
			$("#logsDiv").load("LogQueryByDateServlet.av",{"pageNow":-1,"start":$("#start").val(),"end":$("#end").val()})
		});
	});
	

   

</script>
</body>
</html>
