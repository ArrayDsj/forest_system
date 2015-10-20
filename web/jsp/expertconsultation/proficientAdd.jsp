<!DOCTYPE html>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<html>
<head>
    <meta charset = "UTF-8">
    <title>添加专家</title>
    <style type = "text/css">
        span {
            font-size: 16px;
        }
    </style>
</head>
<body>
<div id = "proficientAddDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    添加专家信息
                </h3>
            </div>
        </div>
        <!--内容-->
        <!--内容-->
        <div style = "margin-left:50px;margin-top: 10px">
            
                <!--left-->
                <div id = "left" style = "width: 370px;height: 390px;float: left">
                    <!--第一行 姓名-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "name" class = "col-lg-4 col-sm-4   control-label ">姓名:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input id = "name" type = "text" class = "form-control" >
                            </div>
                        </div>
                    </div>
                    <!--第二行 出生年月-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "birthday" class = "col-lg-4 col-sm-4   control-label ">出生年月:</label>
                           
                           
                            <div id = "datetimepickerStar" class = "input-group date form_date col-lg-8 col-sm-8" style="margin-left: -30px"  data-date = "" data-date-format =
                                "yyyy-mm-dd"
                             data-link-format = "yyyy-mm-dd" >
                            <input id="birthday" class = "form-control" size = "30" type = "text" value = ""  readonly = "readonly" onclick =
                                    "selectTime('datetimepickerStar')" >
                            <span  class = "input-group-addon" ><span class = "glyphicon glyphicon-remove" ></span ></span >
                            <span class = "input-group-addon" ><span class = "glyphicon glyphicon-calendar"
                                                                     onclick = "selectTime('datetimepickerStar')" ></span ></span >
                        </div >
                        
                        
                        </div>
                    </div>

                    <!--第三行 专长-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "specialty" class = "col-lg-4 col-sm-4   control-label ">专长:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input id = "specialty" type = "text" class = "form-control" >
                            </div>
                        </div>
                    </div>

                    <!--第四行 电话-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "phone" class = "col-lg-4 col-sm-4   control-label ">电话:</label>
                            <div class = "col-lg-8 col-sm-8">
                                <input id = "phone" type = "text" class = "form-control" >
                            </div>
                        </div>
                    </div>

                    <!--第五行 通讯地址-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "address" class = "col-lg-4 col-sm-4   control-label ">通讯地址:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input id = "address" type = "text" class = "form-control" >
                            </div>
                        </div>
                    </div>

                </div>
                <!--right-->
                <div id = "right" style = "width: 370px;height: 390px;float: left;margin-left: 10px">
                    <!--第一行 性别-->
                    <div class = "row" style = "margin-top: 25px;margin-left: 35px">
                        <div class = "form-group" >
                            <label >性别:</label>
                            <input type = "radio" name="genger" value="男" style = "margin-left: 25px" checked/>男
                            <input type = "radio" name = "genger" value = "女" style="margin-left: 20px"/>女
                        </div>
                    </div>
                    <!--第二行 照片-->

                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group">
                            <div class = "col-lg-4 col-sm-4" style = "float: left;margin-left: 35px">
                                <label  class = " control-label ">照片:</label>
                            </div>
                            
                            
                            <input id="eveTxt" type="text" style="width: 150px;height: 30px;margin-left: -60px" />
                     		<input id="file" name="file" type="file" onchange="$('#eveTxt').val($(this).val())" style="display:none;"/>
                   			<input type="button" class="btn btn-xs btn-success" style="width: 80px;height: 30px;margin-left: -4px;margin-top: -3px " onclick="$('#file').click()" value="图片" >
                        
                        
                        
                        </div>
                    </div>

                    <!--第三行 职务-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "degree" class = "col-lg-4 col-sm-4   control-label ">职务:</label>
                            <div class = "col-lg-8 col-sm-8">
                                <input id = "degree" type = "text" class = "form-control" >
                            </div>
                        </div>
                    </div>
                    <!--第四行 工作单位-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "unit" class = "col-lg-4 col-sm-4   control-label ">工作单位:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input id = "unit" type = "text" class = "form-control" >
                            </div>
                        </div>
                    </div>
                    <!--第五行 邮箱-->
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
                                <button id="addBtn" type = "button" class = "btn btn-default" >添加</button>
                            </div>
                        </div>
                    </div>
                </div>
           

        </div>

    </div>
</div>

<script type="text/javascript">
    //数据验证
  $(function(){
   		
   			$("#addBtn").click(function(){
    			ajaxFileUpload();
    		});
  function ajaxFileUpload(){
    				// 开始上传显示的图片
    				$("#wait_loading").ajaxStart(function(){
    					$(this).show();
    					//文件上传完将影藏
    				}).ajaxComplete(function(){
    					$(this).hide();
    				});
				$.ajaxFileUpload({
    						url:'ProficientAddServlet.av',
    						type:'post',
    						secureuri:false,//一般为false
    						fileElementId:['file'],//上传文件组件NAME
    						dataType:'text',//返回值类型，Json,application/json
    						data:{
    						    "name":encodeURI($("#name").val()),
    						    "birthday":encodeURI($("#birthday").val()),
    							"specialty":encodeURI($("#specialty").val()),
    							"phone":encodeURI($("#phone").val()),
    							"address":encodeURI($("#address").val()),
    							"gender":encodeURI($("input[name='genger']").filter(":checked").val()),
    							"degree":encodeURI($("#degree").val()),
    							"workUnit":encodeURI($("#unit").val()),
    							"email":encodeURI($("#email").val())},//传递json参数键值对到服务器
    						success:function(data,status){
    							$("#proficientPanelDiv").load("ProficientQueryServlet.av",{"pageNow":-1});
    							//return jump('#proficientPanelDiv','./ProficientQueryServlet.av','-1')
    						},
    						error:function(data,status,e){
    							alert("错误");
    						}
    					});
    				};	
   
    

});
    
</script>
</body>
</html>