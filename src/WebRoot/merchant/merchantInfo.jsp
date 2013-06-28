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
   	<h2 class="title"><img src="${ctx}/images/space.gif" class="icon1"/>商户信息</h2>
   	<form method="post" action="${ctx}/merchantAction.do?method=updateMerchantInfo" class="c_form" name="userform">
   	<input type="hidden" id="token" name="token" value="${token}"/>
   		<table cellspacing="0" cellpadding="0" class="formtable">
			<tr>
				<th style="width: 10em;">商户名称:</th>
				<td>${company.company_name}</td>
				<td></td>
			</tr>
			<tr>
				<th style="width: 10em;">法人姓名:</th>
				<td>${company.user_name}</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">证件类型:</th>
				<td>${sugu:sysDictionary("COMPANY_PAPER_TYPE_",company.paper_type)}</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">证件号码:</th>
				<td>${company.paper_no}</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">联&nbsp;系&nbsp;人:</th>
				<td><input type="text" name="user" id="user" size="20" class="t_input" value="${company.user}"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">联系电话:</th>
				<td><input type="text" name="telephone" id="telephone" class="t_input" size="20" value="${company.telephone}"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">公司地址:</th>
				<td><textarea name="address" id="address" cols="60" rows="2" class="t_input">${sugu:htmlSpecialChars(company.address)}</textarea></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">审核状态:</th>
				<td>${sugu:sysDictionary("COMPANY_COMPANY_TYPE_",company.company_type)}</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">加盟日期:</th>
				<td>${company.create_date}</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">&nbsp;</th>
				<td>
					<input type="button" name="button" onclick="check();" value=" 保 存 " class="submit" />
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
	setTimeout("loadsysmes()",5000);
	function check(){
		var address = document.getElementById('address').value;
		var user = document.getElementById('user').value;
		var telephone = document.getElementById('telephone').value;
		if(address==""||user==""||telephone==""){
			alert("请认真填写商户资料！");
			return false;
		}
		document.userform.submit();
	}
</script>
</body>
</html>