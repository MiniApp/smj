<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>送每家 - 网上订单|日常生活用品|快速送货到家</title>
	<meta name="Description" content="送每家为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
	<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" /><link rel="shortcut icon" href="favicon.ico" />
	<link href="css/global.css" rel="stylesheet" type="text/css" />
	<link href="css/merchant.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="/user/top.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox"><tr><td>
<div id="wrap">
	<%@include file="/merchant/left.jsp" %>
   	<div id="mainarea">
   	<h2 class="title"><img src="${ctx}/images/space.gif" class="icon7"/>开通店铺</h2>
      <table cellspacing="0" cellpadding="0" class="formtable">
			<tr>
				<th style="width: 10em;">店铺LOGO:</th>
				<td><input type="file" id="logopath" name="logopath" class="t_input" /><br/> * 允许上传图片类型为：jpg | gif | png<br/> * 允许上传最大图片为：512KB<br/> * 建议图片尺寸为：120*85</td>
				<td></td>
			</tr>
			<tr>
				<th style="width: 10em;">店铺名称:</th>
				<td><input type="text" id="store_name" name="store_name" class="t_input"/>*</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">店铺类型:</th>
				<td>
					<input type="radio" name="issend" value="10" checked="checked"/>超市
					<input type="radio" name="issend" value="11"/>餐饮
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">店铺级别:</th>
				<td>
					<input type="radio" name="level" value="12" checked="checked"/>普通店
					<input type="radio" name="level" value="13"/>直营店
					<input type="radio" name="level" value="14"/>加盟店
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">店铺开关:</th>
				<td>
					<input type="radio" name="onoff" value="8"  checked="checked"/>营业
					<input type="radio" name="onoff" value="9"/>休息</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">起送金额:</th>
				<td><input class="t_input" type="text" id="beginprice" name="beginprice" value="0" size="5" maxlength="4"/>元&nbsp;（<font color="#FF0000">* 填写整数</font>）</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">响应时间:</th>
				<td><input class="t_input" type="text" id="resptime" name="resptime" value="0"  size="5" maxlength="4"/>分钟&nbsp;（<font color="#FF0000">* 填写整数</font>）</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">配送费用:</th>
				<td><input type="text" name="sendprice" id="sendprice" value="0" size="5" maxlength="4" class="t_input"/>元&nbsp;（<font color="#FF0000">* 填写整数</font>）</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">联&nbsp;系&nbsp;人:</th>
				<td><input type="text" name="username" id="username" class="t_input"/>* （<font color="#FF0000">商铺联系人</font>)</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">客服电话:</th>
				<td><input type="text" name="telephone" id="telephone" class="t_input"/>* （<font color="#FF0000">可以填写为不公开</font>)</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">客服 QQ:</th>
				<td><input type="text" name="qq" id="qq" class="t_input"/>*</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">营业时间:</th>
				<td><input type="text" name="bewrite" id="bewrite" class="t_input" maxlength="11"/>* （<font color="#FF0000">如：09:00-21:00</font>)</td>
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
				<td><textarea name="range" id="range" cols="60" rows="2" class="t_input"></textarea>&nbsp;（<font color="#FF0000">*100字以内</font>）</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">&nbsp;</th>
				<td><input type="button" name="button" onclick="check(logopath);" value=" 保 存 " class="submit" /></td>
				<td>&nbsp;</td>
			</tr>
		</table>
   	</div>
</div>
</td></tr></table>
<%@include file="footer.jsp" %>
<script type="text/javascript" src="js/ztree/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${ctx}/js/file.js"></script>
<script type="text/javascript">
	
	function check(obj1){
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
			 var issend = issends[i].value;
			}
		}
		
	 	var levels = document.getElementsByName('level');
	 	for(var i=0;i<levels.length;i++){
			if(levels[i].checked){
			 var level = levels[i].value;
			}
		}
		
		var onoff  = document.getElementsByName('onoff');
			for(var i=0;i<onoff.length;i++){
			if(onoff[i].checked){
			 var onoffs = onoff[i].value;
			}
		}
		
		var qq  = document.getElementById('qq').value;
		if(qq==""){
			alert("客服QQ未设置！");
			return;
		}
		
		var bewrite = document.getElementById('bewrite').value;
		var reg =/^\d{2}:\d{2}-\d{2}:\d{2}$/;
		if(!reg.test(bewrite)){
			alert("营业时间不符合规则！");
			return;
		}
		
		var beginprice = document.getElementById('beginprice').value;
		if(beginprice==""){
			alert("起送金额未设置！");
			return;
		}
		
		var resptime = document.getElementById('resptime').value;
		if(resptime==""){
			alert("响应时间未设置！");
			return;
		}
		
		var sendprice = document.getElementById('sendprice').value;
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
		}	
		var range = document.getElementById('range').value;
		if(range.length>100||range.length<2){
			alert("配送范围请控制在2到100字以内！");
			return;
		}	
		
	   $(function() {
			   $.ajax({
			     async:false,
			     cache:false,
			     type:'POST',
			     dataType:"json",
			     data:{filepath:getUnloadFilePath(obj1),store_name:store_name,issends:issend,level:level,onoff:onoffs,beginprice:beginprice,resptime:resptime,sendprice:sendprice,username:username,telephone:telephone,qq:qq,bewrite:bewrite,address:address,serve:serve,range:range},
			     url :"${ctx}/merchantAction.do?method=subAddStore",
			     success:function(){
			           //把后台封装好的简单Json格式赋给treeNodes
			     } 
			   });
			   });
	}
</script>
</body>
</html>