<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>宋美佳 - 网上订单|日常生活用品|快速送货到家</title>
	<meta name="Description" content="宋美佳为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
	<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" />
	<link rel="shortcut icon" href="${ctx}/favicon.ico">
	<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/css/merchant.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="/user/top.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox"><tr><td>
<div id="wrap">
	<%@include file="/merchant/left.jsp" %>
   	<div id="mainarea">
   	<h2 class="title"><img src="${ctx}/images/space.gif" class="icon7"/>开通店铺</h2>
   	<form method="post" action="${ctx}/merchantAction.do?method=addStore" name="myform" class="c_form">
        <table cellspacing="0" cellpadding="0" class="formtable">
			<tr>
				<th style="width: 10em;">店铺LOGO:</th>
				<td><input type="file" id="logopath" name="logopath" class="t_input" /><br/> * 允许上传图片类型为：jpg | gif | png<br/> * 允许上传最大图片为：512KB<br/> * 建议图片尺寸为：120*85</td>
				<td></td>
			</tr>
			<tr>
				<th style="width: 10em;">店铺名称:</th>
				<td><input type="text" id="store_name" name="store_name" class="t_input"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">店铺类型:</th>
				<td>
					<input type="radio" name="issend" value="Y" checked="checked"/>超市
					<input type="radio" name="issend" value="N"/>餐饮
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">店铺开关:</th>
				<td>
					<input type="radio" name="onoff" value="Y" />营业
					<input type="radio" name="onoff" value="N" checked="checked"/>休息</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">起送金额:</th>
				<td><input class="t_input" type="text" id="beginprice" name="beginprice" size="5" maxlength="4"/>元&nbsp;（<font color="#FF0000">* 填写整数</font>）</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">配送费用:</th>
				<td><input type="text" name="sendprice" id="sendprice" value="0" size="5" maxlength="4" class="t_input"/>元&nbsp;（<font color="#FF0000">* 填写整数</font>）</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">联&nbsp;系&nbsp;人:</th>
				<td><input type="text" name="username" id="username" class="t_input"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">客服电话:</th>
				<td><input type="text" name="telephone" id="telephone" class="t_input"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">客服 QQ:</th>
				<td><input type="text" name="qq" id="qq" class="t_input"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">营业时间:</th>
				<td><input type="text" name="bewrite" id="bewrite" class="t_input" maxlength="11"/>&nbsp;如：09:00-21:00</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">店铺地址:</th>
				<td><textarea name="address" id="address" cols="60" rows="2" class="t_input"></textarea>&nbsp;（<font color="#FF0000">*50字以内</font>）</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">服务承诺:</th>
				<td><textarea name="serve" id="serve" cols="60" rows="2" class="t_input"></textarea>&nbsp;（<font color="#FF0000">*100字以内</font>）</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">配送范围:</th>
				<td><textarea name="serve" id="serve" cols="60" rows="2" class="t_input"></textarea>&nbsp;（<font color="#FF0000">*100字以内</font>）</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">&nbsp;</th>
				<td><input type="button" name="button" onclick="check();" value=" 保 存 " class="submit" /></td>
				<td>&nbsp;</td>
			</tr>
		</table>
   	</form>
   	</div>
</div>
</td></tr></table>
<%@include file="footer.jsp" %>
<script type="text/javascript">
	
	function check(){/*
		var store_name = document.getElementById('store_name').value;
		if(store_name==""){
			alert("店铺名称未填写！");
			return;
		}	
		var username = document.getElementById('username').value;
		if(username==""){
			alert("店铺负责人未填写！");
			return;
		}
		var telephone = document.getElementById('telephone').value;
		if(telephone==""){
			alert("客服电话未填写！");
			return;
		}
		var issends = document.getElementsByName('issend');
		for(var i=0;i<issends.length;i++){
			if(issends[i].checked){
				if(issends[i].value=="Y"){
					var beginprice = document.getElementById('beginprice').value;
					if(beginprice==""){
						alert("起送金额未设置！");
						return;
					}
					var minutes = document.getElementById('minutes').value;
					if(minutes==""){
						alert("响应时间未设置！");
						return;
					}
				}
			}
		}
		var bewrite = document.getElementById('bewrite').value;
		var reg =/^\d{2}:\d{2}-\d{2}:\d{2}$/;
		if(!reg.test(bewrite)){
			alert("营业时间不符合规则！");
			return;
		}
		var sendprice = document.getElementById('bewrite').value;
		if(sendprice==""){
			alert("配送费用未设置！");
			return;
		}
		var address = document.getElementById('address').value;
		if(address.length>50||address.length<2){
			alert("详细地址请控制在2到50字以内！");
			return;
		}
		var serve = document.getElementById('serve').value;
		if(serve.length>100||serve.length<2){
			alert("服务承诺请控制在2到100字以内！");
			return;
		}*/
		document.myform.submit();
	}
</script>
</body>
</html>