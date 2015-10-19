<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
    <title>修改用户信息</title>
    <style type = "text/css">
        #body {
            width: 370px;
            height: 390px;
        }
    </style>
  </head>
  
 <body>
<div id = "userUpdateDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    修改用户信息
                </h3>
            </div>
        </div>
        <!--内容-->
        <div style = "margin-left:310px;margin-top: 10px">
            <!--表单-->
            
                <div id = "body">
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px;margin-left: -5px">
                        <div class = "form-group" style = "float: left">
                        	 <input type="hidden" id="hiddenID" value="">
                            <label class = "col-lg-6 control-label ">用&nbsp;&nbsp;户&nbsp;&nbsp;名:</label>
                            <span class = "col-lg-6 control-label ">${user.name}</span>
                        </div>
                    </div>
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "password" class = "col-lg-4 col-sm-4   control-label ">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</label>
                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "password">
                            </div>
                        </div>
                    </div>
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "confirm"
                                   class = "col-lg-4 col-sm-4   control-label ">确认密码:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "confirm">
                            </div>
                        </div>
                    </div>
                    <!--第四行-->
                    <div class = "row" style = "margin-top: 20px;margin-left:0px">
                        <div class = "form-group" style = "float: left">
                            <label class = "col-lg-8 col-sm-8 control-label  " style="left:  -18px">真实姓名:</label>
                            <span class = "col-lg-8 col-sm-8 control-label " style="top: -28px;left: 50px">${user.realName}</span>
                        </div>
                    </div>

                    <!--第五行-->
                    <div class = "row" style = "margin-top: 0px;margin-left: 8px">
                        <div class = "form-group" style = "float: left">
                            <label class = " control-label ">用户等级:</label>

                            <div class = "btn-group" style = "margin-left: 24px">
                               
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
                    </div>

                </div>

                <div id = "foot">
                    <div class = "row">
                        <div class = "form-group">
                            <div class = "col-sm-offset-3 col-sm-5" style = "margin-top:-40px">
                                <button type = "submit" class = "btn btn-default" onclick="update()">修改</button>
                            </div>
                        </div>
                    </div>
                </div>
          
        </div>
    </div>
</div>
<script type="text/javascript">
	
	$(function(){
		$("#hiddenID").val("${user.id}");
	})
	
	
	function update(){
		if($("#password").val() == "" || $("#confirm").val() == ""){
			alert("输入不能为空");
		}
		else{
			if($("#password").val()==$("#confirm").val()){
				$("#userPanelDiv").load("UserUpdateServlet.av",{"id":$("#hiddenID").val(),"confirm":$("#confirm").val(),"degree":$("#hidden").val()});
			}
			else{
				$("#userPanelDiv").load("userPanel.av",{"pageNow":-1});
				alert("密码输入不一致!修改失败")
			}
					
		}
	

	
	}
	
	
	
		

	







</script>



</body>
</html>
