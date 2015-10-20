<%--
  Created by IntelliJ IDEA.
  User: Code.Ai
  Date: 2015/10/10
  Time: 3:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<!DOCTYPE html>
<html lang = "en">
<head>
    <meta charset = "UTF-8">
    <title>添加新鼠害</title>
</head>

<body>
<div id = "mouseAddDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    添加新鼠害
                </h3>
            </div>
        </div>
        <!--内容-->
        <div style = "margin-left:50px;margin-top: 10px">
            <!--表单-->

                <!--左边-->
                <div id = "left" style = "width: 370px;height: 390px;float: left">
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "name" class = "col-lg-4 col-sm-4   control-label ">名称:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "name" name="name">
                            </div>
                        </div>
                    </div>
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "breed" class = "col-lg-4 col-sm-4   control-label ">繁殖：</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "breed" name="breed">
                            </div>
                        </div>
                    </div>
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 20px" >
                        <div class = "form-group" >
                            <div class = "col-lg-4 col-sm-4" style = "float: left;margin-left: 6px" >
                                <label for = "file" class = " control-label " >图片:</label >
                            </div >
                            <div class = "col-lg-4 col-sm-4" style = "float: left;margin-left: -50px" >
                                <input type = "file" name = "file" id = "file" class = "form-control" style = "display: none" >
                                <input id = "inputImg" type = "text" class = "form-control" style = "width: 150px" />
                            </div >
                            <div class = "col-lg-4 col-sm-4" style = "float: left;margin-left: 10px" >
                                <button class = "btn btn-default" onclick = "browseImg('#file','#inputImg');return false" >浏览</button >
                            </div >
                        </div >
                    </div >
                    <!--第四行-->
                    <div class = "row" style = "margin-top: 20px;margin-left:-45px;">
                        <div class = "form-group" style = "float: left">
                            <label for = "action" class = "col-lg-4 col-sm-4  control-label ">防治措施:</label>

                            <div class = "col-lg-8 col-sm-6">
                                <textarea rows = "5" cols = "30" class = "form-control" id = "action" name="action"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <!--右边-->
                <div id = "right" style = "width: 370px;height: 390px;float: left;margin-left: 10px">
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label  class = "col-lg-4 col-sm-4   control-label ">食物:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "food" name="food">
                            </div>
                        </div>
                    </div>
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 20px">
                        <div class = "form-group" style = "float: left">
                            <label for = "enemy" class = "col-lg-4 col-sm-4   control-label ">天敌:</label>

                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "enemy" name="enemy">
                            </div>
                        </div>
                    </div>
                    <br /><br />
                    <!--第四行-->
                    <div class = "row" style = "margin-top: 50px;margin-left:-45px;">
                        <div class = "form-group" style = "float: left">
                            <label for = "harm" class = "col-lg-4 col-sm-4  control-label ">主要危害:</label>

                            <div class = "col-lg-8 col-sm-6">
                                <textarea rows = "5" cols = "30" class = "form-control" id = "harm" name="harm"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <!--foot-->
                <div id = "foot">
                    <div class = "row">
                        <div class = "form-group">
                            <div class = "col-sm-offset-5 col-sm-5" style = "margin-top:10px">
                                <button type = "button" class = "btn btn-default" onclick="add()">添加</button>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </div>
</div>
<script type = "text/javascript">
function add() {
    var strMessage = "";
    var name = $("#name").val();
    var breed = $("#breed").val();
    var inputImg = $("#inputImg").val();
    var action = $("#action").val();
    var food = $("#food").val();
    var enemy = $("#enemy").val();
    var harm = $("#harm").val();
    if (name == null || name.trim() == "") {
        strMessage += "名称不能为空\n";
    }
    if (breed == null || breed.trim() == "") {
        strMessage += "繁殖不能为空\n";
    }
    if (inputImg == null || inputImg.trim() == "") {
        strMessage += "图片不能为空\n";
    }
    if (action == null || action.trim() == "") {
        strMessage += "防治措施不能为空\n";
    }
    if (food == null || food.trim() == "") {
        strMessage += "食物不能为空\n";
    }
    if (enemy == null || enemy.trim() == "") {
        strMessage += "天敌不能为空\n";
    }
    if (harm == null || harm.trim() == "") {
        strMessage += "主要危害不能为空\n";
    }
    if (strMessage.length != 0) {
        alert(strMessage);
        return false;
    } else {
        ajaxFileUpload();
    }

    function ajaxFileUpload() {
        // 开始上传文件时显示一个图片
        $("#wait_loading").ajaxStart(function () {
            $(this).show();
            // 文件上传完成将图片隐藏起来
        }).ajaxComplete(function () {
            $(this).hide();
        });
        $.ajaxFileUpload({
            url: "../mouseAdd.av",//向数据库中添加数据
            type: "POST",
            secureuri: false, //一般设置为false
            fileElementId: ['file'], // 上传文件的id、name属性名
            dataType: 'JSON', //返回值类型，一般设置为json、application/json
            data: {
                'name': encodeURI(name),
                'breed': encodeURI(breed),
                'inputImg': encodeURI(inputImg),
                'action': encodeURI(action),
                'food': encodeURI(food),
                'enemy': encodeURI(enemy),
                'harm': encodeURI(harm)
            },
            success: function (data) {
                initData('#mouseAddDiv', '../mousePanel.av', {'pageNow': 1, 'option': 'init'});
            }
        });
        return false;
    }
}

function browseImg(fileId, inputImg) {
        //调用文件选择组件的默认点击事件
        $(fileId).click();
        $(fileId).change(function () {
            //给input设置值
            $(inputImg).val($(fileId).val());
        });
    }
</script>
</body>
</html>