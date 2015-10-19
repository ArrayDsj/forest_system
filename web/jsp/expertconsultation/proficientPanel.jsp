<!DOCTYPE html>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset = "UTF-8">
    <title>专家一览</title>
    <style>
        #proficientPanelDiv {
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
<div id = "proficientPanelDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    专家一览
                </h3>
            </div>
        </div>
        <!--表格-->
        <div class = "row-fluid" style = "border: solid">
            <table class = "table table-hover active">
                <tr>
                    <th class = "col-lg-3 col-sm-3">姓名</th>
                    <th class = "col-lg-2 col-sm-2">工作单位</th>
                    <th class = "col-lg-3 col-sm-3">专长</th>
                    <th class = "col-lg-2 col-sm-2">职务</th>
                    <th class = "col-lg-2 col-sm-2">电话</th>
                </tr>
            </table>

            <div style = "overflow-y: auto;height: 125px; margin-top: -20px" class = "row-fluid" id = "tableTD">
                <table class = "table table-striped table-bordered table-hover table-condensed">
                    
                    <c:forEach items="${requestScope.proList}" var="proList">
                    
                    <tr onclick="findID(this,${proList.id})">
                        <td class = "col-lg-3 col-sm-3">${proList.name}</td>
                        <td class = "col-lg-2 col-sm-2">${proList.workUnit}</td>
                        <td class = "col-lg-3 col-sm-3">${proList.speciality}</td>
                        <td class = "col-lg-2 col-sm-2">${proList.degree}</td>
                        <td class = "col-lg-2 col-sm-2">${proList.phoneNumber}</td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
            </table>
        </div>
        <br />
        <!--分页按钮-->
        <div class = "row-fluid">
            <div class = "span12">
                <div>
                    <button id = "previousPage" class = "btn btn-sm" type = "button" style = "line-height:0px">
                        <span class = "glyphicon glyphicon-chevron-left"></span>
                    </button>
                    <input id = "pageNum" type = "text" style = "width: 40px;height: 25px" value="${requestScope.currentPage}"/>
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
        <!--按钮-->
        <div id = "leftBtns" style = "float: left">
            <div class = "row-fluid">
                <div class = "col-lg-3 col-sm-2 col-sm-offset-2">
                    <button  class = "btn" type = "button" onclick = "return jump('#otherHtml','jsp/expertconsultation/proficientAdd.jsp')" >添加专家</button>
                </div>
                <div class = "col-lg-3 col-sm-2 col-sm-offset-3">
                    <button id="showBtn" class = "btn" type = "button" >查看专家息</button>
                </div>
            </div>
            <div class = "row-fluid">
                <div class = "col-lg-3 col-sm-3 col-sm-offset-2" style = "margin-top: 20px">
                    <button id="updateBtn" class = "btn" type = "button" >修改专家信息</button>
                </div>
                <div class = "col-lg-3 col-sm-3 col-sm-offset-3" style = "margin-top: 20px">
                    <button id="deletBtn" class = "btn" type = "button" >删除专家</button>
                </div>

            </div>
        </div>

        <div class = "row-fluid" id = "rightBtns" style = "float: left; ">
            <!--xs自动 lg>=1200px sm<=768px offset列移动-->
            <div  style = "margin-top: -84px;margin-left: 440px">
                <fieldset>
                    <legend>查询专家信息</legend>
                    <div class = "row">
                        <div class = " col-lg-6 col-sm-6">
                            <div class = "input-group">
                                <div class = "input-group-btn">
                                   
                                   
                                     <!--  下拉列表控件，带一个hidden域-->
                                    <button name="Admin" id = "selected" type = "button" class = "btn btn-default dropdown-toggle" data-toggle =
                                            "dropdown" value="" >专家姓名<span >&nbsp;</span ><span class = "caret" ></span ><!--这个span的作用是提供一个下拉图标-->
                                    </button>
                                    <ul id = "ul" class = "dropdown-menu">
                                        <li><a id="li1" name="dataAdmin"  href = "#"
                                          		onclick="return getSelect(this,'selected','hidden')" >专长</a></li>
                                        <li><a id="li2" name="disasterAdmin" href = "#"
                                        		onclick="return getSelect(this,'selected','hidden')">工作单位</a></li>
                                    </ul>
                                    <input type="hidden" value="专家姓名" id="hidden">
                               
                               
                               
                               
                                </div>
                                <input id = "inputText" type = "text" class = "form-control" style = "width: 130px">
                            </div>
                        </div>
                        <div class = "col-lg-6 col-sm-6" style="margin-top: 50px">
                            <button id = "search" type = "submit" class = "btn" onclick="proficientQuery()">查找</button>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
	$(function(){
	//点击下一页事件
		$("#nextPage").click(function(){
		if(${sessionScope.condition == null}){
			if(${requestScope.currentPage}  ==  ${sessionScope.pageNumber}){
				alert("已经是最后一页了");		
			}else{
				$("#proficientPanelDiv").load("ProficientQueryServlet.av",{"pageNow":${requestScope.currentPage}+1})
			}			
		}else{
			if(${requestScope.currentPage}  >=  ${sessionScope.pageNumber}){
				alert("已经是最后一页了");	
			}else{
				$("#proficientPanelDiv").load("ProficientQueryByConditionServlet.av",{"pageNow":${requestScope.currentPage} + 1});
			}
		}
		});
	
	
	
	
	//点击上一页事件
		$("#previousPage").click(function(){
		if(${sessionScope.condition == null}){
			if(parseInt(${requestScope.currentPage})  ==  1){
				alert("已经是第一页了");		
			}else{
				$("#proficientPanelDiv").load("ProficientQueryServlet.av",{"pageNow":${requestScope.currentPage}-1})
			}			
		}else{
			if(parseInt(${requestScope.currentPage})  ==  1){
				alert("已经是第一页了");	
			}else{
				$("#proficientPanelDiv").load("ProficientQueryByConditionServlet.av",{"pageNow":${requestScope.currentPage}-1});
			}
		}
		});
			//选择页面跳转事件
		$("#go").click(function(){
			if($("#pageNum").val() < 1 || $("#pageNum").val() > ${sessionScope.pageNumber} ){
				alert("页数超出范围");
			}
			else{
				if(${sessionScope.condition == null}){
					$("#proficientPanelDiv").load("ProficientQueryServlet.av",{"pageNow":$("#pageNum").val()});
				}else{
					$("#proficientPanelDiv").load("ProficientQueryByConditionServlet.av",{"pageNow":$("#pageNum").val()});
				}
			}
		});
		
		//查看专家信息事件
		$("#showBtn").click(function(){
			$("#proficientPanelDiv").load("ProficientShowServlet.av",{"id":$("#hidden").val()});
		});
		//修改专家信息事件
		$("#updateBtn").click(function(){
			$("#proficientPanelDiv").load("ProficientShowForUpdateServlet.av",{"id":$("#hidden").val()});
		
		})
		
		
		
		//删除专家信息事件
		$("#deletBtn").click(function(){
			$("#proficientPanelDiv").load("ProficientDeleteServlet.av",{"id":$("#hidden").val()});
		});
		
		
		
		
		
	
	});



	
		//查询按钮的点击事件，跳转到相应的servlet并将下拉列表中的值和初始化页码传递过去
		function proficientQuery(){
		
			var condition = document.getElementById("hidden").value;
			
			$("#proficientPanelDiv").load("ProficientQueryByConditionServlet.av",{'pageNow':-1,'condition':condition,"value":$("#inputText").val()});
			
		};
		
		//信息条点击事件
		function findID(obj1,obj2){
			$("#hidden").val(obj2);
            obj1.style.backgroundColor = "red";
            $("tr").css("background-color", "white");
            obj1.style.backgroundColor = "red";
		}




</script>

</body>
</html>