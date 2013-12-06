<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>送每家 - 网上订单|日常生活用品|快速送货到家</title>
	<meta name="Description" content="送每家为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
	<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" />
	<link rel="shortcut icon" href="favicon.ico" />
	<link href="css/global.css" rel="stylesheet" type="text/css" />
	<link href="css/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="/user/top1.jsp" %>
<form id="loginform" name="loginform" action="${ctx}/userAction.do?method=forgotpwd" method="post" class="c_form">
	<input type="hidden" name="sign" value="3"/>
	<input type="hidden" name="token" value="${token}"/>
	<input type="hidden" name="type" value="${type}"/>
	<input type="hidden" id="state" value=""/>
	<table cellpadding="0" cellspacing="0" class="formtable">
		<caption>
			<h2>找回密码</h2>
			<c:choose>
				<c:when test="${type eq 'sendemail'}">
					<p>请输入您的用户名，我们将发送一封邮件到您注册时填写的保密邮箱。</p>
				</c:when>
				<c:when test="${type eq 'checkcode'}">
					<p>我们已发送了一封邮件到您的保密邮箱请注意查收，并填写验证码。</p>
				</c:when>
				<c:when test="${type eq 'changepwd'}">
					<p>您已通过身份验证，请设置您的新密码。</p>
				</c:when>
			</c:choose>
		</caption>
		<tbody>
			<tr>
				<td colspan="2" class="flowsteps">
					<ol class="num4">
						<li<c:choose><c:when test="${type eq 'sendemail'}"> class="current"</c:when><c:otherwise> class="done"</c:otherwise></c:choose>><span class="first">1.输入用户名</span></li>
						<li<c:choose><c:when test="${type eq 'sendemail'}"> class="next"</c:when><c:when test="${type eq 'checkcode'}"> class="current"</c:when><c:otherwise> class="done"</c:otherwise></c:choose>><span>2.验证身份</span></li>
						<li<c:choose><c:when test="${type eq 'checkcode'}"> class="next"</c:when><c:when test="${type eq 'changepwd'}"> class="current"</c:when></c:choose>><span>3.重置密码</span></li>
						<li<c:if test="${type eq 'changepwd'}"> class="next"</c:if>><span class="last">4.完成</span></li>
					</ol><br/>
				</td>
			</tr>
			<c:choose>
				<c:when test="${type eq 'sendemail'}">
					<tr><th width="100"><label for="username">用户名</label></th><td><input type="text" name="username" id="username" size="30" class="t_input" tabindex="2" onblur="existsName()"/></td></tr>
				</c:when>
				<c:when test="${type eq 'checkcode'}">
					<tr><th width="100">您的邮箱</th><td>${email}</td></tr>
					<tr><th width="100">验证码</th><td><input type="text" name="checkcode" id="checkcode" size="10" class="t_input" tabindex="2" /></td></tr>
				</c:when>
				<c:when test="${type eq 'changepwd'}">
					<tr><th width="100">新密码</th><td><input type="password" name="password1" id="password1" size="20" class="t_input" tabindex="2" /></td></tr>
					<tr><th width="100">再次输入</th><td><input type="password" name="password2" id="password2" size="20" class="t_input" tabindex="2" /></td></tr>
				</c:when>
			</c:choose>
		</tbody>
		<tr><th width="100">&nbsp;</th><td><input type="button" value=" 下一步 " class="submit" onclick="subform();" tabindex="5" /></td></tr>
	</table>
</form>
<div class="c_form">
	<table cellpadding="0" cellspacing="0" class="formtable">
		<caption>
			<c:choose>
				<c:when test="${type eq 'sendemail'}">
					<h2>用户名忘记了吗？</h2>
					<p>您的用户名有可能是您的QQ号码或邮箱哦！</p>
					<p>您的用户名长度是6-20位哦！</p>
				</c:when>
				<c:when test="${type eq 'checkcode'}">
					<h2>无法收到验证码？</h2>
					<p>验证码邮件可能在垃圾邮箱中，请仔细查找。</p>
					<p>由于网络原因，可能会有延迟。如果您10分钟还没有收到邮件，请重新发送。</p>
					<p>联系客服，由客服人员帮您处理。</p>
				</c:when>
				<c:when test="${type eq 'changepwd'}">
					<h2>密码规则</h2>
					<p>密码不得少于6个字符，不得超过20个字符。</p>
					<p>密码首尾的空字符将被忽略。</p>
					<p>本平台密码经多次MD5加密和随机字符串混合加密。</p>
				</c:when>
			</c:choose>
		</caption>
	</table>
</div>
<%@include file="/commons/footer.jsp" %>
<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript">
	
	function  existsName(){
	var username = document.getElementById("username").value;
	   var ajax = new Ajax('username','${ctx}');
					ajax.getSend('${ctx}/userAction.do?method=checkusername&username='+username,function(s){
					var xml = new Xml(s);
					var items = xml.getElements("result");
					for(i=0;i<items.length;i++){
				           var node = items[i].attributes[0].nodeValue;
				           if(node == "YES"){
				            alert("用户名不存在,请确认是否输入正确!");
				            return;
				          }
			        }
		         });
	    }
		function subform(){
			<c:choose>
				<c:when test="${type eq 'sendemail'}">
					var username = document.getElementById("username").value;
					if(username.length<6 || username.length>20){
						alert("用户名未填写或不合法！");
						return;
					}
				</c:when>
				<c:when test="${type eq 'checkcode'}">
					var checkcode = document.getElementById("checkcode").value;
					if(checkcode.length!=6){
						alert("请填写6位合法验证码！");
						return;
					}
				</c:when>
				<c:when test="${type eq 'changepwd'}">
					var password1 = document.getElementById("password1").value;
					var password2 = document.getElementById("password2").value;
					if(password1.length<6 || password1.length>20){
						alert("请输入合法新密码！");
						return;
					}
					if(password1!==password2){
						alert("两次输入密码不一致！");
						return;
					}
				</c:when>
			</c:choose>
			document.loginform.submit();
		}
	</script>
</body>
</html>