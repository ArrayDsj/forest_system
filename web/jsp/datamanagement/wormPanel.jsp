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
            <div class = "row-fluid table-responsive" style = "border: solid" >
            <table class = "table table-hover active table-striped table-bordered" >
                    <tr >
                        <th class = "col-md-2" >名称</th >
                        <th class = "col-md-5 " >寄主</th >
                        <th class = "col-md-5 " >主要危害</th >
                    </tr >
                </table >
                
                <div id = "tableTD" class = "row-fluid table-responsive" style = "overflow-y: auto;height: 208px;margin-top: -20px" >
                <table id = "table" class = "table table-striped table-bordered table-hover table-condensed " >
					<c:forEach items="${requestScope.empList}" var = "emp">
                        <tr onclick="check(this,${emp.id})">
                            <%--到时候直接循环输入信息--%>
                            <td id = "id" class = "col-lg-3" style="display: none;">${emp.id}</td >
                            <td id = "name" class = "col-md-2" >${emp.name}</td >
                            <td id = "host" class = "col-md-5" >${emp.host}</td >
                            <td id = "harm" class = "col-md-5" >${emp.mainharm}</td >
                        </tr >
					</c:forEach>

                    </table >
                    <input type="hidden" id="hid" value ="-1"/>
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
                    <label >/${requestScope.allPage}</label >
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
                    <button id="butid" class = "btn" type = "button">查看详细信息</button >
                </div >
                <!--xs自动 lg>=1200px sm<=768px offset列移动-->
                <div class = "col-lg-6 col-sm-6 col-lg-offset-1 col-sm-offset-1" >
                    <fieldset >
                        <legend >查询虫害信息</legend >
                        <div class = "row" >
                            <div class = "col-xs-10 col-sm-6" >
                                <div class = "input-group" >
                                    <div class = "input-group-btn" >
                                    
                                        <button id = "selected" type = "button" class = "btn btn-default dropdown-toggle" data-toggle =
                                                "dropdown" >请选择<span>&nbsp;</span><span class = "caret" ></span >
                                        </button >
                                        <ul id = "ul" class = "dropdown-menu" >
                                            <li><a id = 'li1' name="li1" value="0" href = "javascript:querySelect('#li1','selected')" >寄生虫</a ></li >
                                            <li><a id = 'li2' name="li2" value="1" href = "javascript:querySelect('#li2','selected')" >寄主</a ></li >
                                        </ul >
                                    </div >
                                    <!-- /btn-group -->
                                    <input id = "inputText" type = "text" class = "form-control" >
                                </div >
                                <!-- /input-group -->
                            </div >
                            <div class = "col-xs-6 col-sm-6" >
                                <button id = "search" type = "button" class = "btn" >查找</button >
                            </div >
                        </div >
                    </fieldset >
                </div >
            </div >
        </div >
    </div >

<script type="text/javascript">
 function check(obj,id){
   document.getElementById("hid").value=id;
     obj.style.backgroundColor = "red";
     $("tr").css("background-color", "white");
     obj.style.backgroundColor = "red";
}
 //查看按钮
$(function(){
    $("#butid").click(function(){
        if (document.getElementById("hid").value != -1) {
            $("#wormPanelDiv").load("../PestInfoServlet.av", {"id": $("#hid").val()});
        } else alert("请选择行");
    })
})
</script>

    <script >
        <%--&lt;%&ndash;分页操作&ndash;%&gt;--%>
        <%--$(document).ready(function () {--%>
            <%--$("#pager").pager({pagenumber: 1, pagecount: 15, buttonClickCallback: PageClick});--%>
        <%--});--%>

        <%--PageClick = function (pageclickednumber) {--%>
            <%--$("#pager").pager({pagenumber: pageclickednumber, pagecount: 15, buttonClickCallback: PageClick});--%>
            <%--$("#result").html("Clicked Page " + pageclickednumber);--%>
        <%--};--%>



        //事件处理
        $("#previousPage").click(function () {
            //上一页点击事件
            	if(parseInt(${requestScope.currentPage}) > 1){
					$("#wormPanelDiv").load("../pestmage.av",{"pageNow":${requestScope.currentPage} - 1});
				}else{
					alert("已是第一页！");
				}
			
				return false;
        });
        $("#nextPage").click(function () {
            //下一页点击事件
            	if(${requestScope.currentPage} < ${requestScope.allPage}){
					$("#wormPanelDiv").load("../pestmage.av",{"pageNow":${requestScope.currentPage} + 1});
				}else{
					alert("已是最后一页！");
				}
		
				return false;
		});

        $("#go").click(function () {
            //跳转到指定页点击事件
            var num = $("#pageNum").val();
	        	if(num <= ${requestScope.currentPage} && num > 0){
	            	$("#wormPanelDiv").load("../pestmage.av",{"pageNow":num});
	            }else{
	            	alert("没有该页面，不能跳转");
	            }
	        
	        return false;
        });
        
        
        //});
        //查询模块事件
    </script >
</body >
</html >

