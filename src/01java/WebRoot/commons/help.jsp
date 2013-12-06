<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>送每家 - 网上订单|日常生活用品|快速送货到家</title>
<meta name="Description" content="送每家为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" /><link rel="shortcut icon" href="favicon.ico" />
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/help.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="/user/top1.jsp" %>
<div class="Center-top"><img src="${ctx}/ad/ad_help_sugu.gif"/></div>
<div class="Center-Border">
    <div class="Center">
		<div id="DaoHangTiao">
    		<div class="Txt-daohangtiao">
        		<a class="Home" href="#" target="_blank"></a>
   			</div>
   			<div class="Jiantou-daohangtiao"></div>
		    <div class="Txt-daohangtiao">
		        <span class="gray-333">帮助中心</span>
			</div>
   			<div id="NavBar">
   				<div class="Jiantou-daohangtiao"></div>
   				<div class="Txt-daohangtiao"><span class="gray-333">首页</span></div>
   			</div>
		</div>
    	<div id="TB_window" onclick="javascript:tbRemove();"><img src="${ctx}/images/loading.gif" style="float:left;" /><div class="txt">数据加载中，请稍后...</div></div>
   		<div class="content">
       		<div id="menuNav" class="left">
				<div class="leftop"></div>
				<div class="leftBg">
			    <div id="menus" class="leftNav">
			        <ul>
			            <li id="m_0" class="m_0" parentto="0"><a href="javascript:void(0);">
			                <img src="${ctx}/images/space.gif" border="0" class="leftBs1" /><span>首页</span></a></li>
			            <li id="m_11000" class="m"><a href="javascript:void(0);">
			                <img src="${ctx}/images/space.gif" border="0" class="leftBs1" /><span>订购帮助</span></a></li>
			            
			            <li id="m_11015" parentto="11000" class="m_sub"><a href="javascript:void(0);">
			                <img src="${ctx}/images/space.gif" border="0" class="leftBs2" /><span>订购流程</span></a></li>
			            
			            <li id="m_11016" parentto="11000" class="m_sub"><a href="javascript:void(0);">
			                <img src="${ctx}/images/space.gif" border="0" class="leftBs2" /><span>关于订单状态</span></a></li>
			            
			            <li id="m_11017" parentto="11000" class="m_sub"><a href="javascript:void(0);">
			                <img src="${ctx}/images/space.gif" border="0" class="leftBs2" /><span>其它常见问题</span></a></li>
			           
			            <li id="m_10000" class="m"><a href="javascript:void(0);">
			
			                <img src="${ctx}/images/space.gif" border="0" class="leftBs1" /><span>账户管理</span></a></li>
			            
			            <li id="m_11014" parentto="10000" class="m_sub"><a href="javascript:void(0);">
			                <img src="${ctx}/images/space.gif" border="0" class="leftBs2" /><span>注册帐号</span></a></li>
			            
			            <li id="m_10002" parentto="10000" class="m_sub"><a href="javascript:void(0);">
			                <img src="${ctx}/images/space.gif" border="0" class="leftBs2" /><span>资料修改</span></a></li>
			            
			            <li id="m_11002" parentto="10000" class="m_sub"><a href="javascript:void(0);">
			                <img src="${ctx}/images/space.gif" border="0" class="leftBs2" /><span>找回密码</span></a></li>
			            <!-- 
			            <li id="m_11020" class="m"><a href="javascript:void(0);">
			                <img src="${ctx}/images/space.gif" border="0" class="leftBs1" /><span>在线支付帮助</span></a></li>
			             
			            <li id="m_11026" parentto="11020" class="m_sub"><a href="javascript:void(0);">
			
			                <img src="${ctx}/images/space.gif" border="0" class="leftBs2" /><span>简单介绍</span></a></li>
			            
			            <li id="m_11021" parentto="11020" class="m_sub"><a href="javascript:void(0);">
			                <img src="${ctx}/images/space.gif" border="0" class="leftBs2" /><span>在线充值流程</span></a></li>
			            
			            <li id="m_11022" parentto="11020" class="m_sub"><a href="javascript:void(0);">
			                <img src="${ctx}/images/space.gif" border="0" class="leftBs2" /><span>支付密码设置</span></a></li>
			            
			            <li id="m_11023" parentto="11020" class="m_sub"><a href="javascript:void(0);">
			                <img src="${ctx}/images/space.gif" border="0" class="leftBs2" /><span>退款帮助</span></a></li>
			
			            
			            <li id="m_11025" parentto="11020" class="m_sub"><a href="javascript:void(0);">
			                <img src="${ctx}/images/space.gif" border="0" class="leftBs2" /><span>提现帮助</span></a></li>
			            
			            <li id="m_11024" parentto="11020" class="m_sub"><a href="javascript:void(0);">
			                <img src="${ctx}/images/space.gif" border="0" class="leftBs2" /><span>在线支付常见问题</span></a></li>
			            -->
			        </ul>
			    </div>
			</div>
			<div class="leftBottom"></div>

			<div id="sites_ad_71_0" class="sites_ad" aid="71"></div>
		</div>
       	<div id="menuContent" class="right">
           	<div class="rightCon">
   				<div class="rightop">
    				<div class="rightopL">在送每家能做什么?</div>
				</div>
   				<div class="rightBg">送每家<p>(www.5smj.com)是由成都市腾龙信息技术有限公司自主研发运营的网络生活服务平台。现专注于面向网民提供专业、便捷的日常生活用品在线订购服务、外送优惠信息服务。目前平台覆盖成都市五城区,随时为城市中各区域的广大市民送货上门！</p><p>宋美佳凭借着领先的技术、创新的概念、规范的体系、优质的服务，默默改变着我们的生活，真正做到与生活轻松对话。</p></div>
   				<div class="rightBottom"></div>
			</div>
			<div class="rightCon" style="margin-top:15px">
    			<div class="rightop">
	   				<div class="rightopL">订购流程</div>
    			</div>
   			<div class="rightBg"><p><img src="../data/html/images/dclc.gif" width="677" height="111" /></p></div>
    		<div class="rightBottom"></div>
		</div>
		<div class="rightCon" style="margin-top:15px">
    		<div class="rightop">
			    <div class="rightopL">常见问题</div>
			    <div class="rightopR"><a  id="m11017" href="javascript:void(0);" class="hui">更多</a></div>
		    </div>
		<div class="rightBg">
		    <table width="680" border="0" cellpadding="0" cellspacing="0" background="${ctx}/data/html/images/cjwt.gif" style="margin-bottom:15px">
		      <tr>
			    <td height="35" class="td1"><a id="m11015" href="javascript:void(0);">如何在线订购商品?</a></td>
		      </tr>
		      <tr>
			    <td height="35" class="td1"><a id="m11016" href="javascript:void(0);">如何了解订单状态？ </a></td>
		      </tr>
	      </table>
		</div>
    	<div class="rightBottom"></div>
	</div>
    <div id="sites_ad_70_0" class="sites_ad" aid="70"></div>
