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
</head>
<body>
<%@include file="/user/top1.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainbox"><tr><td>
<div id="wrap">
	<%@include file="/user/left.jsp" %>
   	<div id="mainarea">
   	<%@include file="/user/header.jsp" %>
     <table cellspacing="0" cellpadding="0" class="formtable">
			<tr>
				<th style="width: 10em;">您的登录用户名:</th>
				<td><input type="text" id="name" name="name" value="${user.name}" class="t_input" readonly=true style="border:0px solid #000000"/>(<a href="${ctx}/user/password.jsp">修改登录密码</a>)</td>
				<td></td>
			</tr>
			<tr>
				<th style="width: 10em;">真实姓名:</th>
				<td><input type="text" id="nichname" name="nickname" value="${sGlobal.smj_username}" class="t_input" readonly=true style="border:0px solid #000000"/></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">固话:</th>
				<td><input type="text" class="t_input" id="telephone"  name="telephone" value="${user.telephone}" /></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">手机:</th>
				<td><input type="text" class="t_input" id="mobile" name="mobile" value="${user.mobile}" /></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th style="width: 10em;">QQ:</th>
				<td><input type="text" class="t_input" id="qq" name="qq" value="${user.qq}" /></td>
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
   	</div>
</div>
</td></tr></table>
<%@include file="/commons/footer.jsp" %>
<script type="text/javascript" src="${ctx}/js/jquery-1.3.2.min.js"></script>
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
	    
	    var nickname = document.getElementById("nichname").value;
	    var telephone = document.getElementById("telephone").value;
	    var qq = document.getElementById("qq").value;
	    
	     $(function() {
	     $.ajax({
	     async:false,
	     cache:false,
	     type:'POST',
	     dataType:"json",
	     data:{name:name,nickname:nickname,mobile:parseInt(mobile),telephone:parseInt(telephone),qq:parseInt(qq)},
	     url : "userAction.do?method=updateuser",
	     success:function(){  
	     } 
	   });
	   });
	   
	   alert("设置成功!请重新登录生效！");
	   window.location.href = "${ctx}/userAction.do?method=userinfo";
	}
</script>
</body>
</html>