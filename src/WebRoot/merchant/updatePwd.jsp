<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>尚佰味网 - 天津外卖|网上订餐|快餐网|盒饭便当配送</title>
	<meta name="Description" content="尚佰味网为您提供丰富的外卖,盒饭菜谱，您可以通过网上订餐，电话订餐等方式订到喜欢的饭菜。为您奉献天津24小时送餐业务。使您随时随地能吃上可口的饭菜。" />
	<meta name="Keywords" content="sunbyway,天津快餐,天津外卖,天津订餐,天津送餐,天津美食,天津小吃,外卖网,送餐网,快餐,盒饭,网上订餐,天津24小时外卖,外卖电话,盒饭配送,快餐外卖,快餐送餐,尚佰味网,尚佰味" />
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
   	<h2 class="title"><img src="${ctx}/images/space.gif" class="icon6"/>更改密码</h2>
   	<form method="post" action="${ctx}/merchantAction.do?method=updatePassword" class="c_form" name="userform">
   		<table cellspacing="0" cellpadding="0" class="formtable">
			<caption>
    		<h2>我的登录密码</h2>
    		<p>修改密码后，您需要重新登陆一次。</p>
   			</caption>
   			<tr>
    			<th width="100">旧密码</th>
    			<td><input type="password" id="password" name="password" class="t_input" /></td>
   			</tr>
   			<tr>
    			<th>新密码</th>
    			<td><input type="password" id="newpasswd1" name="newpasswd1" class="t_input">最少6个字符，最长不超过20个字符</td>
   			</tr>
   			<tr>
    			<th>确认新密码</th>
    			<td><input type="password" id="newpasswd2" name="newpasswd2" class="t_input"></td>
   			</tr>
   			<tr>
    			<th>&nbsp;</th>
    			<td><input type="button" onclick="check();" name="pwdsubmit" value="修改密码" class="submit" /></td>
   			</tr>
		</table>
   	</form>
   	</div>
</div>
</td></tr></table>
<%@include file="footer.jsp" %>
<script type="text/javascript">
	function check(){
		var password = document.getElementById("password").value;
		var newpasswd1 = document.getElementById("newpasswd1").value;
		var newpasswd2 = document.getElementById("newpasswd2").value;
		if(password.length<6 || password.length>20){
			alert("请输入旧密码！");
			return;
		}
		if(newpasswd1.length<6 || newpasswd1.length>20){
			alert("请输入合法新密码！");
			return;
		}
		if(newpasswd1!==newpasswd2){
			alert("两次输入密码不一致！");
			return;
		}
		document.userform.submit();
	}
</script>
</body>
</html>