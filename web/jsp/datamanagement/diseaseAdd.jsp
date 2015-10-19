<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/10
  Time: 3:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<!DOCTYPE html>
<html lang = "en">
<head>
    <meta charset = "UTF-8">
    <title>添加新病害</title>
</head>
<script type="text/javascript" src="js/uploadpreview.js"></script>
<body>
<div id = "diseaseAddDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    添加新病害
                </h3>
            </div>
        </div>
        <!--内容-->
        <div style = "margin-left:50px;margin-top: 10px">
            <form class = "form-horizontal" role = "form" action = "../DiseaseServlet.av" onsubmit = "return add()" method="post" enctype="multipart/form-data">
                <div id = "left" style = "width: 370px;height: 390px;float: left">
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "name" class = "col-lg-4 col-sm-4   control-label ">名称:</label>
                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "name" name="name" >
                            </div>
                        </div>
                    </div>
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px;margin-left:-45px;">
                        <div class = "form-group" style = "float: left">
                            <label for = "status" class = "col-lg-4 col-sm-4  control-label ">发病状态:</label>
                            <div class = "col-lg-8 col-sm-6">
                                <textarea rows = "5" cols = "30" class = "form-control" id = "status" name="status" ></textarea>
                            </div>
                        </div>
                    </div>
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group">
                            <div class = "col-lg-4 col-sm-4" style = "float: left;margin-left: 6px">
                                <label  class = " control-label ">图片:</label>
                            </div>
                            <div class = "col-lg-4 col-sm-4" style = "float: left;margin-left: -50px">
                               <img id="img1" src="" style="width:0px;height:0px">
							   <input id="showFile1" name="showFile1" type="file" onchange="preview('img1','showFile1')"/>
                            </div>
                        
                        </div>
                    </div>

                    <!--第四行-->
                    <div class = "row" style = "margin-top: 20px;margin-left:-25px;">
                        <div class = "form-group" style = "float: left">
                            <label for = "harm" class = "col-lg-4 col-sm-4 control-label ">主要危害:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "harm" name="harm">
                            </div>
                        </div>
                    </div>
                </div>

                <div id = "right" style = "width: 370px;height: 390px;float: left;margin-left: 10px">
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "pathogen" class = "col-lg-4 col-sm-4   control-label ">病原:</label>
                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "pathogen" name="pathogen" >
                            </div>
                        </div>
                    </div>
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px;margin-left:-45px;">
                        <div class = "form-group" style = "float: left">
                            <label for = "rules" class = "col-lg-4 col-sm-4  control-label ">发病规律:</label>

                            <div class = "col-lg-8 col-sm-6">
                                <textarea rows = "5" cols = "30" class = "form-control" id = "rules" name="rules" ></textarea>
                            </div>
                        </div>
                    </div>
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 20px;margin-left:-45px;">
                        <div class = "form-group" style = "float: left">
                            <label for = "action" class = "col-lg-4 col-sm-4  control-label ">防治措施:</label>

                            <div class = "col-lg-8 col-sm-6">
                                <textarea rows = "5" cols = "30" class = "form-control" id = "action" name="action" ></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <!--foot-->
                <div id = "foot">
                    <div class = "row">
                        <div class = "form-group">
                            <div class = "col-sm-offset-5 col-sm-5" style = "margin-top:10px">
                                <button type = "submit" class = "btn btn-default">添加</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">


        function browseSon(){
            //调用文件选择组件的默认点击事件
            $("#img").click();
            $("#img").change(function () {
                //给input设置值
                $("#inputImg").val($("#img").val());
            });
        }
    </script >
</body>
</html>