<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>宋美佳系统控制台</title>
<style type="text/css">
<!--
body {margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px;}
.submits {width:75px; height:28px; line-height:30px; font-size:14px; font-weight:bold; color:#47749b; background:url(${ctx}/images/btnbg1.gif) no-repeat; border:0;}
-->
</style>
<link href="css/global.css" rel="stylesheet" type="text/css" />
<link href="css/loginregfpswd.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="top.jsp" %>
<table cellspacing="0" cellpadding="0" class="mainnav sugu_table">
  <tr><td colspan="3">&nbsp;</td></tr>
  <tr>
    <TD width="25%">&nbsp;</TD>
    <td width="50%" valign="top" align="center">
        <div class="normlogregbox">
        	<div class="titnav">
            	<div class="lft" align="left"><span class="font_16px_green">系统管理员登录</span></div>
                <div class="rgt"></div>
                <div class="clr"></div>
        	</div>
            <div class="connav">
            <form action="systemAction.do?method=sindex" method="post" name="loginform">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formloginregnav">
            	<tr>
                	<td width="28%" align="right" height="40">&nbsp;</td>
                	<td>&nbsp;</td>
                	<td width="15%">&nbsp;</td>
              	</tr>
              	<tr height="40">
                	<td align="right" height="40">账　号：</td>
                	<td><input name="username" id="username" type="text" size="25" class="inviteipt" align="absmiddle" /></td>
                	<td>&nbsp;</td>
              	</tr>
              	<tr height="50">
                	<td align="right" height="40">密　码：</td>
                	<td><input name="password" id="password" type="password" size="25" class="inviteipt" align="absmiddle" /></td>
                	<td>&nbsp;</td>
              	</tr>
              	<tr height="50">
                	<td align="right" height="40">验证码：</td>
                	<td>
                		<input name="seccode" id="seccode" type="text" size="9" class="inviteipt" align="absmiddle" />
                		<img src="userAction.do?method=seccode" align="absmiddle" border="0" alt="验证码" id="img_seccode"/><br/><a href="javascript:showSec()">看不清楚，换张图片</a>
                	</td>
                	<td>&nbsp;</td>
              	</tr>
              	<tr height="40">
                	<td >&nbsp; </td>
                	<td ><input class="submits" type="submit" name="submit" value="登 录" /></td>
	                <td>&nbsp;</td>
              	</tr>
            </table>
            </form>
            </div>
            <div class="botnav">
            	<div class="lft"></div>
                <div class="rgt"></div>
                <div class="clr"></div>
            </div>
        </div>
       </td>  
       <TD width="25%">&nbsp;</TD>
  </tr>
</table>
<script type="text/javascript">
	function showSec(){
		document.getElementById("img_seccode").src='userAction.do?method=seccode&'+Math.random();
	}
	function checkForm(){
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		var seccode = document.getElementById("seccode").value;
		if(regCheck(username)||regCheck(password)||regCheck(seccode)){
			alert("请认真填写账户信息");
			return false;
		}else return true;
	}
	function regCheck(mes){
		var reg = /\S+/;
		if(!reg.test(mes)){
       		return true;
       	}else{
       		return false;
       	}
	}
	
	var msg = "${errorMsg}";
 	    if(msg != ""){
	         alert(msg);
	         $("#username").focus();
	     }
</script>
</body>
</html>