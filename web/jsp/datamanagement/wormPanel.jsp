<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/9
  Time: 22:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html >
<head >
    <meta charset = "UTF-8" >
    <title >虫害一览</title >
    <style type="text/css">
        #wormPanelDiv {
            /*圆角*/
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
        }
        td {
            font: normal 13px "Microsoft YaHei";
            font-family: "Microsoft YaHei", "微软雅黑", "sans-serif";
        }
    </style >
</head >
<body >
    <div id = "wormPanelDiv" >
        <div class = "container-fluid" >
            <!--标题-->
            <div class = "row-fluid" >
                <div class = "span12" >
                    <h3 class = "text-center" >
                        虫害一览
                    </h3 >
                </div >
            </div >
            <!--表格-->
            <div class = "row-fluid table-responsive" style = "border: solid ;height: 180px" >
            <table class = "table table-hover active table-striped table-bordered" >
                    <tr >
                        <th class = "col-md-2" >名称</th >
                        <th class = "col-md-5 " >寄主</th >
                        <th class = "col-md-5 " >主要危害</th >
                    </tr >
                </table >

                <div id = "tableTD" class = "row-fluid table-responsive" style = "overflow-y: auto;height: 208px;margin-top: -20px" >
                <table id = "table" class = "table table-striped table-bordered table-hover table-condensed " >
					<c:forEach items="${requestScope.pestList}" var = "pestList">
                        
                        <tr  onclick="findID(this,${pestList.id})">
                        
                            <%--到时候直接循环输入信息--%>
                            <!--  
                            <td  class = "col-md-3" style="display: none;">${pestList.id}</td >
                            -->
                            <td  class = "col-md-2 col-sd-2" >${pestList.name}</td >
                            <td  class = "col-md-5 col-sd-2" >${pestList.host}</td >
                            <td  class = "col-md-5 col-sd-2" >${pestList.mainharm}</td >
                        </tr >
					</c:forEach>

                    </table >
                    <input type="hidden" id="hiddenid" value ="-1"/>
                </div >

            </div >
            <br />
            <!--分页按钮-->
            <%--<div id = "pager" style="margin-top: -50px"></div >--%>
            <%--&lt;%&ndash;<h4 id = "result" >Clicked Page 1</h4 >&ndash;%&gt;--%>
            <%--<br />--%>
            <%--<br />--%>
            <%--<br />--%>
            <%--<br />--%>

            <div class = "row-fluid" >
            <div class = "span12" >
                <div >
                    <button id = "previousPage" class = "btn btn-sm" type = "button" style = "line-height:0px" >
                        <span class = "glyphicon glyphicon-chevron-left" ></span >
                    </button >
                    <input id = "pageNum" type = "text" style = "width: 40px;height: 20px" value="${requestScope.currentPage}"/>
                    <label >
                    	/${sessionScope.pageNumber}
                    </label >
                    <button id = "go" class = "btn btn-sm" type = "button" style = "line-height:0px"  >
                        <span class = "glyphicon glyphicon-step-forward" ></span >
                    </button >
                    <button id = "nextPage" class = "btn  btn-sm" type = "button" style = "line-height:0px" >
                        <span class = "glyphicon glyphicon-chevron-right" ></span >
                    </button >
                </div >
            </div >
        </div >
        <br /><br />



            <!--按钮-->
            <div class = "row-fluid" >
                <div class = " col-sm-2" >
                    <button class = "btn" type = "button" onclick = "jump('#wormPanelDiv','jsp/datamanagement/wormAdd.jsp')" >添加新害虫</button >
                </div >
                <div class = "  col-sm-2" >
                    <button id="showBtn" class = "btn" type = "button">查看详细信息</button >
                </div >
               
               
               
               
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
                                            "dropdown" value="" >害虫名<span >&nbsp;</span ><span class = "caret" ></span ><!--这个span的作用是提供一个下拉图标-->
                                    </button>
                                    <ul id = "ul" class = "dropdown-menu">
                                        <li><a id="li1" name="dataAdmin"  href = "#"
                                          		onclick="return getSelect(this,'selected','query')" >寄主</a></li>
                                    </ul>
                                    <input type="hidden" value="害虫名" id="query">
                               
                               
                               
                               
                                </div>
                                <input id = "str" type = "text" class = "form-control" style = "width: 130px">
                            </div>
                        </div>
                        <div class = "col-lg-6 col-sm-6" style="margin-top: 50px">
                            <button id = "search" type = "submit" class = "btn" onclick="pestQuery()">查找</button>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
            
            
            
            
            
            </div >
        </div >
    </div >

<script type="text/javascript">
 
 	$(function(){
	//点击下一页事件
		$("#nextPage").click(function(){
		if(${sessionScope.condition == null}){
			if(${requestScope.currentPage}  ==  ${sessionScope.pageNumber}){
				alert("已经是最后一页了");		
			}else{

				$("#wormPanelDiv").load("pestmage.av",{"pageNow":${requestScope.currentPage}+1})
			}			
		}else{
			if(${requestScope.currentPage}  >=  ${sessionScope.pageNumber}){
				alert("已经是最后一页了");	
			}else{
				$("#wormPanelDiv").load("PestQueryByConditionServlet.av",{"pageNow":${requestScope.currentPage} + 1});
			}
		}
		});
	
	
	
	
	//点击上一页事件
		$("#previousPage").click(function(){
		if(${sessionScope.condition == null}){
			if(${requestScope.currentPage}  ==  1){
				alert("已经是第一页了");		
			}else{
				$("#wormPanelDiv").load("pestmage.av",{"pageNow":${requestScope.currentPage}-1})
			}			
		}else{
			if(${requestScope.currentPage}  ==  1){
				alert("已经是第一页了");	
			}else{
				$("#wormPanelDiv").load("PestQueryByConditionServlet.av",{"pageNow":${requestScope.currentPage}-1});
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
					$("#wormPanelDiv").load("pestmage.av",{"pageNow":$("#pageNum").val()});
				}else{
					$("#wormPanelDiv").load("PestQueryByConditionServlet.av",{"pageNow":$("#pageNum").val()});
				}
			}
		});
 
		  //查看被选中行的的详细信息
		 $("#showBtn").click(function () {
		     if (document.getElementById("hiddenid").value != -1) {
		     
		         $("#wormPanelDiv").load("PestInfoServlet.av", {'id': $("#hiddenid").val()});
		         return false;
		    } else alert("请选择行");
		});
 	
 	
 	
 	
 	
 	
 	});
 
 
 		//信息条点击事件
		function findID(obj1,obj2){
			
			$("tr").css("color","brack");
			obj1.style.color="red";
			$("#hiddenid").val(obj2);

		};
		//查询按钮的点击事件
		function pestQuery(){
		
			var condition = document.getElementById("query").value;
			
			$("#wormPanelDiv").load("PestQueryByConditionServlet.av",{'pageNow':-1,'condition':condition,"value":$("#str").val()});
			
		};
		
 
 
 
 //function check(obj,id){
 //  document.getElementById("hid").value=id;
//     obj.style.backgroundColor = "red";
//     $("tr").css("background-color", "white");
//     obj.style.backgroundColor = "red";
//}


</script>

</body >
</html >

