<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>送每家 - 网上订单|日常生活用品|快速送货到家</title>
	<meta name="Description" content="送每家为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
	<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" /><link rel="shortcut icon" href="favicon.ico" />
	<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/css/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
 <%@include file="/user/top1.jsp"%>
	<table cellpadding="0" cellspacing="0" class="formtable">
		<caption>
			<h2>请登录</h2>
			<p>如果您在本站已拥有帐号，请使用已有的帐号信息直接进行登录即可，不需重复注册。</p>
		</caption>
		<tbody>
			<tr>
				<th width="100"><label for="username">用户名</label></th>
				<td><input type="text" name="usernames" id="usernames" class="t_input" tabindex="2"/></td>
			</tr>
			<tr>
				<th width="100"><label for="password">密　码</label></th>
				<td><input type="password" name="password" id="password" class="t_input" tabindex="3" /></td>
			</tr>
			<tr>
				<th width="100">&nbsp;</th>
				<td><input type="checkbox" id="cookietime" name="cookietime" value="315360000" checked="checked" style="margin-bottom: -2px;" /><label for="cookietime">下次自动登录</label></td>
			</tr>
		</tbody>
		<tr>
			<th width="100">&nbsp;</th>
			<td>
				<input type="hidden" name="refer" value="${refer}" />
				<input type="submit" id="loginsubmit" name="loginsubmit" value="登录" class="submit" tabindex="5"  onclick="ulogin()"/>
				<a href="${ctx}/userAction.do?method=forgotpwd" target="_blank">忘记密码?</a>
			</td>
		</tr>
	</table>
<div class="c_form">
	<table cellpadding="0" cellspacing="0" class="formtable">
		<caption>
			<h2>还没有注册吗？</h2>
			<p>如果还没有本站的通行帐号，请先注册一个属于自己的帐号吧。</p>
		</caption>
		<tr>
			<td><a href="../uregister.jsp" style="display: block; margin: 0 110px 2em; 
			                                   width: 100px; border: 1px solid #486B26; 
			                                   background: #76A14F; line-height: 30px; 
			                                   font-size: 14px; text-align: center; text-decoration: none;">
			                                   <strong style="display: block; border-top: 1px solid #9EBC84; color:
			                                    #FFF; padding: 0 0.5em;">立即注册</strong></a>
			</td>
		</tr>
	</table>
</div>
<%@include file="/commons/footer.jsp" %>
<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
function ulogin(){
		var username = document.getElementById('usernames').value;
		var password = document.getElementById('password').value;
		if(username=='手机号|帐号|邮箱')
		{
		    alert("账号未填写!");
		    return;
		 }
		 else if(username == "")
		 {
		     alert("账号未填写!");
		     return;
		 }else if(password == "")
		 {
		    alert("密码未填写!");
		    return;
		 }
		 
		 $(function() {
	    $.ajax({
	     async:false,
	     cache:false,
	     type:'POST',
	     dataType:"json",
	     data:{usernames:username,password:password},
	     url:"${ctx}/userAction.do?method=login",
	     success:function(){
	     } 
	   });
	   });
	   
	    window.location.href = "${ctx}/userAction.do?method=index";
	   
}
</script>
</body>
</html>