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
            <form class = "form-horizontal" role = "form" action = "javascript:jump(
            '#proficientAddDiv','html/proficientPanel.html')" onsubmit = "return add()">
                <!--left-->
                <div id = "left" style = "width: 370px;height: 390px;float: left">
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "name" class = "col-lg-4 col-sm-4   control-label ">名称:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "name">
                            </div>
                        </div>
                    </div>
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "birthday" class = "col-lg-4 col-sm-4   control-label ">生日:</label>
                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "birthday">
                            </div>
                        </div>
                    </div>

                    <!--第三行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "specialty" class = "col-lg-4 col-sm-4   control-label ">专长:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "specialty">
                            </div>
                        </div>
                    </div>

                    <!--第四行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "phone" class = "col-lg-4 col-sm-4   control-label ">电话:</label>
                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "phone">
                            </div>
                        </div>
                    </div>

                    <!--第五行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "address" class = "col-lg-4 col-sm-4   control-label ">地址:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "address">
                            </div>
                        </div>
                    </div>

                </div>
                <!--right-->
                <div id = "right" style = "width: 370px;height: 390px;float: left;margin-left: 10px">
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 25px;margin-left: 35px">
                        <div class = "form-group" >
                            <label >性别:</label>
                            <input type = "radio" name="genger" value="1" style = "margin-left: 25px" checked/>男
                            <input type = "radio" name = "genger" value = "0" style="margin-left: 20px"/>女
                        </div>
                    </div>
                    <!--第二行-->

                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group">
                            <div class = "col-lg-4 col-sm-4" style = "float: left;margin-left: 35px">
                                <label for = "img" class = " control-label ">图片:</label>
                            </div>
                            <div class = "col-lg-4 col-sm-4" style = "float: left;margin-left: -80px">
                                <input type = "file" class = "form-control" id = "img" style = "display: none">
                                <input id = "inputImg" type = "text" class = "form-control" style = "width: 150px" />
                            </div>
                            <div class = "col-lg-4 col-sm-4" style = "float: left;margin-left: 10px">
                                <button class = "btn btn-default" onclick = "browse();return false">浏览</button>
                            </div>
                        </div>
                    </div>

                    <!--第三行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "position" class = "col-lg-4 col-sm-4   control-label ">职务:</label>
                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "position">
                            </div>
                        </div>
                    </div>
                    <!--第四行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "unit" class = "col-lg-4 col-sm-4   control-label ">单位:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "unit">
                            </div>
                        </div>
                    </div>
                    <!--第五行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "email" class = "col-lg-4 col-sm-4   control-label ">邮箱:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "email">
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
    //数据验证
    function add() {
        alert("验证数据正确性");
        return true;
    }


    function browse() {
        //调用文件选择组件的默认点击事件
        $("#img").click();
        $("#img").change(function () {
            //给input设置值
            $("#inputImg").val($("#img").val());
        });
    }
</script>
</body>
</html>