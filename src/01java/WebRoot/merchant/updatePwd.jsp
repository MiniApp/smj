<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>送每家 - 网上订单|日常生活用品|快速送货到家</title>
<meta name="Description" content="送每家为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" /><link rel="shortcut icon" href="${ctx}/favicon.ico"/>
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
		if(password == newpasswd1 || password == newpasswd2)
		{
		    alert("旧密码和新密码不能相同！");
		    return;
		}
		document.userform.submit();
	}
</script>
</body>
</html>