<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--<link rel="stylesheet" type="text/css" href="styles.css">-->
    <meta charset = "UTF-8">
    <title>添加用户</title>
    <style type = "text/css">
        #body {
            width: 370px;
            height: 390px;}
    </style>
  </head>
  
  <body>
    <div id = "userAddDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    添加用户
                </h3>
            </div>
        </div>
        <!--内容-->
        <div style = "margin-left:310px;margin-top: 10px">
            <!--表单-->
            
                <div id = "body">
                    <!--第一行 用户名-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "username"
                                   class = "col-lg-4 col-sm-4   control-label ">用&nbsp;&nbsp;户&nbsp;&nbsp;名:</label>
                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "username">
                            </div>
                        </div>
                        <label id = "usernameInfo" name = "usernameInfo" style="margin-left: 300px;margin-top: -50px;color: red" ></label >
                    </div>
                    <!--第二行 密码-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "password"
                                   class = "col-lg-4 col-sm-4   control-label ">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "password">
                            </div>
                        </div>
                        <label id = "passwordInfo" name = "passwordInfo" style="margin-left: 300px;margin-top: -50px;color: red" ></label >
                    </div>
                    <!--第三行 确认密码-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "confirm"
                                   class = "col-lg-4 col-sm-4   control-label ">确认密码:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "confirm">
                            </div>
                        </div>
                        <label id = "confirmInfo" name = "nameInfo" style="margin-left: 300px;margin-top: -50px;color: red" ></label >
                    </div>
                    <!--第四行 真实姓名-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "realname"
                                   class = "col-lg-4 col-sm-4   control-label ">真实姓名:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "realname">
                            </div>
                        </div>
                        <label id = "realnameInfo" name = "realnameInfo" style="margin-left: 300px;margin-top: -50px;color: red" ></label >
                    </div>

                    <!--第五行 用户等级-->
                    <div class = "row" style = "margin-top: 20px;margin-left: 19px">
                        <div class = "form-group" style = "float: left">
                            <label class = " control-label ">用户等级:</label>

							<!--  下拉列表控件，带一个hidden域-->
                            <div class = "btn-group" style = "margin-left: 24px">
                                <button name="Admin" id = "selected" type = "button" class = "btn btn-default dropdown-toggle" data-toggle =
                                            "dropdown" value=""  style="width: 165px;left: -9px">超级管理员<span >&nbsp;</span ><span class = "caret" ></span ><!--这个span的作用是提供一个下拉图标-->
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
                                <button type = "submit" class = "btn btn-default" onclick="add()">添加</button>
                            </div>
                        </div>
                    </div>
                </div>
           
        </div>
    </div>
</div>


<script type="text/javascript">
	function add(){
		
		var username = $("#username").val();
		
		var password = $("#password").val();
		
		var confirm = $("#confirm").val();
		
		var realname = $("#realname").val();
		
		var degree = document.getElementById("hidden").value;
		
		if(username == null || username == ""){
			$("#usernameInfo").text("用户名不能为空");
		}
		if(password == null || password == ""){
			$("#passwordInfo").text("密码不能为空");
		}
		if(realname == null || realname == ""){
			$("#realnameInfo").text("真实姓名不能为空");
		}
		else{
					
			if(password == confirm){
			$("#userAddDiv").load("UserAddServlet.av",
			{"username":username,"password":password,
			"realname":realname,"degree":degree});
			}
			else{
				alert("两次密码输入不一致!添加失败")
				return jump('#userAddDiv','userPanel.av','-1')
				
			}
		
		
	
	
	}


}

</script>




  </body>
</html>

