<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>宋美佳 - 网上订单|日常生活用品|快速送货到家</title>
	<meta name="Description" content="宋美佳为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
	<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" />
	<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script>
	<link rel="shortcut icon" href="${ctx}/favicon.ico" />
	<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/css/store.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/css/user.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="/user/top.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox"><tr><td>
<div id="wrap">
	<%@include file="/user/left.jsp" %>
   	<div id="mainarea">
   	<h2 class="title"><img src="${ctx}/images/space.gif" class="icon3"/>我的订单</h2>
<form action="${ctx}/userAction.do?method=getUserOrderList" method="post" name="myform">
<div class="billnav">
	<a class="addUserAddress" href="${ctx}/userAction.do?method=addUserAddress">增加</a>
</div>
<div>
    <table id="bill_table" width="100%" border="1" bordercolor="#cccccc" cellspacing="0" cellpadding="0" class="caicardetail">
      <thead>
      <tr>
        <td class="tit" width="80%" align="center">地址</td>
        <td class="tit" width="20%" align="center">操作</td>
      </tr>
      </thead>
      <tr>
      	<td>2222</td>
      	<td><input type="radio" name="address" value="Y" checked="checked" />设为默认地址</td>
      </tr>
       <tr>
      	<td>2222</td>
      	<td><input type="radio" name="address" value="Y" />设为默认地址</td>
      </tr>
    </table>
</div>
</form>
   	</div>
</div>
</td></tr></table>
<%@include file="/user/footer.jsp" %>
<script type="text/javascript">
	setTimeout("loadsysmes()",5000);
	function page_check(tno){
		var reg = /^\d+$/;
		var p_no;
		if(tno) p_no=tno;
		else p_no = document.getElementById("p_no").value;
		if(!reg.test(p_no)){
       		alert("请输入有效页数字!");
       		document.getElementById("p_no").value="";
       		return;
       	}
       	document.getElementById("p_no").value=p_no;
		document.myform.submit();
	}
	function cui_bill(id){
		if(id=="")return;
		var ajax = new Ajax('sysid','${ctx}');
		ajax.getSend('${ctx}/userAction.do?method=cuiBill&id='+id,function(s){
			var xml = new Xml(s);
			var result = xml.getElements("result");
			if(result[0].attributes[0].nodeValue=="C"){
				alert("催单间隔未满5分钟！");
			}else if(result[0].attributes[0].nodeValue=="B"){
				alert("下单未满20分钟！");
			}else if(result[0].attributes[0].nodeValue=="Y"){
				alert("催单成功！");
			}else if(result[0].attributes[0].nodeValue=="N"){
				alert("催单失败，请重试 或 电话催单！");
			}else if(result[0].attributes[0].nodeValue=="A"){
				alert("该订单不可催单，请检查订单信息！");
			}
		});
	}
	function update_bill(id){document.location="${ctx}/userAction.do?method=getUserOrderList&type=U&id="+id;}
</script>
</body>
</html>