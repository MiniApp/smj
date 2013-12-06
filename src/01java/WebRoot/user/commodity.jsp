<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>送每家 - 网上订单|日常生活用品|快速送货到家</title>
	<meta name="Description" content="送每家为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
	<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" />
	<link rel="shortcut icon" href="favicon.ico"/> 
		<link href="css/global.css" rel="stylesheet" type="text/css" />
		<link href="css/main.css" rel="stylesheet" type="text/css" /> 
		<link rel="stylesheet" href="public/plugin/listUI/listUI.css" type="text/css"></link>
		<style>
			.list img{ border:1px solid #d5d5d5; margin-right:5px;}
			.list img.on{border:1px solid #ff6600;}
			.izImage2{border:0;width:350px; height:350px; }
			.izViewer2{width:400px;height:400px;position:absolute;left:420px;top:20px;display:none; border:1px solid #e4e4e4;}
			.handle2{display:none;opacity:0.7;filter:alpha(opacity=70);background:#8b7b33; cursor:crosshair; border:1px solid #d5d5d5; position:absolute;}
            
            *{margin:0;padding:0;list-style-type:none;}
			a,img{border:0;}
			a{text-decoration:none;}
			
			.img_area{width:500px;height:1380px;}
			.img_area1{width:500px;height:500px;}
			.tab_area{width:500px;height:25px;overflow:hidden;}
			.tab_area ul li{width:128px;height:25px;text-align:center;line-height:25px;float:left;margin-left:-1px;color:#FFFFFF;border-left-width:1px;border-left-style:solid;border-left-color:#B1C8D7;}
			.tab_area ul li a{color:#1E50A2;}
			.tab_area ul li.current{width:130px;}
			.tab_area ul li.current a{color:#1E50A2;font-weight:600}
			#tab1_2, #tab1_4, #tab1_6, #tab1_8{margin-left:0;}


</style>
</head>
<body>
<%@include file="/user/top.jsp" %>
<div class="contentmain">
<div class="main_con1">
<div class="commd_left">
<div class="container"> <img id="idImage2" class="izImage2" />
	<div id="idViewer2" class="izViewer2"></div>
</div>
<div id="idList" class="list"> </div>
<div id="idHandle3" class="handle2"></div></div>
<div class="commd_left_r">
<table>
<c:forEach var="comm" items="${commodity}">
<tr>
<td>&nbsp;<p class="name">${comm.commdName}</p>
<input type="hidden" id="commdId" value="${comm.id.commdId}" />

<input type="hidden" id="commimage" value="<c:forEach var="img" items="${commimage}">${img.smallImg}|${img.medImg}|${img.largeImg}_</c:forEach>"/>

</td>
</tr>
<tr>
<td>&nbsp;市场价:&nbsp;&nbsp;&nbsp;<input type="text" class="price" value="￥${comm.agoraPrice}" readonly="readonly"/></td>
</tr>
<tr>
<td>&nbsp;销售价:&nbsp;&nbsp;&nbsp;<input type="text" class="price" value="￥${comm.salePrice}" readonly="readonly"/></td>
</tr>
<tr>
<td>&nbsp;会员价:&nbsp;&nbsp;&nbsp;<input type="text" class="price" value="￥${comm.userPrice}" readonly="readonly"/></td>
</tr>
<tr>
<td>&nbsp;规&nbsp;&nbsp;&nbsp;格:&nbsp;&nbsp;&nbsp;${comm.commdSize}</td>
</tr>
<tr>
<td>&nbsp;产&nbsp;&nbsp;&nbsp;地:&nbsp;&nbsp;&nbsp;${comm.commdProducePlace}</td>
</tr>
<tr>
<td>&nbsp;库存量:&nbsp;&nbsp;&nbsp;${comm.haveNum}件</td>
</tr>
<tr>
<td>&nbsp;上下架标志:<c:if test="${comm.uses eq '1'}">是</c:if><c:if test="${comm.uses eq '0'}">已下架</c:if></td>
</tr>
<tr>
<td>&nbsp;月销量：100件&nbsp;&nbsp;&nbsp;评价 <a href="#">累计XXX条</a></td>
</tr>
<tr>
<td></td>
</tr>
<tr>
<td></td>
</tr>
<tr>
<td></td>
</tr>
<tr>
<td></td>
</tr>
<tr>
<td></td>
</tr>
<tr>
<td></td>
</tr>
<tr>
<td></td>
</tr>
<tr>
<td></td>
</tr>
<tr>
<td>&nbsp;数量&nbsp;&nbsp;&nbsp;<input type="text" id="txtNumber" class="number" value="1"/>
<input type="button" value="+" onclick="addNumber()"/>
</td>
</tr>
<tr>
<td>
<c:forEach var="store" items="${store_info}">
<input type="button" value="继续购物" onclick="backShop(${store.storeId})" />
</c:forEach>
&nbsp;&nbsp;<input type="button" value="加入购物车" onclick="addShopCarComm();" />&nbsp;&nbsp;<input type="button" value="立即购买" onclick="Clearing()" /></td>
</tr>
<tr>
<td>支付方式：货到付款</td>
</tr>
</c:forEach>
</table>

</div>
</div>
<div class="main_con1">
<div class="commd_center">
<div class="commd_center_left">
<p class="ename">商家信息</p>
<ul>
<c:forEach var="store" items="${store_info}">
<li>&nbsp;商家名称:&nbsp;&nbsp;${store.storeName}</li>
<li>&nbsp;起送金额:&nbsp;&nbsp;￥${store.deliverPrice}</li>
<li>&nbsp;配送范围:&nbsp;&nbsp;${store.deliverRange}</li>
<li>&nbsp;商铺地址:&nbsp;&nbsp;${store.storeAddr}</li>
<li><input type="hidden" id="hidStoreName" value="${store.storeName}" /></li>
<input type="button" class="type" value="进入商铺" onclick="backShop(${store.storeId})"/>
<p style="align:right;" class="type"><a href="#">收藏商铺</a></p>
</c:forEach>
</ul>
</div>
<div class="commd_center_left">
促销商品
</div>
</div>
<div class="commd_center_r">
	<div class="tab_area" id="tab1"> 
		<ul> 
			<li id="tab1_1" class="current"><a href="#">商品详情</a></li>
			<li id="tab1_2"><a href="#">评价累计</a></li> 
			<li id="tab1_3"><a href="#">月交易明细XXX件</a></li> 
		</ul>			
	</div> 
	<div class="img_area">
		<ul id="tab1_1_body">
			<div class="commd_center_right">产品参数：<hr/>
			<c:forEach var="comm" items="${commodity}">
			<c:if test="${!empty comm.img1}"><img src="commimage/${comm.img1}"/></c:if>
			<c:if test="${!empty comm.img2}"><img src="commimage/${comm.img2}"/></c:if>
		    <c:if test="${!empty comm.img3}"><img src="commimage/${comm.img3}"/></c:if>
			</c:forEach>
			</div>
		</ul>
		<ul id="tab1_2_body">
			<li><div class="commd_center_right" id="commdApr"></div></li>
		</ul>
		<ul id="tab1_3_body">
			<li><div class="commd_center_right">成交记录：XXX</div></li>				
		</ul>
	</div>
</div>
<div class="shopcarc" id="carcontent" style="display:none;">
<ul>
<li>&nbsp;&nbsp;&nbsp;<span class="shopsmall"><a href="#" onclick="openOrClsShopCar(1)">关闭</a></span></li>
<li></li>
<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="commimage/3.jpg"></img>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${shopcar.number}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${shopcar.price}</li>
<li></li>
<li><c:if test="${!emptyshopcar.number3}">${shopcar.number3}</c:if></li>
<li></li>
<li></li>
<li></li>
</ul>
</div>
<div id="shopcar" class="shopcar" onclick="openOrClsShopCar(0)"></div>
<div class="subfooter clearfix">
		<dl>
			<dt>关于我们</dt>
			<dd><a href="commons/aboutUs.jsp" target="_blank">送每家</a></dd>
			<dd><a href="commons/contactUs.jsp" target="_blank">联系我们</a></dd>
			<dd><a href="commons/joinsUs.jsp" target="_blank">人才招聘</a></dd>
		</dl>
		<dl>
			<dt>订购指南</dt>
			<dd><a href="commons/help.jsp" target="_blank">常见问题</a></dd>
			<dd><a href="http://wpa.qq.com/msgrd?v=3&uin=94659568&site=qq&menu=yes" target="_blank">技术问题咨询</a></dd>
			<dd><a href="http://wpa.qq.com/msgrd?v=3&uin=254723939&site=qq&menu=yes" target="_blank">给送每家提意见</a></dd>
		</dl>
		<dl>
			<dt>客户服务</dt>
			<dd>热线&nbsp;15882478832(固话)</dd>
			<dd>热线&nbsp;15828586493(固话)</dd>
			<dd><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=94596538&site=qq&menu=yes">客服QQ</a></dd>
		</dl>
		<dl>
			<dt>其它服务</dt>
			<dd><a href="#" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.5smj.com');">设为首页</a></dd>
			<dd><a href="userAction.do?method=friendlinks" target="_blank">友情链接</a></dd>
			<dd><a href="systemAction.do?method=slogin" target="_blank">管理员登录</a></dd>
		</dl>
	</div>
</div>
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script> 
<script type="text/javascript" src="js/jquery.tabs.js"></script> 
<script src="js/CJL.0.1.min.js"></script>
<script src="js/ImageZoom.js"></script>
<script type="text/javascript" src="public/plugin/listUI/accumEvaluate.js"></script>
<script type="text/javascript" src="js/shopcard.js"></script>
<script>
var commdId = document.getElementById('commdId').value;

(function(){

var iz = new ImageZoom( "idImage2", "idViewer2", {
	mode: "handle", handle: "idHandle3"
});

var arrPic = [], list = $$("idList"), image = $$("idImage2");

var commimage = document.getElementById('commimage').value;
var tmp = commimage.substr(0,commimage.lastIndexOf("_"));
var commtmp = tmp.split("_");
for(i=0;i<commtmp.length;i++){
      var ctmp = commtmp[i].split("|");
      if(ctmp != ""){
      		arrPic.push({ smallPic: "commimage/"+ctmp[0], originPic: "commimage/"+ctmp[1], zoomPic: "commimage/"+ctmp[2] });
      }
}

$$A.forEach(arrPic, function(o, i){
	var img = list.appendChild(document.createElement("img"));
	img.src = o.smallPic;
	img.onmouseover = function(){
		iz.reset({ originPic: o.originPic, zoomPic: o.zoomPic });
		$$A.forEach(list.getElementsByTagName("img"), function(img){ img.className = ""; });
		this.className = "on";
	}
	if(!i){ img.onmouseover(); }
})
})()
function  addNumber(){
   var num = document.getElementById('txtNumber');
   if(num.value < 1){
     return;
   }
   else{
       num.value =  parseInt(parseInt(num.value)  +  1);
   }
   
}

function backShop(storeId){
    window.location.href="${ctx}/userAction.do?method=commdsInfo&storeId=storeId";
}

function $i(id){
	return document.getElementById(id);
}
function tabswitch(c, config){
	this.config = config ? config : {start_delay:3000, delay:1500};
	this.container = $i(c);
	this.pause = false;
	this.nexttb = 1;
	this.tabs = this.container.getElementsByTagName('dt');
	var _this = this;
	if(this.tabs.length<1)this.tabs = this.container.getElementsByTagName('li');
	for(var i = 0; i < this.tabs.length; i++){
		var _ec = this.tabs[i].getElementsByTagName('span');
		if(_ec.length<1)_ec = this.tabs[i].getElementsByTagName('a');
		if(_ec.length<1){
			_ec = this.tabs[i]
		}else{
			_ec = _ec[0];
		}
		_ec.onmouseover = function(e) {
			_this.pause = true;
			var ev = !e ? window.event : e;
			_this.start(ev, false, null);
		};
		
		try{
			$i(this.tabs[i].id + '_body').onmouseover = function(){
				_this.pause = true;
			};			
		}catch(e){}
	}
 
	if ($i(c + '_sts')) {
		var _sts = $i(c + '_sts');
		var _step = _sts.getElementsByTagName('li');
		if(_step.length<1)_step = _sts.getElementsByTagName('div');
		_step[0].onclick = function() {
			if (_this.tabs[_this.tabs.length-1].className.indexOf('current') > -1) {
				_this.nexttb = _this.tabs.length + 1;
			};
			_this.nexttb = _this.nexttb - 2 < 1 ? _this.tabs.length : _this.nexttb - 2;
			//alert(_this.nexttb);
			_this.start(null, null, _this.nexttb);
		};
		
		_step[1].onclick = function() {
			_this.nexttb = _this.nexttb < 1 ? 1 : _this.nexttb;
			_this.start(null, null, _this.nexttb);
		};
	};
	
	this.start = function(e, r, n){
		if(_this.pause && !e)return;
		if(r){
			curr_tab = $i(_this.container.id + '_' + rand(4));
		}else{
			if(n){				
				curr_tab = $i(_this.container.id + '_' + _this.nexttb);
			}else{
				curr_tab = e.target ? e.target : e.srcElement;
				if(curr_tab.id=="")curr_tab = curr_tab.parentNode;
			}
		}
		
		var tb = curr_tab.id.split("_");
		for(var i = 0; i < _this.tabs.length; i++){
			if(_this.tabs[i]==curr_tab){
				_this.tabs[i].className="current";
				try{					
					$i(_this.tabs[i].id + '_body').style.display = "block";
				}catch(e){}
			}else{
				_this.tabs[i].className="";
				try{
					$i(_this.tabs[i].id + '_body').style.display = "none";
				}catch(e){}
			}
		}
		_this.nexttb = parseInt(tb[tb.length-1]) >= _this.tabs.length ? 1 : parseInt(tb[tb.length-1]) + 1;
	};
}
//设置
var tab1;
function init_load(){
    if ($i('tab1')) {
		tab1 = new tabswitch('tab1', {});
		setInterval("tab1.start(null, null, 1);", 6000);
	}
	
	$i('tab1_2_body').style.display = "none";
	$i('tab1_3_body').style.display = "none";
}
if(window.attachEvent){
    window.attachEvent("onload",init_load);
}else if(window.addEventListener){
    window.addEventListener("load",init_load,false);
}


$(document).ready(function () { 
				$("#commdApr").listUI({
					title : "累计评价",// 是否包含标题
					url : 'userAction.do?method=queryCommAppr&commdId='+commdId, // ajax方式对应的url地址
					method : 'POST', // 数据发送方式
					dataType : 'json', // 数据加载的类型
					width : '800px',
					pageSize : 20,
					editMode : false
				});
			});
 
 function Clearing(){
    window.location.href="${ctx}/userAction.do?method=createbill";
 }
  
 function addShopCarComm(){
     
       $(function() {
	    $.ajax({
	     async:false,
	     cache:false,
	     type:'POST',
	     dataType:"json",
	     data:{action:'Add'},
	     url : "${ctx}/userAction.do?method=shopCardManager",
	     success:function(){
	     } 
	   });
	   });   
 }
 
 

</script>
</div>
</body>
</html>