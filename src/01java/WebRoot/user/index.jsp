<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>送每家 - 网上订单|日常生活用品|快速送货到家</title>
	<meta name="Description" content="送每家为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
	<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" />
	<meta name="Description" content=" " />
	<meta name="Keywords" content="songmeijia,  "/>
	<link rel="shortcut icon" href="favicon.ico"/> 
		<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/css/main.css" rel="stylesheet" type="text/css" /> 
<body>
<div id="f_show">
	<h3>地址列表&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<a href="#" onclick="to_address();">地址管理</a>]&nbsp;&nbsp;[<a href="#" onclick="floor_close();">关闭</a>]</h3>
	<p id="f_text"></p>
</div>
<%@include file="/user/top.jsp" %>

<div class="content">
<div class="main_con1">
<div class="main_left">
<div class="login_box">
		<c:choose>
    		<c:when test="${sGlobal.smj_userid>0}">
            <div class="hd"><h2>${sGlobal.smj_name},您好</h2></div>
			<div>
				<div class="loginform">
                	<span>积 分：<img src="images/credit.gif" alt="" width="12" height="11"/><a href="userAction.do?method=integral" title="积分明细"><font color="red">${sGlobal.smj_integral}</font></a></span>
					<span>当前地址：${sGlobal.smj_address}</span>
					<span style="color:red;" id="defaultAdd"></span>
                	<span class="cen"><a href="userAction.do?method=billList&flow=1" id="dqd"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${ctx}/userAction.do?method=billList&flow=3&isapp=N" id="dpj"></a></span>
				</div>
			</div>
        	</c:when>
   			<c:otherwise>
   			<div class="hd"><h2>用户登录</h2></div>
			<div>
				<form name="loginform" id="loginform" method="post" action="userAction.do?method=login">
					<div class="loginform">
						<div class="form_item"><label class="field" for="account">用户名:</label><div class="con"><input name="usernames" id="usernames" type="text" class="input_txt" value="" onclick="ruser();"/></div></div>
						<div class="form_item"><label class="field" for="password">密 码：</label><div class="con"><input name="password" id="password" type="password" class="input_txt" /></div></div>
						<div class="login_btn"><a href="javascript:ulogin();" title="登录">登录</a></div>
						<div class="form_item auto_login"><div class="con"><label class="auto_login"><input name="cookietime" id="cookietime" value="315360000" type="checkbox" checked="checked"/>自动登录</label><a class="forgot_pas" href="${ctx}/userAction.do?method=forgotpwd" title="忘记密码">忘记密码？</a></div></div><div class="reg_btn"><a href="uregister.jsp" title="立即免费注册"></a></div>
					</div>
				</form>
			</div>
   			</c:otherwise>
  		</c:choose>
  		</div>
        
             <div class="shop_tops">
				<div class="tab_wrap2">
					<ul class="tab_nav">
						<li class="on"><a href="#nogo" title="店铺推荐">店铺推荐</a></li>
						<li><a href="#nogo" title="诚信排行">诚信排行</a></li>
					</ul>
					<div class="tab_content2">
						<div class="tcon" style="display:block;">
							<ul class="tops_list">
							
							<c:forEach items="${goodstores}" var="store" varStatus="statu">
								<li><i<c:if test="${(statu.index+1)<4}"> class="num1"</c:if>>${statu.index+1}</i><a href="${ctx}/userAction.do?method=dishList&id=${store.id}" target="_blank" title="${store.store_name}">${smj:disposeLongStr(12,store.store_name)}</a></li>
							</c:forEach>
							</ul>
						</div>
						<div class="tcon" style="display:none;">
							<ul class="tops_list">
							<c:forEach items="${stores}" var="store" varStatus="statu">
								<li><i<c:if test="${(statu.index+1)<4}"> class="num1"</c:if>>${statu.index+1}</i><a href="${ctx}/userAction.do?method=dishList&id=${store.id}" target="_blank" title="${store.store_name}">${smj:disposeLongStr(12,store.store_name)}</a></li>
							</c:forEach>
							</ul>
						</div>
					</div>
		</div>
		</div>
     
 </div>
<div class="main_right">
<ul>
<li>&nbsp;&nbsp;&nbsp;<input type="text" id="searchValue"/><input type="button" value="搜索"/></li>
</ul>
<img src="images/map.png" alt="" />
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
<%@include file="/commons/footer.jsp" %>
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script> 
<script type="text/javascript" src="js/jquery.tabs.js"></script> 
 <script type="text/javascript" src="js/shopcard.js"></script>
<script type="text/javascript"> 
	setTimeout("loadsysmes()",5000);
      var msg = "${errorMsg}";
      var type = "${type}";
 	    if(msg != ""){
	         alert(msg);
	         $("#usernames").focus();
	     }
	function ruser()
	{
		var username = document.getElementById('usernames');
		username.value = "";
	}

	
	function ulogin(){
		var username = document.getElementById('usernames').value;
		var password = document.getElementById('password').value;
		if(username==''){
		   alert("账号未填写！");
		   return;
		}
		else if(password==''){
		   alert("密码未填写！");
		   return;
	    }    
	    
	    document.loginform.submit();
	}
	<c:if test="${sGlobal.smj_userid>0}">
		
		function queryNum() {
			var ajax = new Ajax('query','${ctx}');
			ajax.getSend('userAction.do?method=billnum',function(s){
				var xml = new Xml(s);
				var qd = xml.getElements("qd");
				var pj = xml.getElements("pj");
				if(qd[0].childNodes[0].nodeValue=="0"){
					document.getElementById("dqd").innerHTML = "待确定(0)";
				}else{
					document.getElementById("dqd").innerHTML = '待确定(<font color="red">'+qd[0].childNodes[0].nodeValue+'</font>)';
				}
				if(pj[0].childNodes[0].nodeValue=="0"){
					document.getElementById("dpj").innerHTML = "待评价(0)";
				}else{
					document.getElementById("dpj").innerHTML = '待评价(<font color="red">'+pj[0].childNodes[0].nodeValue+'</font>)';
				}
			});
		}
		
	</c:if>
	function to_address(){document.location="userAction.do?method=allAddress&type=Y";}
	$(function(){
	
		$("#q_1").click(function(){
				$("#q_1").attr("class","on");
				$("#q_2").attr("class","");
				$.post("userAction.do?method=disCheck&aid=1",null,function(data){$("#Content").html(data);});
		});
		$("#q_2").click(function(){
				$("#q_2").attr("class","on");
				$("#q_1").attr("class","");
				$.post("userAction.do?method=disCheck&aid=8",null,function(data){$("#Content").html(data);});
		});
			$("#q_1").attr("class","on");
		$("#q_2").attr("class","");
	});

</script>
</body>
</html>