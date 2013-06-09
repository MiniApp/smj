<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>尚佰味网 - 天津外卖|网上订餐|快餐网|盒饭便当配送</title>
<meta name="Description" content="尚佰味网为您提供丰富的外卖,盒饭菜谱，您可以通过网上订餐，电话订餐等方式订到喜欢的饭菜。为您奉献天津24小时送餐业务。使您随时随地能吃上可口的饭菜。" />
<meta name="Keywords" content="sunbyway,天津快餐,天津外卖,天津订餐,天津送餐,天津美食,天津小吃,外卖网,送餐网,快餐,盒饭,网上订餐,天津24小时外卖,外卖电话,盒饭配送,快餐外卖,快餐送餐,尚佰味网,尚佰味" />
<link rel="shortcut icon" href="${ctx}/favicon.ico"/>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="/user/top.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox"><tr><td>
<div id="wrap">
	<%@include file="/user/left.jsp" %>
   	<div id="mainarea">
   	<%@include file="/user/header.jsp" %>
   	<form method="post" action="${ctx}/userAction.do?method=user" class="c_form" name="userform">
   		<table cellspacing="0" cellpadding="0" class="formtable">
			<tr>
				<th style="width: 10em;">您的登录用户名:</th>
				<td>${sGlobal.sugu_username} (<a href="${ctx}/user/password.jsp">修改登录密码</a>)</td>
				<td></td>
			</tr>
			<tr>
				<th style="width: 10em;">真实姓名:</th>
				<td>
			 
					 ${user.name} 
				 
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">固话:</th>
				<td><input type="text" class="t_input" name="telephone" value="${user.mobile}" /></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">手机:</th>
				<td><input type="text" class="t_input" id="mobile" name="mobile" value="${user.mobile}" /></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">QQ:</th>
				<td><input type="text" class="t_input" name="qq" value="${user.qq}" /></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">&nbsp;</th>
				<td>
					<input type="hidden" name="type" value="Y"/>
					<input type="button" name="button" onclick="check();" value="保 存" class="submit" />
				</td>
				<td>&nbsp;</td>
			</tr>
		</table>
   	</form>
   	</div>
</div>
</td></tr></table>
<%@include file="/commons/footer.jsp" %>
<script type="text/javascript">
	setTimeout("loadsysmes()",5000);
	function check(){
		var mobile = document.getElementById("mobile").value;
		 
		var name = document.getElementById("name").value;
		if(name.length<2 || name.length>10){
			alert("真实姓名非法！");
			return;
		}
		 
		if(mobile.length<11){
			alert("手机号码非法！");
			return;
		}
		document.userform.submit();
	}
</script>
</body>
</html>