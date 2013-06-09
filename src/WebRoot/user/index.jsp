<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>送每家网 - 网上超市</title>
	<meta name="Description" content=" " />
	<meta name="Keywords" content="sunbyway,  "/>
	<link rel="shortcut icon" href="${ctx}/favicon.ico"/> 
		<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/css/main.css" rel="stylesheet" type="text/css" /> 
</head>
<body>
<div id="f_show">
	<h3>地址列表&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<a href="#" onclick="to_address();">地址管理</a>]&nbsp;&nbsp;[<a href="#" onclick="floor_close();">关闭</a>]</h3>
	<p id="f_text"></p>
</div>
<%@include file="/user/top.jsp" %>
<div class="content">
	<div class="main_con">
		<div class="login_box">
		<c:choose>
    		<c:when test="${sGlobal.smj_userid>0}">
            <div class="hd"><h2>${sGlobal.smj_name},您好</h2></div>
			<div>
				<div class="loginform">
					<span>等 级：<img src="${ctx}${sugu:rankPic(sGlobal.smj_rank,'U')}" alt=""/>&nbsp;(<a href="${ctx}/userAction.do?method=turnto&sign=2">${sGlobal.smj_rank}</a>)</span>
                	<span>积 分：<img src="${ctx}/images/credit.gif" alt="" width="12" height="11"/><a href="${ctx}/userAction.do?method=integral" title="积分明细"><font color="red">${sGlobal.smj_integral}</font></a>
                	&nbsp;&nbsp;<a href="${ctx}/userAction.do?method=giftList" title="我要兑换"><img src="${ctx}/images/integralbtn.png" alt=""/></a></span>
					<span>当前地址：<a href="javascript:queryAllAdd();"><img src="${ctx}/images/space.gif" class="icon15" align="absmiddle"/>换地址</a></span>
					<span style="color:red;" id="defaultAdd"></span>
                	<span class="cen"><a href="${ctx}/userAction.do?method=billList&flow=1" id="dqd"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${ctx}/userAction.do?method=billList&flow=3&isapp=N" id="dpj"></a></span>
				</div>
			</div>
        	</c:when>
   			<c:otherwise>
   			<div class="hd"><h2>用户登录</h2></div>
			<div>
				<form name="loginform" id="loginform" method="post" action="${ctx}/userAction.do?method=login">
					<div class="loginform">
						<div class="form_item"><label class="field" for="account"><bean:message key="user.username"/></label><div class="con"><input name="username" id="unm" type="text" class="input_txt" value="" onclick="ruser();"/></div></div>
						<div class="form_item"><label class="field" for="password">密 码：</label><div class="con"><input name="password" id="pwd" type="password" class="input_txt" /></div></div>
						<div class="form_item auto_login"><div class="con"><label class="auto_login"><input name="cookietime" id="cookietime" value="315360000" type="checkbox" checked="checked"/>自动登录</label><a class="forgot_pas" href="${ctx}/userAction.do?method=turnto&sign=3" title="忘记密码">忘记密码？</a></div></div>
						<div class="login_btn"><a href="javascript:ulogin();" title="登录">登录</a></div>
						<div class="reg_btn"><a href="${ctx}/uregister.jsp" title="立即免费注册"></a></div>
					</div>
				</form>
				  <logic:messagesPresent>
					  	<script language="javascript">
					  		alert('<html:errors property="loginError"/>');
					  	</script>
					  </logic:messagesPresent>
			</div>
   			</c:otherwise>
  		</c:choose>
  		</div>
		<div class="flash_box">
			<ul class="slider"><c:forEach items="${ads_top}" var="ad"><li><a href="${ad.wwwpath}" target="_blank"><img src="${ad.picpath}" width="480" height="220" alt=""/></a></li></c:forEach></ul>
    		<ul class="num"><c:forEach items="${ads_top}" varStatus="statu"><li>${statu.index+1}</li></c:forEach></ul>
		</div>
		<div class="notice_box">
			<div class="tab_wrap1">
				<ul class="tab_nav"><li class="on"><a href="#nogo" title="公告">公告</a></li><li><a href="#nogo" title="积分">礼品兑换</a></li></ul>
				<div class="tab_content1">
					<div class="tcon" style="display:block;">
						<ul class="text_list">
						<c:forEach items="${articles}" var="article">
							<li><a href="${ctx}/userAction.do?method=article&id=${article.id}" target="_blank" title="${article.title}">${sugu:disposeLongStr(7,article.title)}${article.date}</a></li>
						</c:forEach>
						</ul>
						<a href="${ctx}/userAction.do?method=articleList&bclass=4" class="more" target="_blank" title="更多公告请点击">更多公告请点击</a> </div>
					<div class="tcon" style="display:none;">
						<ul class="text_list">
						<c:forEach items="${changes}" var="change">
							<li><a href="${ctx}/userAction.do?method=gift&id=${change.id}" target="_blank" title="${change.username}&nbsp;兑换了&nbsp;${change.giftname}">${change.username}&nbsp;兑换了&nbsp;${change.giftname}</a></li>
						</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
 
	<div class="order_flow"><a href="${ad_01.wwwpath}" target="_blank"><img src="${ad_01.picpath}" alt="" width="920px" height="55px"/></a></div>
	<div class="wapper"> 
		<!-- S 活动店铺 -->
		<div class="act_shop">
			<div class="hd">
				<h3>活动店铺</h3>
				<ul class="other_nav">
					<li id="q_1" class="on"><a href="#nogo" title="和平">和平区</a></li>
					<li id="q_2"><a href="#nogo" title="南开">南开区</a></li>
				</ul>
			</div>
			<div class="bd" id="Content">
				<ul class="shop_list clearfix">
				<c:forEach var="disl" items="${discounts}">
					<li><a target="_blank" href="${ctx}/userAction.do?method=dishList&id=${disl.store_id}" title="${disl.store_name}"><img src="${disl.logopath}" title="" alt=""/><span>${disl.store_name}</span></a></li>
				</c:forEach>
				</ul>
			</div>
		</div>
		<!-- E 活动店铺 -->
		<div class="side_box">
			<div class="adver1_box"><a href="${ad_02.wwwpath}" target="_blank"><img src="${ad_02.picpath}" alt="" width="210px" height="160px"/></a></div>
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
								<li><i<c:if test="${(statu.index+1)<4}"> class="num1"</c:if>>${statu.index+1}</i><a href="${ctx}/userAction.do?method=dishList&id=${store.id}" target="_blank" title="${store.store_name}">${sugu:disposeLongStr(12,store.store_name)}</a></li>
							</c:forEach>
							</ul>
						</div>
						<div class="tcon" style="display:none;">
							<ul class="tops_list">
							<c:forEach items="${stores}" var="store" varStatus="statu">
								<li><i<c:if test="${(statu.index+1)<4}"> class="num1"</c:if>>${statu.index+1}</i><a href="${ctx}/userAction.do?method=dishList&id=${store.id}" target="_blank" title="${store.store_name}">${sugu:disposeLongStr(12,store.store_name)}</a></li>
							</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="adver2_box"><p><a href="${ad_03.wwwpath}" target="_blank"><img src="${ad_03.picpath}" width="210px" height="130px" alt=""/></a></p></div>
		</div>
	</div>
	<div class="adver3_box">
		<div class="adv01"><a href="${ad_04.wwwpath}" target="_blank"><img src="${ad_04.picpath}" width="260" height="60" alt=""/></a></div>
		<div class="adv02"><a href="${ad_05.wwwpath}" target="_blank"><img src="${ad_05.picpath}" width="430" height="60" alt=""/></a></div>
		<div class="adv03"><a href="${ad_06.wwwpath}" target="_blank"><img src="${ad_06.picpath}" width="210" height="60" alt=""/></a></div>
	</div>
	<div class="friend_link"><strong>友情链接：</strong>
	<c:forEach items="${links}" var="link"><a href="${link.wwwpath}" target="_blank">${link.name}</a></c:forEach><a href="${ctx}/userAction.do?method=friendlinks" target="_blank" title="更多" class="more">更多&gt;&gt;</a></div>
	<div class="subfooter clearfix">
		<dl>
			<dt>关于我们</dt>
			<dd><a href="${ctx}/commons/aboutUs.jsp" target="_blank">尚佰味</a></dd>
			<dd><a href="${ctx}/commons/contactUs.jsp" target="_blank">联系我们</a></dd>
			<dd><a href="${ctx}/commons/joinsUs.jsp" target="_blank">人才招聘</a></dd>
		</dl>
		<dl>
			<dt>订餐指南</dt>
			<dd><a href="${ctx}/commons/help.jsp" target="_blank">常见问题</a></dd>
			<dd><a href="http://wpa.qq.com/msgrd?v=3&uin=94659568&site=qq&menu=yes" target="_blank">技术问题咨询</a></dd>
			<dd><a href="http://wpa.qq.com/msgrd?v=3&uin=254723939&site=qq&menu=yes" target="_blank">给尚佰味提意见</a></dd>
		</dl>
		<dl>
			<dt>客户服务</dt>
			<dd>热线&nbsp;15332130865(固话)</dd>
			<dd>热线&nbsp;15332130965(固话)</dd>
			<dd><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=89338521&site=qq&menu=yes">客服QQ</a></dd>
		</dl>
		<dl>
			<dt>其它服务</dt>
			<dd><a href="#" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.sunbyway.com');">设为首页</a></dd>
			<dd><a href="${ctx}/userAction.do?method=friendlinks" target="_blank">友情链接</a></dd>
		</dl>
	</div>
