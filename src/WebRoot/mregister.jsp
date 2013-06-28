<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="x-ua-compatible" content="ie=7">
<title>尚佰味网 - 天津外卖|网上订餐|快餐网|盒饭便当配送</title>
<meta name="Description" content="尚佰味网为您提供丰富的外卖,盒饭菜谱，您可以通过网上订餐，电话订餐等方式订到喜欢的饭菜。为您奉献天津24小时送餐业务。使您随时随地能吃上可口的饭菜。" />
<meta name="Keywords" content="sunbyway,天津快餐,天津外卖,天津订餐,天津送餐,天津美食,天津小吃,外卖网,送餐网,快餐,盒饭,网上订餐,天津24小时外卖,外卖电话,盒饭配送,快餐外卖,快餐送餐,尚佰味网,尚佰味" />
<link rel="shortcut icon" href="${ctx}/favicon.ico">
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/loginregfpswd.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="/user/top.jsp" %>
<div class="toptxtnav"><span class="topregflow">加盟步聚：<span class="font_col_f60">填写资料</span> -> 资料审核 -> 加盟成功</span>餐饮店<span class="font_col_f60">火热</span>加盟</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mainnav">
  <tr>
    <td valign="top">
        <form name="regform" id="regform" method="post" action="${ctx}/merchantAction.do?method=register" onsubmit="return checkForm();">
        <input type="hidden" id="token" name="token" value="${token}"/>
        <div class="normboxnav">
        	<div class="titnav">
            	<div class="lft">商户资料<span class="font_col_gray">（均为必填项）</span></div>
                <div class="rgt"></div>
                <div class="clr"></div>
        	</div>
            <div class="connav">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formloginregnav">
              <tr>
                <td width="110" align="right" height="40">公司名称：</td>
                <td width="200"><input name="company_name" id="company_name" onblur="checkEmpty('ms1');" type="text" size="25" maxlength="50" class="inviteipt" align="absmiddle" /></td>
                <td width="580"><span id="ms1" class="normalmsg">营业执照登记公司名称（50字以内）</span></td>
              </tr>
              <tr>
                <td align="right" height="40">法人姓名：</td>
                <td><input name="user_name" id="user_name" onblur="checkEmpty('ms2');" type="text" size="25" maxlength="10" class="inviteipt" align="absmiddle" /></td>
                <td><span id="ms2" class="normalmsg">营业执照登记法人姓名（10字以内）</span></td>
              </tr>
              <tr>
                <td align="right" height="40">证件类型：</td>
                <td><select name="paper_type" id="paper_type"><option value="0"> 营业执照 </option></select></td>
                <td><span id="ms3" class="normalmsg">仅支持营业执照</span></td>
              </tr>
              <tr>
                <td align="right" height="40">证件编号：</td>
                <td><input name="paper_no" id="paper_no" type="text" size="25" onblur="checkEmpty('ms4');" maxlength="50" class="inviteipt" align="absmiddle" /></td>
                <td><span id="ms4" class="normalmsg">营业执照编号（50字以内）</span></td>
              </tr>
              <tr>
                <td align="right" height="40">公司地址：</td>
                <td><input name="address" id="address" type="text" onblur="checkEmpty('ms5');" size="25" maxlength="50" class="inviteipt" align="absmiddle" /></td>
                <td><span id="ms5" class="normalmsg">公司详细地址（50字以内）</span></td>
              </tr>
            </table>
            </div>
            <div class="botnav">
            	<div class="lft"></div>
                <div class="rgt"></div>
                <div class="clr"></div>
            </div>
        </div>
        <div class="normboxnav">
        	<div class="titnav">
            	<div class="lft">联系资料<span class="font_col_gray">（均为必填项）</span></div>
                <div class="rgt"></div>
                <div class="clr"></div>
        	</div>
            <div class="connav">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formloginregnav">
              <tr>
                <td width="110" align="right" height="40">负 责 人：</td>
                <td width="200"><input name="user" id="user" onblur="checkEmpty('ms6');" type="text" size="25" maxlength="10" class="inviteipt" align="absmiddle" /></td>
                <td width="580"><span id="ms6" class="normalmsg">负责人姓名（10字以内）</span></td>
              </tr>
              <tr>
                <td align="right" height="40">联系电话：</td>
                <td><input name="telephone" id="telephone" onblur="checkEmpty('ms7');" type="text" size="25" maxlength="20" class="inviteipt" align="absmiddle" /></td>
                <td><span id="ms7" class="normalmsg">请正确填写您的联系方式，以便客服与您联系</span></td>
              </tr>
              <tr>
                <td align="right" height="40">超级账号：</td>
                <td><input type="text" name="username" id="username" onblur="checkUserName();" size="25" maxlength="20" class="inviteipt" align="absmiddle" /></td>
                <td><span id="ms8" class="normalmsg">商户超级账号，20位以内数字、字母组合</span></td>
              </tr>
              <tr>
                <td align="right" height="40">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
                <td><input type="password" name="password" id="password" onblur="checkEmpty('ms9');" size="25" maxlength="20" class="inviteipt" align="absmiddle" /></td>
                <td><span id="ms9" class="normalmsg">6至20位字符串组合</span></td>
              </tr>
              <tr>
                <td align="right" height="40">重复密码：</td>
                <td><input type="password" name="password1" id="password1" onblur="checkEmpty('ms10');" size="25" maxlength="20" class="inviteipt" align="absmiddle" /></td>
                <td><span id="ms10" class="normalmsg">6至20位字符串组合</span></td>
              </tr>
            </table>
            <div style="margin:10px 0 0; padding:10px 0; border-top:#d2e5ef 1px solid;">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formloginregnav">
              <tr>
                <td width="110" align="right" height="20">验 证 码：</td>
                <td width="200"><input name="seccode" id="seccode" type="text" size="25" class="inviteipt" align="absmiddle" /></td>
                <td width="580"><img src="${ctx}/userAction.do?method=seccode" align="absmiddle" border="0" alt="验证码" id="img_seccode"/>&nbsp;<a href="javascript:showSec()">看不清楚，换张图片</a></td>
              </tr>
            </table>
            </div>
            </div>
            <div class="botnav">
            	<div class="lft"></div>
                <div class="rgt"></div>
                <div class="clr"></div>
            </div>
        </div>
        <div style="text-align:center; font-size:14px;">
        <input name="isRead" id="isRead" value="1" type="checkbox" /> <a href="${ctx}/service.jsp" target="_blank" style="color:#000; text-decoration:underline;">点击阅读服务条款</a><br />
        <input class="regsubmit" name="submit" value="同意服务条款，提交审核" type="submit" />
        </div>
        </form>
    </td>
  </tr>