</div>
<div class="Center-bottom"></div>
<%@include file="/commons/footer.jsp" %>

<script type="text/javascript" src="${ctx}/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#GoTop").scrollTop({ imgPath: "${ctx}/images/huidingbu.gif", setDistancesType: "down", topDistance: 280 });
	});
	$(function(){$("#m11015").click(function(){$.post("${ctx}/systemAction.do?method=helpAjax&filename=11015",null,function(data){$("#menuContent").html(data);});});});
    $(function(){$("#m11016").click(function(){$.post("${ctx}/systemAction.do?method=helpAjax&filename=11016",null,function(data){$("#menuContent").html(data);});});});
    $(function(){$("#m11017").click(function(){$.post("${ctx}/systemAction.do?method=helpAjax&filename=11017",null,function(data){$("#menuContent").html(data);});});});
    $(function(){$("#m11018").click(function(){$.post("${ctx}/systemAction.do?method=helpAjax&filename=11017",null,function(data){$("#menuContent").html(data);});});});
    $(function(){
        $(".m_sub", "#menus").hide();
        $(".m", "#menus").click(function() {
            var menuId = $(this).attr("id").substring(2);
            $("img", this).toggleClass("leftBs1").toggleClass("leftBs");
            var className = $.trim($("img", this).attr("class"));
            if(className=="leftBs")
                $("li[parentTo=" + menuId+"]").show();
            else
                $("li[parentTo=" + menuId+"]").hide();
        });
        $(".m_sub,.m_0", "#menus").click(function() {
            tbView();//模态框开启
            var currentId = $(this).attr("id");
            NavigationBar(currentId);//导航条操作
            $(".hover", "#menus").each(function() {
                if ($(this).attr("id") != currentId) {
                    $(this).removeClass("hover");
                    $(this).wrapInner("<a href=\"javascript:void(0);\"></a>");
                }
            });

            if (!$(this).hasClass("hover")) {
                $(this).addClass("hover");
                //$("img", this).unwrap();
                var menuId = currentId.substring(2);
                if(menuId == 0){
                }
                $.post(
                   "${ctx}/systemAction.do?method=helpAjax&filename=" + menuId,
                     null, 
                     function(data) {		 	
                        $("#menuContent").html(data);
                        //alert(data);
                });
            }
            tbRemove();//模态框关闭
        });
        var id = 0;
        if(id > 0){
            var currentMenuId = "m_" + id;
            if($("#"+currentMenuId).attr("parentTo")>0)
                $("#m_"+ $("#"+currentMenuId).attr("parentTo")).trigger("click");
            $("#"+currentMenuId).trigger("click");
        }
    });
    //模态框显示
    function tbView()
    {
        $("#TB_window").css("display","block");
    }
    //模态框关闭
    function tbRemove()
    {
        $("#TB_window").css("display","none");
    }
    //导航条操作
    function NavigationBar(currentId)
    {
        var nav = "";
        var parentId = $("#"+currentId).attr("parentto");
        if(parentId>0)
        {
            nav +="<div class=\"Jiantou-daohangtiao\"></div>"+
                        "<div class=\"Txt-daohangtiao\"><span class=\"gray-333\">"+
                        $("#m_"+parentId +" span").html()+
                        "</span></div>";
        }
        
        nav +="<div class=\"Jiantou-daohangtiao\"></div>"+
                    "<div class=\"Txt-daohangtiao\"><span class=\"gray-333\">"+
                    $("#"+currentId +" span").html()+
                    "</span></div>";
        
        $("#NavBar").html(nav);
    }
</script>
</body>
</html>