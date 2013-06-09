// JavaScript Document by wg
$(function () {
    $.fn.tabs = function (options) {
        var settings = {
            tabList: "",
            tabContent: "",
			tabOn:"",
            action: ""
        };
        var _this = $(this);
        if (options) $.extend(settings, options);
        _this.find(settings.tabContent).eq(0).show(); //��һ��Ŀ��ʾ
        _this.find(settings.tabList).eq(0).addClass("on");
        if (settings.action == "mouseover") {
            _this.find(settings.tabList).each(function (i) {
                $(this).mouseover(function () {
                    $(this).addClass(settings.tabOn).siblings().removeClass(settings.tabOn);
                    var _tCon = _this.find(settings.tabContent).eq(i);
                    _tCon.show().siblings().hide();
                }); //�����л�						  
            });
        }else if (settings.action == "click") {
            _this.find(settings.tabList).each(function (i) {
                $(this).click(function () {
                    $(this).addClass(settings.tabOn).siblings().removeClass(settings.tabOn);
                    var _tCon = _this.find(settings.tabContent).eq(i);
                    _tCon.show().siblings().hide();
                }); //����л�
            });
        };
    };
	//���÷�ʽ��
    $(".tab_wrap1").tabs({
        tabList: ".tab_nav li",  //tab list
        tabContent: ".tab_content1 .tcon", //����box
		tabOn:"on", //��ǰtab����
        action: "mouseover" //�¼���mouseover����click  
    });
	//���÷�ʽ��
    $(".tab_wrap2").tabs({
        tabList: ".tab_nav li",  //tab list
        tabContent: ".tab_content2 .tcon", //����box
		tabOn:"on", //��ǰtab����
        action: "mouseover" //�¼���mouseover����click  
    });
});
/*��ҳ���Ч��*/
$(function(){
	var len  = $(".num > li").length;
	var index = 0;
	var adTimer;
	$(".num li").mouseover(function(){
		index  =   $(".num li").index(this);
		showADImg(index);
	}).eq(0).mouseover();
	$('.flash_box').hover(function(){
		clearInterval(adTimer);
	},function(){
		adTimer = setInterval(function(){
			showADImg(index)
			index++;
			if(index==len){index=0;}
		} , 3000);
	}).trigger("mouseleave");
})
function showADImg(index){
	var adHeight = $(".flash_box").height();
	$(".slider").stop(true,false).animate({bottom : -adHeight*index},1000);
	$(".num li").removeClass("on").eq(index).addClass("on");
}