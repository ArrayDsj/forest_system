<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "com.code.bean.ThingBean" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "com.code.bean.ConferBean" %>
<%@ page contentType = "text/html;charset=UTF-8" pageEncoding = "UTF-8" language = "java" %>
<%
    //被选中的事件的信息
    ThingBean thingBean = (ThingBean) request.getAttribute("thingBean");
    ArrayList<ConferBean> allConfers = (ArrayList<ConferBean>)request.getAttribute("allConfers");
%>
<html>
<head>
    <meta charset = "UTF-8">
    <title>会商灾情</title>
</head>
<body>
<div id = "conferAddDiv">
    <div class = "container-fluid">
        <!--标题-->
        <div class = "row-fluid">
            <div class = "span12">
                <h3 class = "text-center">
                    专家会商
                </h3>
            </div>
        </div>
        <!--内容-->
        <div style = "margin-left:50px;margin-top: 10px">
            <!--表单-->
            <%--<form class = "form-horizontal" role = "form" action = "javascript:void(0)" >--%>
                <!--左边-->
                <div id = "left" style = "width: 370px;height: 290px;float: left">
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 5px">
                        <span class = "col-lg-4  control-label ">事件名称:</span>
                        <span class = "col-lg-4  control-label "><%=thingBean.getName()%></span>
                    </div>
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 5px">
                        <span class = "col-lg-4  control-label ">时间:</span>
                        <span class = "col-lg-4  control-label "><%=thingBean.getFoundDay()%></span>
                    </div>
                    <!--第三行-->
                    <div class = "row" style = "margin-top:5px">
                        <span class = "col-lg-4  control-label ">发生位置:</span>
                        <span class = "col-lg-4  control-label "><%=thingBean.getAreaBean().getName()%></span>
                    </div >
                    <!--第四行-->
                    <div class = "row" style = "margin-top: 5px">
                        <span class = "col-lg-4  control-label ">灾情描述:</span>
                        <span class = "col-lg-6 col-sm-10 control-label "><%=thingBean.getDescription()%></span>
                    </div>
                    <!--第五行-->
                    <div class = "row" style = "margin-top: 10px;margin-left:-45px;">
                        <div class = "form-group" style = "float: left">
                            <label for = "result" class = "col-lg-4 col-sm-4  control-label ">会商结果:</label>
                            <div class = "col-lg-8 col-sm-6">
                                <textarea rows = "3" cols = "30" class = "form-control" id = "result" placeholder="<%=thingBean.getResult()%>" ></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <!--右边-->
                <div id = "right" style = "width: 370px;height: 290px;float: left;margin-left: 10px">
                    <!--第一行-->
                    <div class = "row" style = "margin-top: 5px">
                        <span class = "col-lg-4  control-label ">幼虫图片:</span>
                        <img src = "../../image/yworm.jpg" />
                    </div>
                    <!--第二行-->
                    <div class = "row" style = "margin-top: 5px">
                        <span class = "col-lg-4  control-label ">影响面积:</span>
                        <span class = "col-lg-4  control-label "><%=thingBean.getProportion()%></span>
                    </div>
                    <!--第三行-->
                    <div class = "row" style = "margin-top: 5px">
                        <div class = "form-group" style = "float: left">
                            <label for = "staff" class = "col-lg-4 col-sm-4   control-label ">会商人员:</label>
                            <div class = "col-lg-8 col-sm-8">
                                <input type = "text" class = "form-control" id = "staff" value=""
                                       placeholder="<%=allConfers.get(0).getResult()%>">
                            </div>
                        </div>
                    </div>
                    <!--第四行-->
                    <div class = "row">
                        <div class = "form-group " style="margin-left: 100px">
                            <button type = "button" id="addConfer" class = "btn btn-default">添加会商信息</button>
                            <button type = "button" id="back" class = "btn btn-default" >返回</button>
                        </div>
                    </div>
                </div>
            <%--</form>--%>
        </div>
        <!--foot-->
        <div id = "foot" style = "width: 750px;height: 150px;margin-top: 313px;margin-left: 50px">
            <!--表格-->
            <div class = "row-fluid table-responsive" style = "border: solid" >
            <table class = "table table-hover active table-striped table-bordered" >
                    <tr>
                        <th class = "col-lg-4 col-sm-4">日期</th>
                        <th class = "col-lg-4 col-sm-4">会商人员</th>
                        <th class = "col-lg-4 col-sm-4">会商结果</th>
                    </tr>
                </table>
                <div id = "tableTD" class = "row-fluid" style = "overflow-y: auto;height: 88px;margin-top: -20px" >
                    <table id="conferInfo" class = "table table-striped table-bordered table-hover table-condensed hover">
                        <c:if test = "${requestScope.info == 'have'}" >
                            <c:forEach items = "${requestScope.allConfers}" var = "confer" >
                                <tr onclick = "select(this,'#selectID','#stageID')" >
                                    <td class = "col-md-2" >${confer.data}</td >
                                    <td class = "col-md-2" >${confer.staff}</td >
                                    <td class = "col-md-2" >${confer.result}</td >
                                </tr >
                            </c:forEach >
                        </c:if >
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


<script >
    $(function () {
        //返回事件
        $("#back").click(function () {
            initData('#conferAddDiv', '../conferPanel.av', {'pageNow': 1, 'option': 'inti'});
        });

        //添加事件
        $("#addConfer").click(function () {
            var staff = $("#staff").val();
            var result = $("#result").val();
            if((staff == null || staff.trim() == "") || (result == null || result.trim() == "") ){
                alert("请输入完整信息");
            }else{
                //1. 向数据库写入信息
                $.ajax({
                    type: "POST",
                    url: "../conferAdd.av",
                    data: {
                        'thingID':<%=thingBean.getId()%>,//当前被选中的事件id
                        'staff': staff,
                        'result': result
                    },
                    dataType: "text",
                    success: function (data) {
                        //向表格写入数据
                        var jsonObj = eval("(" + data + ")");
                        if(jsonObj.msg == 'success'){
                            alert(jsonObj.msg);
                            //如果数据库添加成功
                            //2. 添加表格数据
                            var rowTemplate =
                                    '<tr style=\'background-color: lawngreen\'>' +
                                    '<td class="col-md-2">' + jsonObj.addTime + '</td>' +
                                    '<td class="col-md-2">' + staff + '</td>' +
                                    '<td class="col-md-2">' + result + '</td>' +
                                    '</tr>';

                            var tableHtml = $("#conferInfo tbody").html();
                            tableHtml = rowTemplate + tableHtml;
                            $("#conferInfo tbody").html(tableHtml);
                        }
                    }
                });
            }
        });
    });


















</script >

</body>
</html>