</table>
<%@include file="/user/footer.jsp" %>
<script type="text/javascript">
<!--
	var companyN=userN=paperN=addR=usE=teL=lastUserName=pwD='';
	function showSec(){
		document.getElementById("img_seccode").src='${ctx}/userAction.do?method=seccode&'+Math.random();
	}
	//用户名校验
	function checkUserName() {
		var userName = document.getElementById('username').value;
		if(userName == lastUserName) {
			return;
		} else {
			lastUserName = userName;
		}
		var reg = /^([a-zA-Z0-9]){3,20}$/;
		if(!reg.test(userName)){
			document.getElementById('ms8').className = "errmsg";
            document.getElementById('ms8').innerHTML = "该用户名不符合规则";
       		return;
       	}
       	ajaxresponse('ms8', 'method=checkUserName&username='+encodeURIComponent(userName));
	}
	function ajaxresponse(objname, data) {
		var ajax = new Ajax(objname,'${ctx}');
		ajax.postSend('${ctx}/merchantAction.do',data,function(s){
			var obj = document.getElementById(objname);
			if(s=="Y"){
				obj.className="errmsg";
				obj.innerHTML="该用户名已被占用";
			}else if(s=="E"){
				obj.className="errmsg";
				obj.innerHTML="该用户名不符合规则";
			}else{
				obj.className="normalmsg";
				obj.innerHTML='<img src="${ctx}/images/right.gif" align="absmiddle" border="0" alt="通过" />';
			}
		});
	}
	function checkEmpty(mid){
		if(mid=="ms1"){
			var ms = document.getElementById('company_name').value;
			if(ms == companyN)return;else companyN = ms;regStr(mid,ms);
		}else if(mid=="ms2"){
			var ms = document.getElementById('user_name').value;
			if(ms == userN)return;else userN = ms;regStr(mid,ms);
		}else if(mid=="ms4"){
			var ms = document.getElementById('paper_no').value;
			if(ms == paperN)return;else paperN = ms;regStr(mid,ms);
		}else if(mid=="ms5"){
			var ms = document.getElementById('address').value;
			if(ms == addR)return;else addR = ms;regStr(mid,ms);
		}else if(mid=="ms6"){
			var ms = document.getElementById('user').value;
			if(ms == usE)return;else usE = ms;regStr(mid,ms);
		}else if(mid=="ms7"){
			var ms = document.getElementById('telephone').value;
			if(ms == teL)return;else teL = ms;regStr(mid,ms);
		}else if(mid=="ms9"){
			var ms = document.getElementById('password').value;
			if(ms == pwD)return;else pwD = ms;regStr(mid,ms);
		}else if(mid=="ms10"){
			var ms = document.getElementById('password').value;
			var ms1 = document.getElementById('password1').value;
			var obj = document.getElementById(mid);
			if(ms!==ms1){
				obj.className = "errmsg";
            	obj.innerHTML = "两次输入的密码不一致";
			}else{
				obj.className="normalmsg";
				obj.innerHTML='<img src="${ctx}/images/right.gif" align="absmiddle" border="0" alt="通过" />';
			}
		}
	}
	function regStr(mid,mes){
		var reg = /\S+/;
		var obj = document.getElementById(mid);
		if(!reg.test(mes)){
			obj.className = "errmsg";
            obj.innerHTML = "该项为必填项，请认真填写";
       		return;
       	}else{
       		obj.className="normalmsg";
			obj.innerHTML='<img src="${ctx}/images/right.gif" align="absmiddle" border="0" alt="通过" />';
       	}
	}
	function checkForm(){
		if(regCheck(companyN)||regCheck(userN)||regCheck(paperN)||regCheck(addR)||regCheck(usE)||regCheck(teL)||regCheck(lastUserName)||regCheck(pwD)){
			alert("请认真填写商家资料");
			return false;
		}else{
			var ms1 = document.getElementById('password1').value;
			var isRead = document.getElementById('isRead').checked;
			if(ms1===pwD && isRead)return true;
			else {alert("请认真填写商家资料");return false;}
		}
	}
	function regCheck(mes){
		var reg = /\S+/;
		if(!reg.test(mes)){
       		return true;
       	}else{
       		return false;
       	}
	}
//-->
</script>
</body>
</html>