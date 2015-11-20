
getElement = function(name) {
    return document.getElementById(name);
}

// jquery 方法
/*
$(document).ready(function() {
    //暂时隐藏登录窗口
    $("#login-in").hide();
});
*/

// 固定浏览器大小
//window.resizeTo(800,600);

window.onload = function() {
     //隐藏部分窗口
    //getElement("index-custom-banner").style.display = 'none'
    getElement("login-in").style.display = 'none';
    //getElement("hot-info").style.display = 'none';

    //获取页面可见高度
    var h = document.documentElement.clientHeight;
    //test
    var style = getElement("login-in").style;
    //style.height = h-10+"px";

    // 初始化布局页面各个元素的大小及位置

}

window.onresize = function() {
    pos = getRelPos(getElement("login-in"));
    console.log(">>>>>>>>>>>current login-in window postion:", pos.left, pos.top);

    if (document.body.width <= 700) {
        return;
    }
}

window.onscroll = function() {
}

//获取元素的绝对位置
getAbsPos = function(ele) {
    var x = ele.offsetLeft;
    var y = ele.offsetTop;
    while (ele = ele.offsetParent) {
        x += ele.offsetLeft;
        y += ele.offsetTop;
    }
    console.log("absolute postion:", x, y);
    return {left:x,top:y};
    //return [x,y];
}
getRelPos = function(ele) {
    var scrollLeft = document.body.scrollLeft;
    var scrollTop = document.body.scrollTop;
    pos = getAbsPos(ele);
    pos.left -= scrollLeft;
    pos.top -= scrollTop;
    return pos;
}
adjustWindow = function() {
    
}
