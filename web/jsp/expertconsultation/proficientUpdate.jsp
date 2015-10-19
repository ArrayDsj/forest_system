<!DOCTYPE html>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<html>
<head>
    <meta charset = "UTF-8">
    <title>修改专家信息</title>
    <style type = "text/css">
        span {
            font-size: 16px;
        }
    </style>
</head>
<body>
<div id = "proficientUpdateDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    修改专家信息
                </h3>
            </div>
        </div>
        <!--内容-->
        <div style = "margin-left:50px;margin-top: 10px">
            
                <div id = "left" style = "width: 370px;height: 390px;float: left">
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px">
                         <input type="hidden" id="hiddenID" value="">
                        <span class = "col-lg-4  control-label ">姓名:</span>
                        <span class = "col-lg-4  control-label ">${pro.name}</span>
                    </div>
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 40px">
                        <span class = "col-lg-4  control-label ">出生年月:</span>
                        <span class = "col-lg-4  control-label ">${pro.birthday}</span>
                    </div>
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 40px">
                        <span class = "col-lg-4  control-label ">性别:</span>
                        <span class = "col-lg-4  control-label ">${pro.gender}</span>
                    </div>
					<!--第四行-->
					<div class = "row" style = "margin-top: 40px">
                        <span class = "col-lg-4  control-label ">专长:</span>
                        <span class = "col-lg-4  control-label ">${pro.speciality}</span>
                    </div>
                    

                    <!--第五行-->
                    
                    
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "phone" class = "col-lg-4 col-sm-4   control-label ">电话:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input id = "phone" type = "text" class = "form-control" >
                            </div>
                        </div>
                    </div>
                    <!--第六行-->
                    <div class = "row" style = "margin-top: 40px">
                        <span class = "col-lg-4  control-label ">通讯地址:</span>
                        <span class = "col-lg-4  control-label ">${pro.address}</span>
                    </div>
                </div>
                <div id = "right" style = "width: 370px;height: 390px;float: left;margin-left: 10px">
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px">
                        <span class = "col-lg-4  control-label ">照片:</span>
                        <img src = "image/8.jpg" />
                    </div>
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "position" class = "col-lg-4 col-sm-4   control-label ">职务:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input id = "degree" type = "text" class = "form-control" >
                            </div>
                        </div>
                    </div>
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "unit" class = "col-lg-4 col-sm-4   control-label ">单位:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input id = "unit" type = "text" class = "form-control" >
                            </div>
                        </div>
                    </div>
                    <!--第四行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "email" class = "col-lg-4 col-sm-4   control-label ">邮箱:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input id = "email" type = "text" class = "form-control" >
                            </div>
                        </div>
                    </div>
                </div>
            <!--foot-->
            <div id = "foot">
                <div class = "row">
                    <div class = "form-group">
                        <div class = "col-sm-offset-5 col-sm-5" style = "margin-top:10px">
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
		$("#hiddenID").val("${pro.id}");
		
	})
	
		function update(){
		
		if($("#phone").val() == "" || $("#degree").val() == "" ||
		   $("#unit").val() == "" || $("#email").val() == ""){
			alert("输入不能为空");
		}else{
		
			$("#proficientPanelDiv").load("ProficientUpdateServlet.av",{"id":$("#hiddenID").val(),
			"phone":$("#phone").val(),"degree":$("#degree").val(),
			"unit":$("#unit").val(),"email":$("#email").val()});
		
		}



	}
</script>





</body>
</html>