</div>
<%@include file="/commons/footer.jsp" %>
<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script> 
<script type="text/javascript" src="${ctx}/js/jquery.tabs.js"></script> 
<script src="http://static.woyo.com/js/public/woyo.js" type="text/javascript"></script> 
<script type="text/javascript"> 
	setTimeout("loadsysmes()",5000);
	WOYO.load("jQuery, widget.Tabs, widget.SeamlesScroll",function(){ 
		WOYO.widget.SeamlesScroll('#app_sp_show',{panels:'.sp_show_list li',btnPrev:'.arr_prev',btnNext:'.arr_next',disableBtnCls:'btn_disable',speed:500,scroll:5,visible:5});
	});
	
	var username = document.getElementById('unm');
	username.value = "手机号|帐号|邮箱";
	
	function ruser()
	{
		var username = document.getElementById('unm');
		username.value = "";
	}

	
	function ulogin(){
		var username = document.getElementById('unm').value;
		var password = document.getElementById('pwd').value;
		if(username==''){alert("账号未填写！");return;}else if(password==''){alert("密码未填写！");return;}else{document.loginform.submit();}
	}
	<c:if test="${sGlobal.smj_userid>0}">
		function queryDftAdd() {
			var ajax = new Ajax('defaultAdd','${ctx}');
			ajax.getSend('${ctx}/userAction.do?method=defaultAdd',function(s){
				var xml = new Xml(s);
				var address = xml.getElements("address");
				if(address.length>0)
					document.getElementById('defaultAdd').innerHTML = address[0].childNodes[0].nodeValue;
			});
		}
		function queryNum() {
			var ajax = new Ajax('query','${ctx}');
			ajax.getSend('${ctx}/userAction.do?method=billnum',function(s){
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
		function queryAllAdd() {
			var objname = "f_text";
			var ajax = new Ajax(objname,'${ctx}');
			document.getElementById("f_text").innerHTML = "";
			floor_show();
			ajax.getSend('${ctx}/userAction.do?method=allAddress',function(s){
				var xml = new Xml(s);
				var address = xml.getElements("address");
				for(var i=0;i<address.length;i++){
					if(address[i].attributes[1].nodeValue=="Y"){
						document.getElementById("f_text").innerHTML += "<a>"+address[i].childNodes[0].nodeValue+"&nbsp;【当前】</a>";
					}else{
						document.getElementById("f_text").innerHTML += "<a href='#' onclick='changDftAdd("+address[i].attributes[0].nodeValue+")'>"+address[i].childNodes[0].nodeValue+"</a>";
					}
				}
			});
		}
		function changDftAdd(id){
			var ajax = new Ajax("f_text",'${ctx}');
			ajax.getSend('${ctx}/userAction.do?method=changDftAdd&id='+id,function(s){
				var xml = new Xml(s);
				var address = xml.getElements("address");
				if(address.length>0)
					document.getElementById("defaultAdd").innerHTML = address[0].childNodes[0].nodeValue;
				floor_close();
			});
		}
		queryDftAdd();
		queryNum();
	</c:if>
	function to_address(){document.location="${ctx}/userAction.do?method=allAddress&type=Y";}
	$(function(){
	
		$("#q_1").click(function(){
				$("#q_1").attr("class","on");
				$("#q_2").attr("class","");
				$.post("${ctx}/userAction.do?method=disCheck&aid=1",null,function(data){$("#Content").html(data);});
		});
		$("#q_2").click(function(){
				$("#q_2").attr("class","on");
				$("#q_1").attr("class","");
				$.post("${ctx}/userAction.do?method=disCheck&aid=8",null,function(data){$("#Content").html(data);});
		});
			$("#q_1").attr("class","on");
		$("#q_2").attr("class","");
	});

</script>
</body>
</html>