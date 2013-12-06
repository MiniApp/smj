<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>送每家 - 网上订单|日常生活用品|快速送货到家</title>
	<meta name="Description" content="送每家为你提供丰富的日常生活用品，您通过网上订到需要的日常生活用品，使商品快速送货到家，开启网上购买新生活" />
	<meta name="Keywords" content="网上超市，网络购物，日常家居生活用品" />
<style type="text/css">
<!--
body {margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px;}
.submitsa,.submitsb {padding: 0 5px; margin: 0 0 0 3px;height:28px;line-height:30px;font-size:14px;font-weight:bold;color:#47749b;background:url(${ctx}/images/btnbg1.gif) no-repeat;border:none;}
.submitsa{width:70px;}
-->
</style>
<link href="css/global.css" rel="stylesheet" type="text/css" />
<link href="css/loginregfpswd.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="/user/top.jsp" %>
<table cellspacing="0" cellpadding="0" class="mainnav sugu_table">
  <tr><td colspan="3">&nbsp;</td></tr>
  <tr>
    <TD width="25%">&nbsp;</TD>
    <td width="50%" valign="top" align="center">
        <div class="normlogregbox">
        	<div class="titnav">
            	<div class="lft" align="left"><span class="font_16px_green">商户登录</span></div>
                <div class="rgt"></div>
                <div class="clr"></div>
        	</div>
            <div class="connav">
            <c:if test="${!empty errorMsg}">${errorMsg}</c:if>
            <input type="hidden" id="token" name="token" value="${token}"/>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formloginregnav">
            	<tr>
                	<td width="28%" align="right" height="40">${message}</td>
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
                	<td ><input class="submitsa" type="submit" name="submit" value="登 录" onclick="checkForm();" />
	                	&nbsp;&nbsp;<input class="submitsb" type="button" onclick="register();" value="注册店铺"></td>
	                <td>&nbsp;</td>
              	</tr>
            </table>
            
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
<%@include file="/commons/footer.jsp" %>
<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
    var error = "${errorMsg}";
	if(error == "success"){
	    window.location.href="merchantAction.do?method=index";
	}
	
    document.getElementById("username").focus();
    
	function register(){
		window.location.href ="merchantAction.do?method=mregister";
	}
	function showSec(){
		document.getElementById("img_seccode").src='userAction.do?method=seccode&'+Math.random();
	}
	function checkForm(){
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		var seccode = document.getElementById("seccode").value;
		if(regCheck(username)){
			alert("请输入帐号！");
			document.getElementById("username").focus();      
			return;
		}else if(regCheck(password)){
		     alert("请输入密码！");
		     document.getElementById("password").focus();
		     return;
		}
		else if(regCheck(seccode)){
		     alert("请输入验证码！");
		     document.getElementById("seccode").focus();
		     return;
		}
		
		$(function() {
			   $.ajax({
			     async:false,
			     cache:false,
			     type:'POST',
			     dataType:"json",
			     data:{username:username,password:password},
			     url : "${ctx}/merchantAction.do?method=login",
			     success:function(){
			           window.location.reload();
			     } 
			   });
			   });
	}
	function regCheck(mes){
		var reg = /\S+/;
		if(!reg.test(mes)){
       		return true;
       	}else{
       		return false;
       	}
	}
</script>
</body>
</html>