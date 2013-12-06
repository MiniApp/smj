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
   	<h2 class="title"><img src="images/space.gif" class="icon7"/>商品添加</h2>
   	<form method="post" action="merchantAction.do?method=addProduct" name="myform" class="c_form">
        <table cellspacing="0" cellpadding="0" class="formtable">
			<tr>
				<th style="width: 10em;">商品类别:</th>
				<td><input type="text" id="store_name" name="store_name" class="t_input"/></td>
				<td><a href="merchantAction.do?method=addProductCategory">添加</a></td>
			</tr>
			<tr>
				<th style="width: 10em;">商品一维码:</th>
				<td><input type="text" id="store_name" name="store_name" class="t_input"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">商品名称:</th>
				<td><input type="text" id="store_name" name="store_name" class="t_input"/></td>
				<td></td>
			</tr>
			<tr>
				<th style="width: 10em;">商品LOGO:</th>
				<td><input type="file" id="logopath" name="logopath" class="t_input" /><br/> * 允许上传图片类型为：jpg | gif | png<br/> * 允许上传最大图片为：512KB<br/> * 建议图片尺寸为：120*85</td>
				<td></td>
			</tr>
			<tr>
				<th style="width: 10em;">商品单位:</th>
				<td><input type="text" id="store_name" name="store_name" class="t_input"/></td>
				<td><a href="#">添加</a></td>
			</tr>
			<tr>
				<th style="width: 10em;">商品重量:</th>
				<td><input type="text" id="store_name" name="store_name" class="t_input"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">商品数量:</th>
				<td><input type="text" id="store_name" name="store_name" class="t_input"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">商品规格:</th>
				<td><input type="text" id="store_name" name="store_name" class="t_input"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">商品描述:</th>
				<td><input type="text" id="store_name" name="store_name" class="t_input"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">市场价:</th>
				<td><input type="text" id="store_name" name="store_name" class="t_input"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">会员价:</th>
				<td><input type="text" id="store_name" name="store_name" class="t_input"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">销售价:</th>
				<td><input type="text" id="store_name" name="store_name" class="t_input"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">促销价:</th>
				<td><input type="text" id="store_name" name="store_name" class="t_input"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">品味:</th>
				<td><input type="text" id="store_name" name="store_name" class="t_input"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">配品:</th>
				<td><input type="text" id="store_name" name="store_name" class="t_input"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">积分:</th>
				<td><input type="text" id="store_name" name="store_name" class="t_input"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">日销售上线:</th>
				<td><input type="text" id="store_name" name="store_name" class="t_input"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">商品图片1:</th>
				<td><input type="file" id="logopath" name="logopath" class="t_input" /><br/> * 允许上传图片类型为：jpg | gif | png<br/> * 允许上传最大图片为：512KB<br/> * 建议图片尺寸为：120*85</td>
				<td></td>
			</tr>
			<tr>
				<th style="width: 10em;">商品图片2:</th>
				<td><input type="file" id="logopath" name="logopath" class="t_input" /><br/> * 允许上传图片类型为：jpg | gif | png<br/> * 允许上传最大图片为：512KB<br/> * 建议图片尺寸为：120*85</td>
				<td></td>
			</tr>
			<tr>
				<th style="width: 10em;">商品图片3:</th>
				<td><input type="file" id="logopath" name="logopath" class="t_input" /><br/> * 允许上传图片类型为：jpg | gif | png<br/> * 允许上传最大图片为：512KB<br/> * 建议图片尺寸为：120*85</td>
				<td></td>
			</tr>
			<tr>
				<th style="width: 10em;">状态:</th>
				<td>
					<input type="radio" name="onoff" value="Y" checked="checked" />正常
					<input type="radio" name="onoff" value="N" />促销
					<input type="radio" name="onoff" value="N" />下架</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">&nbsp;</th>
				<td>
					<input type="button" name="button" onclick="check();" value=" 保 存 " class="submit" />
					<input type="button" name="button" onclick="javascript:history.back()" value=" 返 回 " class="submit" />
				</td>
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