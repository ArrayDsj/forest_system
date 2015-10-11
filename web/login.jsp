<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/2
  Time: 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language ="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/" ;
%>
<html lang = "en" >
<head >

    <base href = "<%=basePath %>" >

    <meta charset = "UTF-8" >
    <!--响应式布局-->
    <meta name = "viewport" content = "width=device-width, initial-scale=1" >
    <link rel = "stylesheet" href = "bootstrap/css/bootstrap.min.css" >
    <link rel = "stylesheet" href = "css/login.css" />
    <title >登录</title >

    <style type = "text/css" >
        #header {
            text-align: center;
        }

        #imgDiv {
            margin-top: 20px;
            text-align: center;
        }

        #formDiv {
            margin-top: 20px;
            text-align: center;
        }
    </style >

</head >
<body >
    <div id = "container" >
        <div id = "body" style = "width: 500px;height: 500px ;border: solid;margin:20px auto;background-color: #CCCCCC" >
            <div id = "header" >
                <h1 >森林病虫害防治系统</h1 >
            </div >
            <div id = "imgDiv" >
                <img src = "image/1.jpg" alt = "" />
            </div >
            <div id = "formDiv" >
                <div class = "row" >
                    <form class = "form-horizontal" role = "form" action = "./login.av" method="POST" onsubmit = "return login()" >
                        <div class = "form-group" >
                            <label for = "username" class = "col-sm-4 col-lg-4 control-label" >用户名:</label >
                            <!--根据屏幕大小不同占据不同的栅栏个数-->
                            <div class = "col-sm-5 col-lg-5" >
                                <input name="username" type = "text" class = "form-control" id = "username" placeholder = "请输入用户名" >
                            </div >
                            <label id = "nameInfo" name = "nameInfo" style="margin-left: -50px;margin-top: 5px;color: red" ></label >
                        </div >
                        <div class = "form-group" >
                            <label for = "password" class = "col-sm-4 col-lg-4  control-label" >密&nbsp;&nbsp;码:</label >

                            <div class = "col-sm-5 col-lg-5" >
                                <input name="password" type = "password" class = "form-control" id = "password" placeholder = "请输入密码" >
                            </div >
                            <label id = "passwordInfo" name = "passwordInfo" style = "margin-left: -50px;margin-top: 5px;color: red"></label >
                        </div >
                        <div class = "form-group" style = "margin-left: 130px" >
                            <!--将sm向右移动5个格数-->
                            <div class = "col-sm-5 col-lg-5 " >
                                <button type = "submit" class = "btn btn-default" >登录</button >
                            </div >
                            <div class = "col-sm-2 col-lg-0" style = "float: left" >
                                <button type = "reset" class = "btn btn-default" >取消</button >
                            </div >

                        </div >
                        <div>
                            <%
                                String info = (String)request.getAttribute("info");
                                if(info != null){
                            %>
                            <label id="info" name="info" style="color: red"><%=info %></label >
                            <%
                                }
                            %>
                        </div>
                    </form >
                </div >
            </div >
        </div >
    </div >

    <script src = "js/jquery-1.11.3.min.js" ></script >
    <script src = "bootstrap/js/bootstrap.min.js" ></script >
    <script >
        function login() {
            var name = $("#username").val();
            var password = $("#password").val();

            //本地验证
            var strMessage = "";
            if (name == null || name.trim() == "") {
                $("#nameInfo").text("用户名不能为空");
                strMessage += "用户名不能为空";
            }
            if (password == null || password.trim() == "") {
                $("#passwordInfo").text("密码不能为空");
                strMessage += "密码不能为空";
            }
            if (strMessage.length != 0) {
                return false;
            }
        }
    </script >
</body >
</html >
