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
function jump(id, url, now) {
    //跳转到指定jsp,然后这个jsp在加载的时候初始化自身数据
    $(id).load(url,{'pageNow':now});
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
    var str = $(id1).val();
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



