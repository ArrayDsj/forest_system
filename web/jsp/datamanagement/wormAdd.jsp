 <%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/10
  Time: 3:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<!DOCTYPE html>
<html lang = "en" >
<head >
    <meta charset = "UTF-8" >
    <title >添加新害虫</title >
</head >

<body >

    <div id = "wormAddDiv" >
        <div class = "container-fluid" >
            <!--标题-->
            <div class = "row-fluid" >
                <div class = "span12" >
                    <h3 class = "text-center" >
                        添加虫害
                    </h3 >
                </div >
            </div >
            <!--内容-->
            <div style = "margin-left:50px;margin-top: 10px" >
                <!--表单-->
                <form class = "form-horizontal" role = "form" action = "pest.av" onsubmit
                        = "return add()" method="post" enctype="multipart/form-data">
                    <!--左边-->
                    <div id = "left" style = "width: 370px;height: 390px;float: left" >
                        <!--第一行-->
                        <div class = "row" style = "margin-top: 20px" >
                            <div class = "form-group" style = "float: left" >
                                <label for = "name" class = "col-lg-4 col-sm-4   control-label " >名称:</label >
                                <div class = "col-lg-8 col-sm-8" >
                                    <input type = "text" class = "form-control" id = "name" name ="name" >
                                </div >
                            </div >
                        </div >
                        <!--第二行-->
                        <div class = "row" style = "margin-top: 20px" >
                            <div class = "form-group" style = "float: left" >
                                <label for = "breed" class = "col-lg-4 col-sm-4   control-label " >繁殖:</label >
                                <div class = "col-lg-8 col-sm-8" >
                                    <input type = "text" class = "form-control" id = "breed" name ="breed" >
                                </div >
                            </div >
                        </div >
                        <!--第三行-->
                        <div class = "row" style = "margin-top: 20px" >
                            <div class = "form-group" >
                                <div class = "col-lg-4 col-sm-4" style = "float: left;margin-left: 6px" >
                                    <label  class = " control-label " >幼虫图片:</label >
                                </div >
                                <div class = "col-lg-4 col-sm-4" style = "float: left;margin-left: -50px" >
                                <!-- 
                                    <input type = "file" class = "form-control" id = "sonImg"  >
                                    <input name = "inputSonImg" id = "inputSonImg" type = "text" class = "form-control" style = "width: 150px" />
                                 -->
	                                <img id="img1" src="" style="width:0px;height:0px">
									<input style="width: 200px;" id="showFile1" name="showFile1" type="file" onchange="preview('img1','showFile1')"/>
                                </div >
                               <!--  <div class = "col-lg-4 col-sm-4" style = "float: left;margin-left: 10px" >
                                    <button class = "btn btn-default" onclick = "browseSon();return false" >浏览</button >
                                </div >
                                 -->
                            </div >
                        </div >
                        <!--第四行-->
                        <div class = "row" style = "margin-top: 20px;margin-left:-45px;" >
                            <div class = "form-group" style = "float: left" >
                                <label for = "action" class = "col-lg-4 col-sm-4  control-label " >防治措施:</label >

                                <div class = "col-lg-8 col-sm-6" >
                                    <textarea rows = "5" cols = "30" class = "form-control" id = "action" name = "action"></textarea >
                                </div >
                            </div >
                        </div >
                    </div >
                    <!--右边-->
                    <div id = "right" style = "width: 370px;height: 390px;float: left;margin-left: 10px" >
                        <!--第一行-->
                        <div class = "row" style = "margin-top: 20px" >
                            <div class = "form-group" style = "float: left" >
                                <label for = "host" class = "col-lg-4 col-sm-4   control-label " >寄主:</label >

                                <div class = "col-lg-8 col-sm-8" >
                                    <input type = "text" class = "form-control" id = "host" name = "host" >
                                </div >
                            </div >
                        </div >
                        <!--第二行-->
                        <div class = "row" style = "margin-top: 20px" >
                            <div class = "form-group" style = "float: left" >
                                <label for = "enemy" class = "col-lg-4 col-sm-4   control-label " >天敌:</label >

                                <div class = "col-lg-8 col-sm-8" >
                                    <input type = "text" class = "form-control" id = "enemy"  name = "enemy">
                                </div >
                            </div >
                        </div >
                        <!--第三行-->
                        <div class = "row" style = "margin-top: 20px" >
                            <div class = "form-group" >
                                <div class = "col-lg-4 col-sm-4" style = "float: left;margin-left: 6px" >
                                    <label  class = " control-label " >成虫图片:</label >
                                </div >
                                <div class = "col-lg-4 col-sm-4" style = "float: left;margin-left: -50px" >
                                <!-- 
                                    <input type = "file" class = "form-control" id = "bigImg" style = "display: none" >
                                    <input name = "inputBigImg" id = "inputBigImg" type = "text" class = "form-control" style = "width: 150px" />
                                 -->  
                                    <img id="img2" src="" style="width:0px;height:0px;" >
									<input id="showFile2" name="showFile2" type="file" onchange="preview('img2','showFile2')"/>
			
			
                                </div >
                             <!-- 
                                <div class = "col-lg-4 col-sm-4" style = "float: left;margin-left: 10px" >
                                    <button class = "btn btn-default" onclick = "browseBig();return false" >浏览</button >
                                </div >
                             -->
                            </div >
                        </div >
                        <!--第四行-->
                        <div class = "row" style = "margin-top: 20px;margin-left:-45px;" >
                            <div class = "form-group" style = "float: left" >
                                <label for = "harm" class = "col-lg-4 col-sm-4  control-label " >主要危害:</label >
                                <div class = "col-lg-8 col-sm-6" >
                                    <textarea rows = "5" cols = "30" class = "form-control" id = "harm" name = "harm"></textarea >
                                </div >
                            </div >
                        </div >

                    </div >
                    <!--foot-->
                    <div id = "foot" >
                        <div class = "row" >
                            <div class = "form-group" >
                                <div class = "col-sm-offset-5 col-sm-5" style = "margin-top:10px" >
                                    <button type = "submit" class = "btn btn-default" >添加</button >
                                </div >
                            </div >
                        </div >
                    </div >
                </form >
            </div >
        </div >
    </div >

    <script >
        //数据验证
        function add() {
            alert("验证数据正确性");
            
            return true;
        }


        function browseSon() {
            //调用文件选择组件的默认点击事件
            $("#sonImg").click();
            $("#sonImg").change(function () {
                //给input设置值
                $("#inputSonImg").val($("#sonImg").val());
            });
        }
        function browseBig() {
            //调用文件选择组件的默认点击事件
            $("#bigImg").click();
            $("#bigImg").change(function () {
                //给input设置值
                $("#inputBigImg").val($("#bigImg").val());
            });
        }


    </script >
</body >
</html >
