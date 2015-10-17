/**
 * 手风琴处理函数
 */
$(function () {
    var Accordion = function (el, multiple) {
        this.el = el || {};
        this.multiple = multiple || false;
        // Variables privadas
        var links = this.el.find('.link');
        // Evento
        links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown)
    };
    Accordion.prototype.dropdown = function (e) {
        var $el = e.data.el;
        $this = $(this);
        $next = $this.next();
        $next.slideToggle();
        $this.parent().toggleClass('open');
        //当点击其他li时缩回其他的li
        if (!e.data.multiple) {
            $el.find('.submenu').not($next).slideUp().parent().removeClass('open');
        }
    };
    var accordion = new Accordion($('#accordion'), false);
});


/*********************************************************************/
/**
 * 所有网页的跳转方法
 * @param id
 * @param url
 * @returns {boolean}
 */
function jump(id, url, now,option) {
    //跳转到指定jsp,然后这个jsp在加载的时候初始化自身数据
    $(id).load(url,{'pageNow':now,'option': option});
    //去掉a标签的默认动作
    return false;
}

/*********************************************************************/
/**
 * 组合下拉列表框组件的处理函数
 */
//保存下拉列表的值,默认是button中的name
var query = 'f_name';
//取得按钮控件中的第一个子节点的text文本值
function querySelect(obj, id) {
    query = document.getElementById(id).name;
    //下拉列表被选中的选项
    var checked = obj.text + "&" + obj.name;
    //原来的文本
    var str = document.getElementById(id).childNodes[0].nodeValue;
    //交换
    var arr = checked.split("&");
    document.getElementById(id).innerHTML = arr[0] + "<span>&nbsp;</span><span class = 'caret' ></span > ";
    document.getElementById(id).name = arr[1];
    obj.text = str;
    obj.name = query;
    query = arr[1];
    return false;
}

<!--查询按钮-->
function submitQuery(id1,id2,url,now) {
    //得到条件
    var str = $(id1).val();
    //得到模糊查询值
    str = "'%" + str + "%'";
    alert('?query=' + query + '&str=' + str);
    $(id2).load(url, {'pageNow': now,'query':query,'str':str});
}
/*********************************************************************/


/**
 * 时间控件
 */
function selectTime(id) {
    $('#' + id).datetimepicker({
        language: 'zh-CN',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        pickerPosition: "top-left"
    });
}


/*********************************************************************/

//表格点击事件
function select(obj,id,stageid) {
    //设置隐藏域val
    $(id).val(obj.firstElementChild.value);
    $(stageid).val(obj.lastElementChild.getAttribute("stageID"));
    //设置样式
    obj.style.backgroundColor = "red";
    $("tr").css("background-color","white");
    obj.style.backgroundColor = "red";

}

/*********************************************************************/
//取得按钮控件中的第一个子节点的text文本值
function getSelect(obj, id, id1) {
    //下拉列表被选中的选项
    var checked = obj.text;
    //原来的文本
    var str = document.getElementById(id).childNodes[0].nodeValue;
    //交换
    document.getElementById(id).innerHTML = checked + "<span>&nbsp;</span><span class = 'caret' ></span > ";
    obj.text = str;
    $("#" + id1).val(checked);
    return false;
}


/*********************************************************************/
/**
 * 不带输入框的下拉列表
 * @param liObj
 * @param btnId
 * @param hidden
 * @returns {boolean}
 */
function selectOption(liObj, btnId, hidden) {
    //下拉列表被选中的选项
    var liText = liObj.text;
    //得到选中的下拉列表中的value
    var liValue = liObj.getAttribute("value");
    //原来的文本
    var btnText = $(btnId).text();
    //原来的value
    var btnValue = $(btnId).val();
    //交换
    $(btnId).text(liText);
    $(btnId).val(liValue);
    liObj.text = btnText;
    liObj.setAttribute("value", btnValue);
    $(hidden).val($(btnId).val());
    return false;
}

/*********************************************************************/
/**
 * 图片选择控件
 * @param img
 * @param inputImg
 */
function browse(img, inputImg) {
    //调用文件选择组件的默认点击事件
    $(img).click();
    $(img).change(function () {
        //给input设置值
        $(inputImg).val($(img).val());
    });
}

/*********************************************************************/
/**
 * 非空验证
 * @param data
 * @returns {*}
 */
function isNull(data) {
    return (data == "" || data == undefined || data == "null") ? "暂无" : data;
}


/*********************************************************************/
/**
 * 表格上鼠标移动行变色
 */
$('#table1 tr').hover(function () {
    $(this).children('td').addClass('hover')
}, function () {
    $(this).children('td').removeClass('hover')
});

/***********************************************************************/
/**
 * 偶数奇数行不同颜色
 */

$('#table1 tbody tr:odd').css('background-color', '#bbf');
$('#table1 tbody tr:even').css('background-color', '#ffc');
//操作class
$("#table1 tbody tr:odd").addClass("odd");
$("#table1 tbody tr:even").addClass("even");


$(document).ready(function () {
    //鼠标移动到行变色,单独建立css类hover
    //tr:gt(0):表示获取大于 tr index 为0 的所有tr，即不包括表头
    $(".table tr:gt(0)").hover(
        function () {
            $(this).addClass("hover")
        },
        function () {
            $(this).removeClass("hover")
        })
});