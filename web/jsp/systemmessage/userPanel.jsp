<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
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
    <title>用户管理</title>
    
    <style>
        #userPanelDiv {

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
<div id = "userPanelDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    用户管理
                </h3>
            </div>
        </div>
        <!--表格-->
        <div class = "row-fluid" style = "border: solid">
            <table class = "table table-hover active">
                <tr>
                    <th class = "col-lg-3 col-sm-3">用户名</th>
                    <th class = "col-lg-3 col-sm-3">密码</th>
                    <th class = "col-lg-3 col-sm-3">等级</th>
                    <th class = "col-lg-3 col-sm-3">真实姓名</th>
                </tr>
            </table>

            <div id = "tableTD" class = "row-fluid" style = "overflow-y: auto;height: 208px;margin-top: -20px" >
                    <table class = "table table-striped table-bordered table-hover table-condensed" >
               	

                  <c:forEach items="${requestScope.userList}" var="alluser">
                    <tr onclick="findID(this,${alluser.id})">
                        <td class = "col-lg-3 col-sm-3">${alluser.name}</td>
                        <td class = "col-lg-3 col-sm-3">${alluser.password }</td>
                        <td class = "col-lg-3 col-sm-3">${alluser.degree}</td>
                        <td class = "col-lg-3 col-sm-3">${alluser.realName}</td>
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
                    <input id = "pageNum" type = "text" style = "width: 40px;height: 25px" onkeydown = "onlyNum()" value="${requestScope.currentPage}" />
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
                    <button id="userAdd" class = "btn" type = "button" onclick = "return jump('#otherHtml','jsp/systemmessage/userAdd.jsp')">添加用户</button>
                </div>
                <div class = "col-lg-3 col-sm-2 col-sm-offset-3">
                    <button id="deletBtn" class = "btn" type = "button" >删除用户</button>
                </div>
            </div>
            <div class = "row-fluid">
                <div class = "col-lg-3 col-sm-3 col-sm-offset-2" style = "margin-top: 20px">
                    <button id="userUpdate" class = "btn" type = "button" >修改用户信息</button>
                </div>
            </div>
        </div>
		<!-- 下拉列表 -->
        <div class = "row-fluid" id = "rightBtns" style = "float: left; margin-top: -40px">
            <!--xs自动 lg>=1200px sm<=768px offset列移动-->
            <div class = "col-xs-3 col-lg-6 col-sm-6  col-sm-offset-4" style = "margin-top: -85px;margin-left: 400px">
                <fieldset>
                    <legend>查询用户信息</legend>
                    <div class = "row">
                        <div class = "col-xs-10 col-sm-6 col-lg-6">
                            <div class = "input-group">
                                <div class = "input-group-btn">
                                
                                
                                <!--  下拉列表控件，带一个hidden域-->
                                    <button name="Admin" id = "selected" type = "button" class = "btn btn-default dropdown-toggle" data-toggle =
                                            "dropdown" value="" >超级管理员<span >&nbsp;</span ><span class = "caret" ></span ><!--这个span的作用是提供一个下拉图标-->
                                    </button>
                                    <ul id = "ul" class = "dropdown-menu">
                                        <li><a id="li1" name="dataAdmin"  href = "#"
                                          		onclick="return getSelect(this,'selected','hidden')" >资料管理员</a></li>
                                        <li><a id="li2" name="disasterAdmin" href = "#"
                                        		onclick="return getSelect(this,'selected','hidden')">灾情管理员</a></li>
                                        <li><a id="li3" name="proficientAdmin" href = "#"
                                        		onclick="return getSelect(this,'selected','hidden')">专家管理员</a></li>
                                        <li><a id="li4" name="storeroomAdmin" href = "#"
                                        		onclick="return getSelect(this,'selected','hidden')">库房管理员</a></li> 
                                    </ul>
                                    <input type="hidden" value="超级管理员" id="hidden">
                                </div>          
                            </div>
                            <!-- /input-group -->
                        </div>
                        <div class = "col-lg-6 col-sm-6">
                            <button id = "search" type = "button" class = "btn"
                            onclick="logQuery()">查找</button>
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
				$("#userPanelDiv").load("userPanel.av",{"pageNow":${requestScope.currentPage}+1})
			}			
		}else{
			if(${requestScope.currentPage}  >=  ${sessionScope.pageNumber}){
				alert("已经是最后一页了");	
			}else{
				$("#userPanelDiv").load("userQueryByConditionServlet.av",{"pageNow":${requestScope.currentPage} + 1});
			}
		}
		});
		
		
		//点击上一页事件
		$("#previousPage").click(function(){
		if(${sessionScope.condition == null}){
			if(${requestScope.currentPage}  ==  1){
				alert("已经是第一页了");		
			}else{
				$("#userPanelDiv").load("userPanel.av",{"pageNow":${requestScope.currentPage}-1})
			}			
		}else{
			if(${requestScope.currentPage}  ==  1){
				alert("已经是第一页了");	
			}else{
				$("#userPanelDiv").load("userQueryByConditionServlet.av",{"pageNow":${requestScope.currentPage}-1});
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
					$("#userPanelDiv").load("userPanel.av",{"pageNow":$("#pageNum").val()});
				}else{
					$("#userPanelDiv").load("userQueryByConditionServlet.av",{"pageNow":$("#pageNum").val()});
				}
			}
		});
		
		
		//删除员工信息事件
		$("#deletBtn").click(function(){
			$("#userPanelDiv").load("UserDeleteServlet.av",{"id":$("#hidden").val()});
		});
		
		
		$("#userUpdate").click(function(){
			$("#userPanelDiv").load("UserShowServlet.av",{"id":$("#hidden").val()});
		
		
		
		})
		
	});
	
	
	
		//查询按钮的点击事件，跳转到相应的servlet并将下拉列表中的值和初始化页码传递过去
		function logQuery(){
		
			var condition = document.getElementById("hidden").value;
			
			$("#userPanelDiv").load("userQueryByConditionServlet.av",{'pageNow':-1,'condition':condition});
			
		};
		
		//信息条点击事件
		function findID(obj1,obj2){
			$("tr").css("color","brack");
			obj1.style.color="red";
			$("#hidden").val(obj2);
		}

	</script>


	
	
	
</body>
</html>
